with
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice`
                            ),
sales_invoice_with_items as (
                             SELECT distinct si.posting_date,
                             si.posting_time,
                             si.territory,
                             si.name as sales_invoice,
                             sii.sales_order,
                             sii.delivery_note,
                             si.kyosk_order_type,
                             si.status,
                             si.customer,
                             si.customer_name,
                             sii.name as sale_invoice_item_name,
                             sii.item_code,
                             sii.item_name,
                             sii.item_group,
                             sii.uom,
                             sii.qty,
                             sii.price_list_rate,
                             sii.rate,
                             sii.net_rate,
                             sii.discount_amount,
                             sii.amount,
                             sii.net_amount
                             FROM sales_invoice_with_index si
                             cross join unnest(items) sii
                             where index = 1
                             --and si.name = 'ACC-SINV-2022-101797'
                             --and posting_date = '2022-03-31'
                            -- and kyosk_order_type = 'Bootsale'
                             --and delivery_note is null
                             order by sales_order, delivery_note, sales_invoice, item_name, uom
                             )
select *  from sales_invoice_with_items 
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE