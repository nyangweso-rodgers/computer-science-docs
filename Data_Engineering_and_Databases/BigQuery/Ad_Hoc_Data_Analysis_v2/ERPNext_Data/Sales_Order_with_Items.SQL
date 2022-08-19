with
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order` 
                            where territory not in ('Kyosk HQ')
                            and workflow_state not in ('INITIATED', 'USER_CANCELLED')
                            ),
sales_order_with_items as (
                            select distinct so.transaction_date,
                            so.company,
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
                            soi.amount
                            from sales_order_with_index so
                            cross join unnest(items) soi
                            where index = 1
                            order by transaction_date, sales_order,item_name, uom
                            )
select * from sales_order_with_items 
--where FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE