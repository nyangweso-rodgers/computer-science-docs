-- created by Rodgers Nyangweso
with
inventory_service_zone as (select distinct id, service_zone_name from `kyosk-prod.inventory.views_service_zone`), -- Re-created views to eliminate duplicate records
inventory_delivery_run_sheet as (SELECT distinct id, driver_name, drs_code, FROM `kyosk-prod.inventory.views_delivery_run_sheet`), -- Re-created views to eliminate duplicate records
sales_orders as ( select distinct original_delivery_date_kenya,  kyosk_code,  order_code, FROM `kyosk-prod.sales.views_orders`), -- Re-created views to eliminate duplicate records
inventory_ops_item as (
                        SELECT distinct kyosk_id, 
                        zone_id, 
                        order_code,
                        status,
                        last_modified_date,
                        drs_code,
                        delivery_delay,
                        delivery_delay_status,
                        FROM `kyosk-prod.inventory.views_ops_item` 
                        ), -- Re-created views to eliminate duplicate records
orders_and_ops_item_mashup as (
            select distinct 
            so.original_delivery_date_kenya, 
            kyosk_code, 
            isz.service_zone_name,
            ioi.order_code,
            ioi.delivery_delay_status,
            idrs.drs_code,
            idrs.driver_name
            from inventory_ops_item ioi
            left join sales_orders so on ioi.order_code = so.order_code
            left join inventory_service_zone isz on ioi.zone_id = isz.id
            left join inventory_delivery_run_sheet idrs on ioi.drs_code = idrs.drs_code
            where status = 'Completed'
            ),

otif_mashup as (
                  select distinct original_delivery_date_kenya, 
                  service_zone_name, 
                  drs_code,
                  driver_name,
                  count(distinct order_code) as total_order_count, 
                  count(distinct  kyosk_code) as unique_dukas,
                  count(distinct(case when delivery_delay_status = 'Early' then order_code else null end)) as early_deliveries,
                  count(distinct(case when delivery_delay_status = 'Late' then order_code else null end)) as late_deliveries,
                  count(distinct(case when delivery_delay_status = 'On-Time' then order_code else null end)) as on_time_deliveries,
                  count(distinct(case when delivery_delay_status = 'Early' then order_code else null end))/count(distinct order_code) as early_deliveries_percent,
                  count(distinct(case when delivery_delay_status = 'Late' then order_code else null end))/count(distinct order_code) as late_deliveries_percent,
                  count(distinct(case when delivery_delay_status = 'On-Time' then order_code else null end))/count(distinct order_code) as ont_time_deliveries_peercent
                  from orders_and_ops_item_mashup
                  group by 1,2,3,4
                  )
select * from otif_mashup