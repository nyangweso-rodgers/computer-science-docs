with
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice` 
                            where territory not in ('Kyosk HQ')
                            ),
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order` 
                            where territory not in ('Kyosk HQ')
                            and workflow_state not in ('INITIATED', 'USER_CANCELLED')
                            ),
sales_invoices_with_items as (
                              select distinct si.posting_date,
                              si.name as sales_invoice,
                              sii.sales_order,
                              sii.delivery_note,
                              si.customer,
                              si.customer_name,
                              si.territory,
                              si.company,
                              sii.name,
                              sii.so_detail,
                              sii.item_code,
                              sii.item_name,
                              sii.uom,
                              sii.qty as sales_invoice_qty,
                              sii.rate as sales_invoice_rate,
                              sii.amount as sales_invoice_amount
                              from sales_invoice_with_index si
                              cross join unnest(items) sii
                              where index =1
                              ),
sales_orders_with_items as (
                            select distinct so.name as sales_order,
                            soi.name,
                            soi.item_code,
                            soi.item_name,
                            soi.uom,
                            soi.qty as sales_order_qty,
                            soi.rate as sales_order_rate,
                            soi.amount as sales_order_amount
                            from sales_order_with_index so
                            cross join unnest(items) soi
                            where index = 1
                            ),
invoice_order_report as (
                          select siwi.*,
                          sowi.sales_order_qty,
                          sowi.sales_order_rate,
                          sowi.sales_order_amount,
                          sowi.sales_order_rate - sales_invoice_rate as variance_rate
                          from sales_invoices_with_items siwi
                          left join sales_orders_with_items sowi on siwi.so_detail = sowi.name
                          )
select * from invoice_order_report
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
--where posting_date >= '2022-06-01'
--and variance_rate <> 0
--and sales_invoice = 'SI-ATHI-0A1V-22'