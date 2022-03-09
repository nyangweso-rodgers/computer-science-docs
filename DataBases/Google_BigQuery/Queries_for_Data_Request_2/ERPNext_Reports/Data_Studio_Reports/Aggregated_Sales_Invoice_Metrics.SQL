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
                   si.due_date,
                   si.creation,
                   si.territory,
                   si.name,
                   i.sales_order,
                   i.delivery_note,
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
select distinct territory, 
       customer,
       sum(amount) as amount_sales_invoice,
       count(distinct name) as count_of_sales_invoices,
       count(distinct posting_date) as count_of_posting_days,
       round(sum(amount) / count(distinct name)) as avg_sales_invoice_amount,
       round(sum(amount) / count(distinct posting_date)) as avg_daily_invoice_amount
       from sales_invoice 
      --where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
      where posting_date between '2022-02-01'  and  '2022-02-28' 
      group by 1,2 order by 3 desc