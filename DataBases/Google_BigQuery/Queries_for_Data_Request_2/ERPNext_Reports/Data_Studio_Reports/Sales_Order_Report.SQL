with
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order`
                            ),
sales_order as (
                       SELECT so.transaction_date,
                       soi.creation as creation_datetime,
                       FORMAT_TIME("%R", extract(time from soi.creation)) as creation_time,
                       so.created_on_app,
                       so.customer,
                       so.territory,
                       so.name, 
  					           so.workflow_state,
                       so.kyosk_order_type,
                       soi.item_code,
                       soi.item_name,
                       soi.uom,
                       soi.item_group,
                       soi.qty,
                       soi.rate,
                       soi.discount_amount,
                       soi.amount
                FROM sales_order_with_index so--`kyosk-prod.erp_reports.sales_order` so
                cross join unnest(items) soi
                where index = 1
                )
select *  from sales_order so
where workflow_state not in ('INITIATED')
AND FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE 