with
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order` 
                            where territory not in ('Kyosk HQ')
                            and workflow_state not in ('INITIATED', 'USER_CANCELLED')
                            ),
regional_mapping as (SELECT * FROM `kyosk-prod.erp_reports.upload_regional_mapping`),
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
                            soi.amount,
                            rm.*except(id, territory, company)
                            from sales_order_with_index so
                            cross join unnest(items) soi
                            left join regional_mapping rm on so.territory = rm.territory
                            where index = 1
                            order by transaction_date, sales_order,item_name, uom
                            )
select * from sales_order_with_items 
where FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE