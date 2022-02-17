with
sales_order as (
                SELECT i.transaction_date,
                       i.delivery_date,
                       i.creation as creation_datetime,
                       FORMAT_TIME("%R", extract(time from i.creation)) as creation_time,
                       o.created_on_app,
                       customer,
                       territory,
                       o.name, 
                       item_code,
                       item_name,
                       uom,
                       item_group,
                       qty,
                       rate,
                       amount
                FROM `kyosk-prod.erp_reports.sales_order` o
                cross join unnest(items) i
                )
select * from sales_order so
where FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE 