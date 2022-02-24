with
sales_invoice as (
                   SELECT si.posting_date,
                   si.territory,
                   si.name,
                   i.sales_order,
                   i.delivery_note,
                   si.status,
                   si.workflow_state,
                   si.customer,
                   si.customer_name,
                   i.item_code,
                   i.item_name,
                   i.item_group,
                   i.uom,
                   i.stock_uom,
                   i.conversion_factor,
                   i.qty,
                   i.stock_qty,
                   i.rate,
                   i.stock_uom_rate,
                   i.amount,
                   FROM `kyosk-prod.erp_reports.sales_invoice` si
                   cross join unnest(items) i
                   cross join unnest(payment_schedule) ps
                   ),
delivery_note as (
                  SELECT distinct dn.posting_date,
                  oi.modified,
                  dn.modified as modified_dn,
                  dn.lr_date,
                  dn.customer,
                  customer_name,
                  dn.territory,
                  dn.name,
                  oi.against_sales_order,
                  dn.workflow_state,
                  oi.fulfilment_status,
                  dn.status,
                  oi.item_code,
                  oi.item_name,
                  oi.uom,
                  oi.item_group,
                  oi.qty,
                  oi.returned_qty,
                  oi.rate,
                  oi.discount_amount,
                  oi.amount
                  FROM `kyosk-prod.erp_reports.delivery_note` dn
                  cross join unnest(original_items) oi
                  ),
sales_order as (
                SELECT so.transaction_date,
                       soi.creation as creation_datetime,
                       FORMAT_TIME("%R", extract(time from soi.creation)) as creation_time,
                       so.created_on_app,
                       so.customer,
                       so.territory,
                       so.name, 
  					           so.workflow_state,
                       so.kyosk_order_type,
                       soi.item_code,
                       soi.item_name,
                       soi.uom,
                       soi.item_group,
                       soi.qty,
                       soi.rate,
                       soi.discount_amount,
                       soi.amount
                FROM `kyosk-prod.erp_reports.sales_order` so
                cross join unnest(items) soi
                ),
invoice_and_delivery_note_mashup as (
                                      select distinct si.posting_date as posting_date_si, 
                                      dn.posting_date as posting_date_dn,
                                      si.territory,
                                      si.name as sales_invoice,
                                      si.delivery_note,
                                      si.sales_order,
                                      si.status as status_sales_invoice,
                                      dn.fulfilment_status as fulfiment_status_delivery_note,
                                      dn.workflow_state as workflow_state_delivery_note,
                                      si.workflow_state as workflow_state_sales_invoice,
                                      so.workflow_state as workflow_state_sales_order,
                                      so.kyosk_order_type,
                                      so.created_on_app,
                                      si.item_code,
                                      si.item_name,
                                      si.uom,
                                      si.stock_uom,
                                      si.conversion_factor,
                                      si.item_group,
                                      dn.modified,
                                      modified_dn,
                                      sum(so.qty) as qty_sales_order,
                                      sum(dn.qty) as qty_delivery_note,
                                      sum(si.qty) as qty_sales_invoice,
                                      sum(si.stock_qty) as stock_qty_sales_invoice,
                                      sum(so.discount_amount) as discount_amount_sales_order,
                                      sum(dn.discount_amount) as discount_amount_delivery_note,
                                      sum(so.amount) as amount_sales_order,
                                      sum(dn.amount) as amount_delivery_note,
                                      sum(si.amount) as amount_sales_invoice,
                                      from sales_invoice si
                                      left join delivery_note dn on si.delivery_note = dn.name and si.sales_order = dn.against_sales_order and si.item_code = dn.item_code
                                      left join sales_order so on  si.sales_order = so.name and si.item_code = so.item_code
                                      group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21
                                      )
select * from invoice_and_delivery_note_mashup
where FORMAT_DATE('%Y%m%d', posting_date_si) between @DS_START_DATE and @DS_END_DATE
--where posting_date_si = '2022-02-23'
--AND sales_invoice = 'ACC-SINV-2022-10463'
order by posting_date_si desc, sales_invoice,sales_order, delivery_note, item_code