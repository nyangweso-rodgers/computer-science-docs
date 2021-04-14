/* This Query calculates actuals against distribution dbm set targets */
with dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2020-01-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sale_days as (select *,date_trunc(date,week) as week from dates), --where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
vars AS (
  SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
   -- SELECT DATE '2021-01-20' as current_start_date, DATE '2021-02-03' as current_end_date ),
date_vars as (select *,
    date_sub(current_start_date,interval 
              (case when FORMAT_DATE('%A',current_start_date) <> 'Sunday'  then date_diff(current_end_date,current_start_date,day)+1 
                    else date_diff(current_end_date,current_start_date,day)+1 end) 
                                    day) as previous_start_date,date_sub(current_start_date,interval 1 day) as previous_end_date,
    date_trunc(current_start_date,month) as mtd_start_date,current_end_date as mtd_end_date
    ,DATE_SUB(DATE_TRUNC(DATE_ADD(current_end_date, INTERVAL 1 MONTH), MONTH), INTERVAL 1 DAY) as end_month from vars
    ),
    
targets as (select * from `twigadms.dmslive.dbm_logistics_kpi`),
fleet as (select * from `twigadms.dmslive.logistics_fleet_registration_v2` ),
carrying_capacity as (select t.fleet_id,t.registration_number,product_type,product_name,product_id,packaging_unit,
      carrying_capacity,capacity,optimum_capacity as default_optimum_capacity 
          from fleet t
            left join  (select * from `twigadms.dmslive.logistics_carrying_capacity_v2`where active = true ) c 
                      on c.fleet_id = t.fleet_id

),
batches as (select b.*,product_type from `twigadms.dmslive.logistics_assigned_batches_v2` b
left join (select distinct product_id,product_name,product_type from  `twigadms.dmslive.cache_product_mapping`)
            p on p.product_name = b.product_name  
where active = true
and domain = 'Inbound'),

value_chain as (
            select a.delivery_date,registration_number,depot_name,route_name,p.route_id,p.route_plan_id,load_capacity,
            sum(a.weight) as weight
            from `twigadms.dmslive.views_dispatch_vehicle_stock_allocation` a
            left join `twigadms.dmslive.views_routing_route_plan` p on a.route_plan_id = p.route_plan_id 
            left join `twigadms.dmslive.views_routing_vehicle` v on v.vehicle_id = p.vehicle_id 
            left join dmslive.cache_route_mapping r on r.route_id = p.route_id 
            where a.active = true
            and p.active = true
            group by 1,2,3,4,5,6,7),
            

inbound as (select l.*,capacity,product_type,
time(cast(left(right(concat(0,arrival_time),4),2) as int64),cast(right(right(concat(0,arrival_time),4),2) as int64),00) as arrival_time_converted,
case 
when time(cast(left(right(concat(0,arrival_time),4),2) as int64),cast(right(right(concat(0,arrival_time),4),2) as int64),00) <= '03:00:00' and product_type = 'FFV' then 'ON-TIME' 
when time(cast(left(right(concat(0,arrival_time),4),2) as int64),cast(right(right(concat(0,arrival_time),4),2) as int64),00) <= '15:00:00' and product_type = 'FMCG' then 'ON-TIME'
else 'LATE' end as on_time,
(coalesce(l.lease_amount,0)+coalesce(fuel,0)+coalesce(cess,0)+coalesce(allowance,0)+coalesce(night_out,0)) as total_cost
from `twigadms.dmslive.logistics_longhaul_v2` l
left join fleet f on f.fleet_id  = l.fleet_id 
left join (select distinct longhaul_id,string_agg(distinct product_type,'/') as product_type,sum(shipped_weight) as shipped_weight 
                from batches group by 1) b on l.longhaul_id = b.longhaul_id
where l.active = true),

aggregation as (select a.*,capacity, ((coalesce(aggregation_rate_per_kg,0)* coalesce(quantity,0))+ coalesce(casual_ferrying,0)) as total_cost 
from `twigadms.dmslive.logistics_aggregation_v2` a
left join fleet f on f.fleet_id  = a.fleet_id 
where a.active = true ),

