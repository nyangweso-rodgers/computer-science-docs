-- created by Rodgers Nyangweso
with
sales_kyosk as (
                  select distinct  kyosk_code, 
                  kyosk_name, 
                  phone_numbers, 
                  agent_name,
                  match_status 
                  from `kyosk-prod.sales.scheduled_duka_universe_report`
                  ),
latest_duka_service_zone as (
                              select *, row_number()over(partition by kyosk_code order by original_delivery_date_kenya desc ) as service_zone_index
                              from
                              (
                              SELECT distinct kyosk_code, 
                              service_zone_name, 
                              original_delivery_date_kenya
                              FROM `kyosk-prod.inventory.views_ops_item_report`
                              where kyosk_code is not null
                              )
                              ),
weekly_orders_mashup as (
                        SELECT distinct kyosk_code,  
                        date_trunc(original_delivery_date_kenya, week) as order_week,  
                        count(distinct original_delivery_date_kenya) as weekly_order_freq
                        FROM `kyosk-prod.sales.views_orders`
                        group by 1,2
                        ),
final_model as (
                  select wom.*, 
                  row_number()over(partition by wom.kyosk_code order by order_week desc) as order_week_index,
                  sk.*except(kyosk_code),
                  a.service_zone_name
                  from weekly_orders_mashup wom
                  left join sales_kyosk sk on wom.kyosk_code = sk.kyosk_code
                  left join (select distinct kyosk_code, service_zone_name, from latest_duka_service_zone where service_zone_index = 1) a on wom.kyosk_code = a.kyosk_code
                  order by 1,2,3,4,5 
                  )
select * from final_model where kyosk_code is not null