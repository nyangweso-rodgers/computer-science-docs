-- created by Rodgers Nyangweso
with 
date_vars AS (
               SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
              --SELECT DATE '2021-09-06' as current_start_date, DATE '2021-09-11' as current_end_date ),

inventory_ops_item_report as (
                               select distinct kyosk_code,service_zone_name,agent_name, string_agg(distinct created_on_app, "/" order by created_on_app) as created_on_app
                               from
                               (
                               select distinct order_created_date_kenya, 
                               kyosk_code,order_code, 
                               created_on_app, 
                               service_zone_name, 
                               agent_name 
                               from `kyosk-prod.inventory.views_ops_item_report` 
                               where original_delivery_date_kenya is not null -- Remove the boot sale
                               ), date_vars where order_created_date_kenya between current_start_date and current_end_date
                               group by 1,2,3
                               )

select distinct service_zone_name, agent_name,created_on_app, count(distinct kyosk_code) as unique_kyosks
from inventory_ops_item_report 
--where service_zone_name = 'Athi River' 
group by 1,2,3