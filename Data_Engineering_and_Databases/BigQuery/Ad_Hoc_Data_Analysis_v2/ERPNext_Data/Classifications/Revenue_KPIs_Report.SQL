------------------------ Revenue KPIs Report -----------------------------
with
monthly_customer_classification as (
                                    SELECT distinct posting_month, customer, company, customer_active_status 
                                    FROM `kyosk-prod.erp_reports.scheduled_customer_active_status` 
                                    ),
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            where workflow_state in ('PAID', 'DELIVERED') 
                            ),
monthly_customer_revenue as (
                                select distinct dn.customer,
                                date_trunc(dn.posting_date, month) as posting_month,
                                count(distinct i.against_sales_order) as count_of_sales_order,
                                sum(i.amount) as revenue,
                                from delivery_note_with_index dn,unnest(items)i
                                where index = 1
                                group by 1,2
                                ),
lists_report as (
            select mcc.*, count_of_sales_order, revenue,
            from monthly_customer_classification mcc
            left join monthly_customer_revenue mcr on mcc.customer = mcr.customer and  mcc.posting_month = mcr.posting_month 
            ),
aggregate_report as (
                      select distinct posting_month,
                      customer_active_status, 
                      count(distinct customer) as count_of_customer,
                      sum(revenue) as revenue,
                      sum(count_of_sales_order) as count_of_sales_order,
                      sum(revenue) / sum(count_of_sales_order) as basket_size,
                      sum(count_of_sales_order) / count(distinct customer)  as order_frequency,
                      sum(revenue) / count(distinct customer) as avg_customer_revenue
                      from lists_report
                      group by 1,2
                      order by 1,2
                      )
select * from aggregate_report