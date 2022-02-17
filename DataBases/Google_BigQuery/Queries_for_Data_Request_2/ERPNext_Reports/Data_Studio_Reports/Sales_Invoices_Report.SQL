with
sales_invoice as (
                   SELECT si.posting_date,
                   si.posting_time,
                   si.due_date,
                   si.creation,
                   si.territory,
                   si.name,
                   i.sales_order,
                   i.delivery_note,
                   si.workflow_state,
                   si.customer,
                   si.customer_name,
                   i.item_code,
                   i.item_name,
                   i.item_group,
                   i.uom,
                   i.qty,
                   i.delivered_qty,
                   i.price_list_rate,
                   i.amount
                   FROM `kyosk-prod.erp_reports.sales_invoice` si
                   cross join unnest(items) i
                   )
select * from sales_invoice 
--where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE