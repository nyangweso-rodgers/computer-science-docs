with
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order`
                            ),
sales_order_with_items as (
                            select distinct so.transaction_date,
                            so.delivery_date,
                            so.delivery_window_id,
                            so.delivery_window_start_time,
                            so.delivery_window_end_time,
                            so.territory,
                            so.name as sales_order,
                            coalesce(so.created_on_app, 'Bootsale') as created_on_app,
                            so.kyosk_order_type,
                            so.workflow_state,
                            soi.fulfilment_status,
                            so.status,
                            so.sales_partner,
                            so.customer,
                            so.customer_name,
                            soi.item_group,
                            soi.name,
                            soi.item_name,
                            soi.uom,
                            soi.qty,
                            soi.rate,
                            soi.price_list_rate,
                            soi.discount_amount,
                            soi.amount
                            from sales_order_with_index so
                            cross join unnest(items) soi
                            where index = 1
                            and workflow_state not in ('INITIATED', 'USER_CANCELLED')
  							and so.territory not in ('Kyosk HQ')
                            --and so.transaction_date = '2022-03-26'
                            order by transaction_date, sales_order,item_name, uom
                            )
select * from sales_order_with_items where FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE