with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              SELECT distinct dn.posting_date ,
                              dn.territory,
                              dn.name as delivery_note,
                              i.against_sales_order as sales_order,
                              dn.created_on_app,
                              dn.sales_partner,
                              dn.kyosk_order_type,
                              dn.customer,
                              dn.customer_name,
                              sum(i.amount) as delivery_note_amount,
                              FROM delivery_note_with_index dn
                              cross join unnest(items) i
                              where index = 1
                              and workflow_state in ('PAID')
                              group by 1,2,3,4,5,6,7,8,9
                              ),
customer_basket_size as (
                          select distinct customer,
                          customer_name,
                          territory,
                          sales_partner,
                          string_agg(distinct created_on_app, "/" order by created_on_app) as created_on_app,
                          count(distinct sales_order) as count_of_sales_orders,
                          count(distinct delivery_note) as count_of_delivery_notes,
                          sum(delivery_note_amount) as revenue,
                          count(distinct posting_date) as count_of_posting_dates,
                          round(sum(delivery_note_amount) / count(distinct sales_order)) as avg_amount_per_sales_order,
                          from delivery_note_with_items
                          where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 
                          group by 1,2,3,4
                          )
select * from customer_basket_size