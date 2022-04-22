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
                              i.item_group,
                              i.item_name as delivery_note_item_item_name,
                              i.name as delivery_note_item_name,
                              i.item_code,
                              i.uom,
                              i.qty as qty_delivery_note,
                              i.price_list_rate,
                              i.discount_amount,
                              i.rate,
                              i.amount as delivery_note_amount,
                              FROM delivery_note_with_index dn
                              cross join unnest(items) i
                              where index = 1
                              and workflow_state in ('PAID')
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
                          string_agg(distinct sales_order, "/" order by sales_order) as sales_orders,
                          string_agg(distinct delivery_note, "/" order by delivery_note) as delivery_note
                          from delivery_note_with_items
                          where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 
                          --where posting_date = '2022-04-19' and customer = 'Citizen general shop'
                          group by 1,2,3,4
                          ),
sales_partner_basket_size as (
                              select distinct sales_partner,
                              string_agg(distinct created_on_app, "/" order by created_on_app) as created_on_app,
                              string_agg(distinct territory, "/" order by territory) as territory,
                              count(distinct customer) as count_of_customers,
                              sum(count_of_sales_orders) as count_of_sales_orders,
                              sum(count_of_delivery_notes) as count_of_delivery_notes,
                              sum(revenue) as revenue,
                              round(avg(avg_amount_per_sales_order)) as avg_amount_per_sales_order,
                              from customer_basket_size
                              group by 1
                              )
select * from sales_partner_basket_size