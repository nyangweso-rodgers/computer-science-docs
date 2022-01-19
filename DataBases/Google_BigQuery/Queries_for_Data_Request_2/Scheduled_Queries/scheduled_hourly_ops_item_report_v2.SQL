-- created by Rodgers Nyangweso
with
inventory_ops_item as (select * FROM `kyosk-prod.inventory.views_ops_item`),
--------------------------- Sales Orders ---------------------------------------
sales_orders as (
                  SELECT *
                  FROM `kyosk-prod.sales.views_orders_v2`
                  where created_date_kenya > '2021-02-12' -- Start Date where created_on_app is not null
                  ), 
                  
---------------- Inventory Kyosk Dukas  Table---------------------------------------
inventory_kyosk_duka as (
                           select distinct kyosk_code,id, 
                           kyosk_name, 
                           duka_phone_numbers 
                           from `kyosk-prod.inventory.views_kyosk_duka`
                           ),
------------------------ Inventory ------------------------------------
invetory_service_zone as (select distinct id, service_zone_code, service_zone_name from `kyosk-prod.inventory.views_service_zone`), 
inventory_catalog as ( select * from kyosk-prod.inventory.views_catalog ),
inventory_delivery_run_sheet as (select * from `kyosk-prod.inventory.views_delivery_run_sheet`), 
sales_delivery_window as (SELECT  distinct id, start as delivery_window_start,  FROM `kyosk-prod.sales.views_delivery_window` ),

ops_item_report as (
                      select distinct ioi.id,
                      ioi.completed_date_kenya,
                      ioi.order_created_date_kenya, 
                      so.original_delivery_date_kenya,
                      ioi.scheduled_delivery_date_kenya,
                      
                      ioi.last_modified_date,
                      ioi.kyosk_id,  
                      ikd.kyosk_code, 
                      ikd.kyosk_name,
                      ikd.duka_phone_numbers,
                      ---------------- service zone table ------
                      isz.service_zone_code, 
                      isz.service_zone_name,
                      
                      ioi.order_code, 
                      ioi.sale_code,
                      ioi.source_app as source_app,
                      coalesce(so.created_on_app,ioi.source_app) as created_on_app, 
                      so.agent_name,
                      so.agent_login,
                      so.agent_phone_number,
                      ioi.status,
                      ioi.boot_sale,
                      ioi.rescheduled,
                      ioi.cancel_reason,
                      ioi.cat_id, 
                      -------- inventory catalog table ---------
                      icat.catalog_sku, 
                      icat.catalog_name, 
                      icat.catalog_packaging, 
                      ioi.ordered_catalog_qty,
                      ioi.delivered_catalog_quantity,
                      ioi.unit_sale_price_incl,
                      ioi.ordered_catalog_amount, 
                      ioi.delivered_catalog_amount,
                      
                      ioi.drs_code, 
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
                      left join inventory_catalog icat on ioi.cat_id = icat.id --and ioi.inv_id = icat.inv_id --and ioi.service_zone_code = icat.service_zone_code 
                      left join sales_orders so on ioi.order_code = so.order_code and icat.catalog_sku = so.catalog_sku
                      left join inventory_kyosk_duka ikd on ioi.kyosk_id = ikd.id 
                      left join inventory_delivery_run_sheet idrs on ioi.drs_code = idrs.drs_code and ioi.zone_id = idrs.zone_id
                      left join sales_delivery_window sdw on ioi.delivery_window_id = sdw.id
                      )
select * from ops_item_report
order by order_code, catalog_name, catalog_packaging,  status