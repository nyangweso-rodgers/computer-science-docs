with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              dn.territory,
                              dni.against_sales_order as sales_order,
                              dn.name as delivery_note,
                              dn.customer,
                              dn.customer_name,
                              dn.contact_mobile,
                              dn.sales_partner,
                              sum(dni.amount) as amount
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID', 'DELIVERED')
                              group by 1,2,3,4,5,6,7,8
                              ),
customers_last_activity as (
                            select distinct customer, customer_name, contact_mobile, territory, sales_partner
                            from
                            (select *, row_number()over(partition by customer order by posting_date desc) as index
                            from
                            (select distinct customer, customer_name,contact_mobile, territory,sales_partner, posting_date from delivery_note_with_items)
                            ) where index = 1
                            ),
mashup as (
            select distinct dnwi.customer,
            count(distinct posting_date) as order_frequency,
            count(distinct  sales_order) as order_count,
            sum(amount) as revenue,
            safe_divide(sum(amount) , count(distinct sales_order)) as basket_size,
            count(distinct date_trunc(posting_date,week)) as weekly_frequency,
            sum(amount) / count(distinct date_trunc(posting_date,week)) as avg_weekly_revenue,
            count(distinct  sales_order) / count(distinct date_trunc(posting_date,week)) as avg_weekly_order_count,
            count(distinct posting_date) / count(distinct date_trunc(posting_date,week)) as avg_weekly_order_frequency,
            sum(amount) / count(distinct date_trunc(posting_date,week)) as avg_weekly_basket_size
            from delivery_note_with_items dnwi
            --where posting_date   between '2022-05-05' and '2022-05-23'
            where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
            group by 1
            )
select m.*, cla.*except(customer) from mashup m
left join customers_last_activity cla on m.customer = cla.customer