outbound as (select o.*, capacity,
(coalesce(hire,0)+ coalesce(maintenance,0)+ coalesce(fuel,0)+ coalesce(depreciation,0)+ coalesce(packing,0)+ coalesce(car_wash,0)+ coalesce(distribution_permit,0)+ coalesce(insurance,0)+ coalesce(driver_allowance,0)+ (coalesce(no_of_fulfillers,0)* coalesce(fulfiller_allowance,0))+ (coalesce(delivery_assistance,0)* coalesce(delivery_assistance_allowance,0))+ coalesce(lunch_allowance,0)) as total_cost, weight 

from `twigadms.dmslive.logistics_outbound_v2` o
left join fleet f on f.fleet_id  = o.fleet_id 
left join value_chain v on v.delivery_date = o.date and upper(v.registration_number) = upper(o.registration_number) 
and v.route_id = o.route_id),

dispatch as (select d.*,case when depot_name in ('Machakos','Thika Town') then capacity else capacity*2 end as capacity,(coalesce(hire,0)+ coalesce(maintenance,0)+ coalesce(fuel,0)+ coalesce(depreciation,0)+ coalesce(car_wash,0)+coalesce(insurance,0)+ coalesce(driver_allowance,0)) as total_cost, 
case when time(cast(left(right(concat(0,dc_arrival),4),2) as int64),cast(right(right(concat(0,dc_arrival),4),2) as int64),00) <= '04:00:00' and d.active = true then 'ON-TIME' else 'LATE' end as on_time,
from `twigadms.dmslive.logistics_dispatch_v2` d
left join fleet f on f.fleet_id  = d.fleet_id ),

kaizala_driver as (select a.*,registration_number,primary_assigment,
TIMESTAMP_DIFF(trip_end,trip_start,hour) as driving_time ,case when TIMESTAMP_DIFF(trip_end,trip_start,hour) <= 12 then 'ON-TIME' else 'LATE' end as on_time
from `twigadms.dmslive.kaizala_azure_assignment` a
left join fleet f on upper(f.registration_number) = upper(a.reg_number)    
where trip_status = 0 ),

route_adherance as (select delivery_date,sum(distance) as planned_distance,sum((closing_odometer-starting_odometer)) as actual_distance 
from `twigadms.dmslive.views_routing_route_plan`p
where closing_odometer is not null
and p.active = true
group by 1),

route_compliance as (SELECT * FROM `twigadms.dmslive.views_vehicle_availability_rate` ),
outbound_costs as (select * from `twigadms.dmslive.logistic_costs`), --- costs from google sheet
outbound_c2s as (select date,cast(costs as float64) as costs,weight,load_capacity from outbound_costs c
left join (select delivery_date,sum(weight) as weight,sum(load_capacity) as load_capacity from value_chain group by 1 ) v on v.delivery_date = c.date ),
--------------------------------------------- Current Period ----------------------------------
current_fmcg_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between current_start_date and current_end_date 
               and product_type = 'FMCG'),
current_ffv_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between current_start_date and current_end_date 
               and product_type = 'FFV'),
current_aggregation_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost
                  from aggregation,date_vars
               where date between current_start_date and current_end_date),
current_dispatch_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(tonnage),0) as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from dispatch,date_vars
               where date between current_start_date and current_end_date),
current_delivery_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(weight),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  from outbound,date_vars
               where date between current_start_date and current_end_date),
current_delivery_outbound_ontime as (select safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate ,avg(driving_time) as driving_time
                from kaizala_driver,date_vars
               where date(trip_start)  between current_start_date and current_end_date),
current_route_adherence as (select safe_divide(coalesce(sum(actual_distance),0) ,coalesce(sum(planned_distance),0)) as route_adherance_rate,coalesce(avg(actual_distance),0) as  actual_distance
                from route_adherance,date_vars
               where delivery_date  between current_start_date and current_end_date),
