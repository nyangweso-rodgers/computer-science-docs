with
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order`
                            ),
sales_order as (
                   SELECT so.transaction_date,
  					       so.delivery_date,
                   soi.creation as creation_datetime,
                   FORMAT_TIME("%R", extract(time from soi.creation)) as creation_time,
                   coalesce(so.created_on_app, 'Bootsale') as created_on_app,
                   so.customer,
                   so.territory,
                   so.sales_partner,
                   so.name, 
  					       so.workflow_state,
                   so.delivery_status,
                   soi.fulfilment_status,
                   so.kyosk_order_type,
                   soi.name as sales_order_item_name,
                   soi.item_code,
                   soi.item_name,
                   soi.uom,
                   soi.item_group,
                   so.campaign,
                   soi.qty,
                   soi.rate,
                   soi.discount_amount,
                   soi.amount
                FROM sales_order_with_index so
                cross join unnest(items) soi
                where index = 1
                and kyosk_order_type = 'Sales'
                and workflow_state = 'COMPLETED' and fulfilment_status = 'COMPLETED'
                ),
monthly_customer_drop_size as (
                                select date_trunc(transaction_date, month) as transaction_month,
                                customer,
                                territory,
                                sales_partner,
                                count(distinct name) as count_of_sales_orders,
                                sum(amount) as sales_order_amount,
                                count(distinct transaction_date) as count_of_transaction_dates,
                                round(sum(amount) / count(distinct name)) as avg_amount_per_sales_order,
                                round(sum(amount) / count(distinct transaction_date)) as avg_amount_per_transaction_date
                                from sales_order
                                group by 1,2,3,4
                                ),
monthly_sales_partner_drop_size as (
                                    select distinct transaction_month,
                                    sales_partner,
                                    string_agg(distinct territory, "/" order by territory) as territory,
                                    count(distinct customer) as count_of_customers,
                                    sum(sales_order_amount) as sales_order_amount,
                                    round(avg(avg_amount_per_sales_order)) as avg_amount_per_sales_order,
                                    round(avg(avg_amount_per_transaction_date)) as avg_amount_per_transaction_date
                                    from monthly_customer_drop_size
                                    group by 1,2
                                    )
select *  from monthly_sales_partner_drop_size where FORMAT_DATE('%Y%m%d', transaction_month) between @DS_START_DATE and @DS_END_DATE 