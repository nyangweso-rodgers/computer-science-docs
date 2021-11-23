-- Created by Rodgers Nyangweso
with
inventory_ops_item as (
                        select *, row_number()over(partition by id order by last_modified_date desc) as index
                        from
                        (
                        SELECT distinct id,
                        date(created_date) as created_date, 
                        date(created_date, 'Africa/Nairobi') as created_date_kenya,
                        date(date_created) as date_created, 
                        date(date_created, 'Africa/Nairobi') as date_created_kenya,
                        datetime(completed_date) as completed_date, 
                        datetime(completed_date,  'Africa/Nairobi') as completed_date_kenya,
                        date(delivery_date) as delivery_date, 
                        date(delivery_date,  'Africa/Nairobi') as delivery_date_kenya,
                        date(order_created_date) as order_created_date, 
                        date(order_created_date,  'Africa/Nairobi') as order_created_date_kenya,
                        datetime(dispatched_time, 'Africa/Nairobi') as dispatched_time_kenya,
                        last_modified_date,
                        kyosk_id,
                        order_code,
                        created_by_name,
                        catalog_qty as ordered_catalog_qty, 
                        final_catalog_qty as delivered_catalog_quantity, 
                        stocking_qty as ordered_stocking_qty, 
                        final_stocking_qty as delivered_stocking_qty,
                        unit_sale_price_incl,
                        source_app,
                        boot_sale,
                        cancel_reason,
                        rescheduled,
                        json_value(sale_detail, '$.saleCode') as sale_code,
                        delivery_window,
                        cast(json_extract_scalar(delivery_window, '$.windowId') as int64) as delivery_window_id,
                        delivery_delay,
                        case when delivery_delay is null then 'Cancelled' when delivery_delay < 0 then 'Early' when delivery_delay > 0 then 'Late' else  'On-Time' end as delivery_delay_status,
                        drs_code,
                        drs_id,
                        avg_cost_id,
                        sales_tariff_id,
                        cat_id,
                        inv_id,
                        zone_id,
                        status
                        FROM `kyosk-prod.inventory.tbl_ops_item` 
                        )
                        )
select * from inventory_ops_item  where index = 1 