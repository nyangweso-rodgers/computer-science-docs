with
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice`
                            ),
sales_invoice as (
                   SELECT distinct si.posting_date,
                   si.territory,
                   si.name as sales_invoice,
                   sii.sales_order,
                   sii.delivery_note,
                   si.customer,
                   si.customer_name,
                   si.kyosk_order_type,
                   si.status,
                   si.discount_amount as discount_amount_for_sales_invoice,
                   si.grand_total as grand_total_for_sales_invoice
                   FROM sales_invoice_with_index si
                   cross join unnest(items) sii
                   where index = 1
                   ),
sales_invoice_with_items as (
                             SELECT distinct si.posting_date,
                             si.territory,
                             si.name as sales_invoice,
                             sii.sales_order,
                             sii.delivery_note,
                             
                             sum(sii.discount_amount) as discount_amount_for_sales_invoice_items,
                             sum(sii.amount) as amount_for_sales_invoice_items
                             FROM sales_invoice_with_index si
                             cross join unnest(items) sii
                             where index = 1
                             group by 1,2,3,4,5
                             order by posting_date, sales_invoice
                             ),
sales_invoce_amount_variances as (
                                  select si.*, 
                                  amount_for_sales_invoice_items,
                                  discount_amount_for_sales_invoice_items,
                                  amount_for_sales_invoice_items - grand_total_for_sales_invoice as variance_amount
                                  from sales_invoice si
                                  left join sales_invoice_with_items siwi on si.sales_invoice = siwi.sales_invoice
                                  where FORMAT_DATE('%Y%m%d', siwi.posting_date) between @DS_START_DATE and @DS_END_DATE
                                  --where si.posting_date >= '2022-05-16'
                                  )
select * from sales_invoce_amount_variances