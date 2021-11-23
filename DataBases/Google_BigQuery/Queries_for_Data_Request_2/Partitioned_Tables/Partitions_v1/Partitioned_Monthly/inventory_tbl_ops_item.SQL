create  table  `kyosk-prod.inventory.partitioned_tbl_ops_item_monthly`
partition by date_trunc(order_created_date_kenya, month) as 
                      (
                        select * from
                        (
                        select *, row_number()over(partition by id order by last_modified_date desc) as ops_item_index 
                        from
                        (
                        SELECT distinct id,
                        datetime(completed_date,  'Africa/Nairobi') as completed_date_kenya,
                        date(order_created_date,  'Africa/Nairobi') as order_created_date_kenya,
                        datetime(dispatched_time, 'Africa/Nairobi') as dispatched_time_kenya,
                        datetime(scheduled_delivery_date, 'Africa/Nairobi') as scheduled_delivery_date_kenya,
                        last_modified_date,
                        kyosk_id,
                        order_code,
                        catalog_qty as ordered_catalog_qty, 
                        final_catalog_qty as delivered_catalog_quantity,  
                        unit_sale_price_incl,
                        unit_sale_price_incl  * catalog_qty as ordered_catalog_amount, 
                        unit_sale_price_incl * final_catalog_qty as delivered_catalog_amount,
                        source_app,
                        boot_sale,
                        cancel_reason,
                        rescheduled,
                        json_extract_scalar(sale_detail, '$.saleCode') as sale_code,
                        cast(json_extract_scalar(delivery_window, '$.windowId') as int64) as delivery_window_id,
                        delivery_delay,
                        case when delivery_delay is null then 'Cancelled' when delivery_delay < 0 then 'Early' when delivery_delay > 0 then 'Late' else  'On-Time' end as delivery_delay_status,
                        drs_code,
                        cat_id,
                        zone_id,
                        status
                        FROM `kyosk-prod.inventory.tbl_ops_item` 
                        )) where ops_item_index = 1)