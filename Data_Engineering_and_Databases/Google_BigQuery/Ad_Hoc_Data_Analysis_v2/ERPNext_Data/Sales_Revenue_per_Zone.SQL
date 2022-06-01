with
delivery_note_with_index as (
                              SELECT *, 
                              row_number()over(partition by name order by modified desc) as index 
                              FROM `kyosk-prod.erp_reports.delivery_note`
                              ),
warehouse_locations as (
                        select 'Athi River' as territory, -1.4275556 as warehouse_latitude, 36.9704444 as warehouse_longitude union all 
                        select 'Eastlands' , -1.3241389  , 36.867  union all
                        select 'Eldoret'  , 0.5201846  ,35.2563265  union all
                        select 'Embu'  , -0.54203   , 37.4542503  union all
                        select 'Juja'  , -1.1081111   ,37.0138611  union all
                        select 'Karatina'  , -0.4731389   ,  37.1262222  union all
                        select 'Kawangware'  , -1.28875   , 36.7517778  union all
                        select 'Kiambu'  ,  -1.2284444 ,  36.6881944 union all
                        select 'Kisii'  , -0.6713333  , 34.7678889  union all
                        select 'Kisumu1'  , -0.0879444  , 34.7596667  union all
                        select 'Majengo Mombasa'  , -4.0519167  ,39.6583611  union all
                        select 'Meru'  , -1.2770781  ,36.8146693  union all
                        select 'Mtwapa Mombasa'  , -3.9406389   ,39.7465278  union all
                        select 'Nakuru'  , -0.2829722   , 36.1188889  union all
                        select 'Ongata Rongai'  , -1.3989167  ,36.7250278  union all
                        select 'Ruai'  , -1.2285389  , 36.9890257  union all
                        select 'Ruiru'  , -1.2286944  ,36.9891111  union all
                        select 'Thika Rd'  , -1.2420833  ,36.8763611  union all
                        select 'Voi'  , -3.39025  ,38.57225
                        ),
dukas_and_warehouse_mashup as (
                                select distinct sowi.posting_date,
                                customer,
                                customer_name,
                                sowi.territory, 
                                cast(duka_latitude as float64) as duka_latitude, 
                                cast(duka_longitude as float64) as duka_longitude, 
                                warehouse_latitude, 
                                warehouse_longitude,
                                sum(dni.amount) as amount
                                from delivery_note_with_index sowi
                                cross join unnest(items) dni
                                left join warehouse_locations wl on sowi.territory = wl.territory 
                                where index = 1
                                and workflow_state in ('PAID')
                                group by 1,2,3,4,5,6,7,8
                                ),
model as (
          select *, 
          ST_GEOGPOINT(duka_longitude, duka_latitude) as duka_point, 
          ST_GEOGPOINT(warehouse_longitude,warehouse_latitude) as warehouse_point,
          round(st_distance(ST_GEOGPOINT(warehouse_longitude,warehouse_latitude), ST_GEOGPOINT(duka_longitude, duka_latitude)),0) as distance_in_metres,
          round(st_distance(ST_GEOGPOINT(warehouse_longitude,warehouse_latitude), ST_GEOGPOINT(duka_longitude, duka_latitude)),0) / 1000 as distance_in_kms
          from dukas_and_warehouse_mashup
          )
select *, case 
              when distance_in_kms >= 31 then 'Outer Zone'
              when distance_in_kms >= 11 then 'Middle Zone'
              else 'Inner Zone' 
          end as duka_zone
from model where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE