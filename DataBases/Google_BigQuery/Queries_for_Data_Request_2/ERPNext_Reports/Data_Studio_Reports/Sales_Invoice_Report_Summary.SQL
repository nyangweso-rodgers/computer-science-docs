with
date_vars AS (
              SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
              --SELECT DATE '2022-02-01' as current_start_date, DATE '2022-02-28' as current_end_date ),
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
                   i.discount_amount,
                   i.amount
                   FROM sales_invoice_with_index si
                   cross join unnest(items) i
                   where index = 1
                   ),
daily_sales_invoice_summary as (
                                SELECT distinct posting_date,
                                 creation_date,
                                 territory,
                                 name as sales_invoice,
                                 delivery_note,
                                 sales_order,
                                 status,
                                 sum(qty) as qty,
                                 sum(discount_amount) as discount_amount,
                                 sum(amount) as amount_sales_invoice,
                                 extract(hour from posting_time) as posting_hour,
                                 from sales_invoice
                                 group by 1,2,3,4,5,6,7,11
                                  ),
monthly_sales_invoice_summary as (
                                  select date_trunc(posting_date, month) as posting_month,
                                  territory,
                                  sum(amount) as amount,
                                  count(distinct customer) as customer_count
                                  from sales_invoice
                                  group by 1,2
                                  )
select msis.* from monthly_sales_invoice_summary msis, date_vars where posting_month between current_start_date and current_end_date 