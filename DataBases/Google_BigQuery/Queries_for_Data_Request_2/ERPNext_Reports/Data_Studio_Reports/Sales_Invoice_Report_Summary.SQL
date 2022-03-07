with
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice`
                            ),
sales_invoice as (
                   SELECT si.posting_date,
                   date(si.creation) as creation_date,
                   si.posting_time,
                   si.territory,
                   si.name,
                   i.sales_order,
                   i.delivery_note,
                   si.status,
                   si.workflow_state,
                   si.customer,
                   si.customer_name,
                   i.item_code,
                   i.item_name,
                   i.item_group,
                   i.uom,
                   i.qty,
                   i.rate,
                   i.amount
                   FROM sales_invoice_with_index si
                   cross join unnest(items) i
                   where index = 1
                   )
SELECT distinct posting_date,
       creation_date,
       territory,
       name as sales_invoice,
       delivery_note,
       sales_order,
       status,
       sum(amount) as amount_sales_invoice,
       extract(hour from posting_time) as posting_hour,
from sales_invoice
where posting_date = '2022-03-01'
group by 1,2,3,4,5,6,7,9
order by sales_invoice, delivery_note, sales_order