current_route_compliance as (select safe_divide(coalesce(sum(available),0) ,coalesce(sum(allocated),0)) as route_compliance_rate 
                from route_compliance,date_vars
               where delivery_date  between current_start_date and current_end_date),
current_outbound_c2s as (select safe_divide(coalesce(sum(costs),0) ,coalesce(sum(weight),0)) as outbound_c2s_per_kg,
                          safe_divide(coalesce(sum(weight),0) ,coalesce(sum(load_capacity),0)) as outbound_capacity_utilization 
                from outbound_c2s,date_vars
               where date  between current_start_date and current_end_date),
--------------------------------------------- previous Period ----------------------------------
previous_fmcg_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between previous_start_date and previous_end_date 
               and product_type = 'FMCG'),
previous_ffv_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between previous_start_date and previous_end_date 
               and product_type = 'FFV'),
previous_aggregation_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost
                  from aggregation,date_vars
               where date between previous_start_date and previous_end_date),
previous_dispatch_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(tonnage),0) as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from dispatch,date_vars
               where date between previous_start_date and previous_end_date),
previous_delivery_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(weight),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  from outbound,date_vars
               where date between previous_start_date and previous_end_date),
previous_delivery_outbound_ontime as (select safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate ,avg(driving_time) as driving_time
                from kaizala_driver,date_vars
               where date(trip_start) between previous_start_date and previous_end_date),
previous_route_adherence as (select safe_divide(coalesce(sum(actual_distance),0) ,coalesce(sum(planned_distance),0)) as route_adherance_rate,coalesce(avg(actual_distance),0) as  actual_distance   
                from route_adherance,date_vars
               where delivery_date  between previous_start_date and previous_end_date
               ),
previous_route_compliance as (select safe_divide(coalesce(sum(available),0) ,coalesce(sum(allocated),0)) as route_compliance_rate 
                from route_compliance,date_vars
               where delivery_date  between previous_start_date and previous_end_date),
previous_outbound_c2s as (select safe_divide(coalesce(sum(costs),0) ,coalesce(sum(weight),0)) as outbound_c2s_per_kg ,
                           safe_divide(coalesce(sum(weight),0) ,coalesce(sum(load_capacity),0)) as outbound_capacity_utilization 
                from outbound_c2s,date_vars
               where date  between previous_start_date and previous_end_date),
--------------------------------------------- mtd Period ----------------------------------
mtd_fmcg_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between mtd_start_date and mtd_end_date 
               and product_type = 'FMCG'),
mtd_ffv_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from inbound,date_vars
               where date between mtd_start_date and mtd_end_date 
               and product_type = 'FFV'),
mtd_aggregation_inbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(quantity),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost
                  from aggregation,date_vars
               where date between mtd_start_date and mtd_end_date),
mtd_dispatch_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(tonnage),0) as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate
                  from dispatch,date_vars
               where date between mtd_start_date and mtd_end_date),
mtd_delivery_outbound as (select coalesce(sum(capacity),0)  as capacity,coalesce(sum(weight),0)  as quantity,coalesce(sum(total_cost),0)  as total_cost, 
                  from outbound,date_vars
               where date between mtd_start_date and mtd_end_date),
mtd_delivery_outbound_ontime as (select 
              safe_divide(coalesce(sum(case when on_time = 'ON-TIME' then 1 else 0 end),0) ,coalesce(count(on_time),0)) as on_time_rate ,avg(driving_time) as driving_time
                from kaizala_driver,date_vars
               where date(trip_start)  between mtd_start_date and mtd_end_date),
mtd_route_adherence as (select safe_divide(coalesce(sum(actual_distance),0) ,coalesce(sum(planned_distance),0)) as route_adherance_rate,coalesce(avg(actual_distance),0) as  actual_distance
                from route_adherance,date_vars
               where delivery_date  between mtd_start_date and mtd_end_date),
mtd_route_compliance as (select safe_divide(coalesce(sum(available),0) ,coalesce(sum(allocated),0)) as  route_compliance_rate 
                from route_compliance,date_vars
               where delivery_date  between mtd_start_date and mtd_end_date),
