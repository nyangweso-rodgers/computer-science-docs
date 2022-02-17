with
sales_order as (
                SELECT i.transaction_date,
                       i.delivery_date,
                       delivery_window_id,
                       delivery_window_start_time,
                       delivery_window_end_time,
                       customer,
                       territory,
                       o.name, 
                       created_on_app,
                       fulfilment_status,
                       item_code,
                       item_name,
                       uom,
                       item_group,
                       qty,
                       price_list_rate,
                       amount
                FROM `kyosk-prod.erp_reports.sales_order` o
                cross join unnest(items) i
                )
select * from sales_order
where FORMAT_DATE('%Y%m%d', delivery_date) between @DS_START_DATE and @DS_END_DATE 
--WHERE items[SAFE_OFFSET(0)].parent = 'SAL-ORD-NAKSVXL'