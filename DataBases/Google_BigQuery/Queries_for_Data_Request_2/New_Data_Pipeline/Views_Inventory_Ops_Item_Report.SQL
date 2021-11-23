-- created by Rodgers Nyangweso
with
inventory_ops_item as (select * FROM `kyosk-prod.inventory.views_ops_item`), -- Re-created Views to eliminate duplicate records
sales_orders as (
                  SELECT *
                  FROM `kyosk-prod.sales.views_orders`
                  where created_date_kenya > '2021-02-12' -- Start Date where created_on_app is not null
                  ), -- Re-created Views to eliminate duplicate records
sales_kyosk as (select distinct kyosk_code,  kyosk_name from `kyosk-prod.sales.views_kyosk`), -- Re-created Views to eliminate duplicate records
invetory_service_zone as (select distinct id, service_zone_code, service_zone_name from `kyosk-prod.inventory.views_service_zone`), -- Re-created Views to eliminate duplicate records
inventory_catalog as ( select * from kyosk-prod.inventory.views_catalog ),-- Re-created Views to eliminate duplicate records
inventory_avg_cost as (select distinct id, zone_id, avg_unit_cost, avg_unit_cost_incl, inv_id from `kyosk-prod.inventory.views_avg_cost`), -- Re-created views to eliminate duplicate records
inventory_delivery_run_sheet as (select * from `kyosk-prod.inventory.views_delivery_run_sheet`), -- Re-created views to eliminate duplicate records
sales_delivery_window as (SELECT  distinct id, start as delivery_window_start,  FROM `kyosk-prod.sales.views_delivery_window` ),  -- Re-created views to eliminate duplicate records

ops_item_report as (
                      select distinct ioi.id, 
                      ioi.created_date, 
                      ioi.created_date_kenya, 
                      ioi.date_created, 
                      ioi.date_created_kenya, 
                      ioi.completed_date, 
                      ioi.completed_date_kenya,
                      ioi.order_created_date, 
                      ioi.order_created_date_kenya, 
                      so.original_delivery_date_kenya,
                      
                      ioi.last_modified_date,
                      ioi.kyosk_id,  
                      so.kyosk_code, 
                      sk.kyosk_name,
                      ioi.zone_id, 
                      isz.service_zone_code, 
                      isz.service_zone_name,
                      
                      ioi.order_code,
                      ioi.sale_code,
                      ioi.source_app as source_app,
                      coalesce(so.created_on_app,ioi.source_app) as created_on_app, 
                      coalesce(so.agent_name, ioi.created_by_name) as agent_name, -- to cateter for boot sales which does not have an agent name on orders table
                      ioi.status,
                      ioi.boot_sale,
                      ioi.rescheduled,
                      ioi.cancel_reason,
                      ioi.cat_id, icat.catalog_sku, 
                      icat.catalog_name, 
                      icat.catalog_packaging, 
                      icat.conversion_ratio_from_catalog_to_inventory as catalog_to_inventory_conversion_ratio,
                      ioi.ordered_catalog_qty,
                      ioi.delivered_catalog_quantity,
                      ioi.unit_sale_price_incl as unit_sale_price_incl, 
                      ioi.unit_sale_price_incl  * ioi.ordered_catalog_qty as ordered_catalog_amount, 
                      ioi.unit_sale_price_incl * ioi.delivered_catalog_quantity as delivered_catalog_amount,
                      ioi.avg_cost_id, 
                      iavgc.avg_unit_cost, 
                      iavgc.avg_unit_cost_incl,
                      
                      ioi.drs_id, ioi.drs_code, 
                      idrs.drs_created_date_kenya,
                      idrs.dispatch_time,
                      ioi.dispatched_time_kenya, 
                      date_diff(ioi.dispatched_time_kenya, idrs.drs_created_date_kenya, minute) as drs_dis_delta_min,
                      date_diff(ioi.completed_date_kenya, ioi.dispatched_time_kenya, minute) as dispatch_to_order_completion_delta_min,
                      idrs.driver_name,
                      idrs.driver_login,
                      ioi.delivery_delay,
                      ioi.delivery_delay_status,
                      ioi.delivery_window_id,
                      sdw.delivery_window_start,
                      case when sdw.delivery_window_start = 8 then 'Morning Window' when sdw.delivery_window_start = 13 then 'Afternoon Window' else 'Not Defined' end as delivery_window_status

                      from inventory_ops_item ioi
                      left join invetory_service_zone isz on ioi.zone_id = isz.id
                      left join inventory_catalog icat on ioi.cat_id = icat.id and isz.service_zone_code = icat.service_zone_code and ioi.inv_id = icat.inv_id
                      left join sales_orders so on ioi.order_code = so.order_code
                      left join sales_kyosk sk on so.kyosk_code = sk.kyosk_code
                      left join inventory_delivery_run_sheet idrs on ioi.drs_code = idrs.drs_code and ioi.zone_id = idrs.zone_id
                      left join inventory_avg_cost iavgc on ioi.avg_cost_id = iavgc.id and ioi.zone_id = iavgc.zone_id
                      left join sales_delivery_window sdw on ioi.delivery_window_id = sdw.id
                      )
select *
from ops_item_report
# below line is for testing the code
--where original_delivery_date_kenya = '2021-09-20' # Testing a specific date
--and order_code = 'KYDDFJPG' -- Test for a single Catalog name with one order code
--where created_date_kenya = '2021-08-16' --and id = '00b594e6-5705-4b82-bab0-e32f6dfcafb7'
--and order_code = 'KYURHDZA' -- Test for different Catalogs with the same order code
order by 1, catalog_name, catalog_packaging,  status