mtd_outbound_c2s as (select safe_divide(coalesce(sum(costs),0) ,coalesce(sum(weight),0)) as outbound_c2s_per_kg,
                      safe_divide(coalesce(sum(weight),0) ,coalesce(sum(load_capacity),0)) as outbound_capacity_utilization 
                from outbound_c2s,date_vars
               where date  between mtd_start_date and mtd_end_date),
------------------------------------------------- Model ------------------------------------------------               
final_model as (select t.*, 
case
when kpi_name =  'lost_time_incidence '   then 0
when kpi_name =  'ffv_cost_to_serve '   then safe_divide((cffi.total_cost+ cai.total_cost),(cffi.quantity+ cai.quantity))
when kpi_name =  'fmcg_inbound_cost_to_serve ' then safe_divide(cfmi.total_cost,cfmi.quantity)
when kpi_name =  'fmcg_inbound on time '   then cfmi.on_time_rate*100
when kpi_name =  'ffv_inbound on time '   then cffi.on_time_rate*100
when kpi_name =  'dispatch_inbound on time '  then cdio.on_time_rate*100
when kpi_name =  'delivery_inbound on time '  then cdoo.on_time_rate*100
when kpi_name =  'dispatch_outbound_cost_to_serve '  then safe_divide(cdio.total_cost,cdio.quantity)
when kpi_name =  'delivery_outbound_cost_to_serve '  then coc.outbound_c2s_per_kg ---safe_divide(cdeo.total_cost,cdeo.quantity)
when kpi_name =  'speeding  '   then null
when kpi_name =  'driving_time '   then cdoo.driving_time
when kpi_name =  'accelerator_and_hard_braking  '   then null
when kpi_name =  'traffic_rules_compliance '   then null
when kpi_name =  'engine_idling '   then null
when kpi_name =  'route_plan_compliance '   then  crc.route_compliance_rate*100
when kpi_name =  'route_plan adherance '   then cra.route_adherance_rate*100
when kpi_name =  'fleet_availability '   then null
when kpi_name =  'delivery_outbound_capacity_utilization '   then coc.outbound_capacity_utilization*100
when kpi_name =  'fmcg_inbound_capacity_utilization '  then safe_divide(cfmi.quantity,cfmi.capacity)*100
when kpi_name =  'ffv_inbound_capacity_utilization '   then safe_divide(cffi.quantity,cffi.capacity)*100
when kpi_name =  'dispatch_outbound_capacity_utilization '   then safe_divide(cdio.quantity,cdio.capacity)*100
when kpi_name =  'distance_covered'   then cra.actual_distance
else null end as current_period_actual,
case
when kpi_name =  'lost_time_incidence '   then 0
when kpi_name =  'ffv_cost_to_serve '   then safe_divide((pffi.total_cost+ pai.total_cost),(pffi.quantity+ pai.quantity))
when kpi_name =  'fmcg_inbound_cost_to_serve ' then safe_divide(pfmi.total_cost,pfmi.quantity)
when kpi_name =  'fmcg_inbound on time '   then pfmi.on_time_rate*100
when kpi_name =  'ffv_inbound on time '   then pffi.on_time_rate*100
when kpi_name =  'dispatch_inbound on time '  then pdio.on_time_rate*100
when kpi_name =  'delivery_inbound on time '  then pdoo.on_time_rate*100
when kpi_name =  'dispatch_outbound_cost_to_serve '  then safe_divide(pdio.total_cost,pdio.quantity)
when kpi_name =  'delivery_outbound_cost_to_serve '  then poc.outbound_c2s_per_kg --safe_divide(pdeo.total_cost,pdeo.quantity)
when kpi_name =  'speeding  '   then null
when kpi_name =  'driving_time '   then pdoo.driving_time
when kpi_name =  'accelerator_and_hard_braking  '   then null
when kpi_name =  'traffic_rules_compliance '   then null
when kpi_name =  'engine_idling '   then null
when kpi_name =  'route_plan_compliance '   then  prc.route_compliance_rate*100
when kpi_name =  'route_plan adherance '   then pra.route_adherance_rate*100
when kpi_name =  'fleet_availability '   then null
when kpi_name =  'delivery_outbound_capacity_utilization '   then poc.outbound_capacity_utilization*100
when kpi_name =  'fmcg_inbound_capacity_utilization '  then safe_divide(pfmi.quantity,pfmi.capacity)*100
when kpi_name =  'ffv_inbound_capacity_utilization '   then safe_divide(pffi.quantity,pffi.capacity)*100
when kpi_name =  'dispatch_outbound_capacity_utilization '   then safe_divide(pdio.quantity,pdio.capacity)*100
when kpi_name =  'distance_covered'   then pra.actual_distance
else null end as previous_period_actual,

case
when kpi_name =  'lost_time_incidence '   then 0
when kpi_name =  'ffv_cost_to_serve '   then safe_divide((mffi.total_cost+ mai.total_cost),(mffi.quantity+ mai.quantity))
when kpi_name =  'fmcg_inbound_cost_to_serve ' then safe_divide(mfmi.total_cost,mfmi.quantity)
when kpi_name =  'fmcg_inbound on time '   then mfmi.on_time_rate*100
when kpi_name =  'ffv_inbound on time '   then mffi.on_time_rate*100
when kpi_name =  'dispatch_inbound on time '  then mdio.on_time_rate*100
when kpi_name =  'delivery_inbound on time '  then mdoo.on_time_rate*100
when kpi_name =  'dispatch_outbound_cost_to_serve '  then safe_divide(mdio.total_cost,mdio.quantity)
when kpi_name =  'delivery_outbound_cost_to_serve '  then moc.outbound_c2s_per_kg ---safe_divide(mdeo.total_cost,mdeo.quantity)
when kpi_name =  'speeding  '   then null
when kpi_name =  'driving_time '   then mdoo.driving_time
when kpi_name =  'accelerator_and_hard_braking  '   then null
when kpi_name =  'traffic_rules_compliance '   then null
when kpi_name =  'engine_idling '   then null
when kpi_name =  'route_plan_compliance '   then  mrc.route_compliance_rate*100
when kpi_name =  'route_plan adherance '   then mra.route_adherance_rate*100
when kpi_name =  'fleet_availability '   then null
when kpi_name =  'delivery_outbound_capacity_utilization '   then moc.outbound_capacity_utilization*100
when kpi_name =  'fmcg_inbound_capacity_utilization '  then safe_divide(mfmi.quantity,mfmi.capacity)*100
when kpi_name =  'ffv_inbound_capacity_utilization '   then safe_divide(mffi.quantity,mffi.capacity)*100
when kpi_name =  'dispatch_outbound_capacity_utilization '   then safe_divide(mdio.quantity,mdio.capacity)*100
when kpi_name =  'distance_covered'   then mra.actual_distance
else null end as mtd_period_actual,

'' as blank_column
from targets t
,current_fmcg_inbound cfmi
,current_ffv_inbound cffi
,current_aggregation_inbound cai
,current_dispatch_outbound cdio
,current_delivery_outbound cdeo
,current_delivery_outbound_ontime cdoo
,previous_fmcg_inbound pfmi
,previous_ffv_inbound pffi
,previous_aggregation_inbound pai
,previous_dispatch_outbound pdio
,previous_delivery_outbound pdeo
,previous_delivery_outbound_ontime pdoo
,mtd_fmcg_inbound mfmi
,mtd_ffv_inbound mffi
,mtd_aggregation_inbound mai
,mtd_dispatch_outbound mdio
,mtd_delivery_outbound mdeo
,mtd_delivery_outbound_ontime mdoo
,current_route_adherence cra
,previous_route_adherence pra
,mtd_route_adherence mra
,current_route_compliance crc
,previous_route_compliance prc
,mtd_route_compliance mrc
,current_outbound_c2s coc
,previous_outbound_c2s poc
,mtd_outbound_c2s moc
)

Select * from final_model