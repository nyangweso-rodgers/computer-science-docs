Select
    distinct si.posting_date as invoice_posting_date,
    dn.posting_date as delivery_note_posting_date,
    DATEDIFF(si.posting_date, dn.posting_date) as delta_posting_date,
    dn.scheduled_delivery_date,
    si.territory,
    si.name as sales_invoice,
    sii.delivery_note,
    sii.sales_order,
    so.kyosk_order_type,
    so.sales_partner,
    dn.workflow_state as delivery_note_workflow_state,
    odni.fulfilment_status as delivery_note_fulfilment_status,
    dn.lr_no as delivery_trip,
    dn.driver,
    dn.driver_name,
    si.status as invoice_status,
    sii.item_name,
    sii.uom,
    sum(odni.qty) as qty_delivery_note,
    sum(sii.qty) as qty_sales_invoice,
    sum(odni.price_list_rate) as delivery_note_price_list_rate,
    sum(sii.price_list_rate) as sales_invoice_price_list_rate,
    sum(odni.discount_amount) as delivery_note_discount,
    sum(sii.discount_amount) as sales_invoice_discount,
    sum(odni.rate) as delivery_note_rate,
    sum(sii.rate) as sales_invoice_rate,
    
    sum(odni.amount) as delivery_note_amount,
    sum(sii.amount) as amount_sales_invoice,
    sum(sii.amount) - sum(odni.amount) as delta_amount
    
from `tabSales Invoice` si
left join `tabSales Invoice Item` sii on si.name = sii.parent
left join `tabSales Order` so on sii.sales_order = so.name
left join `tabDelivery Note` dn on sii.delivery_note = dn.name
left join `tabOriginal Delivery Note Item` odni on sii.delivery_note = odni.parent and sii.item_code = odni.item_code
where si.posting_date between %(from_date)s and %(to_date)s
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
#order by si.posting_date desc, si.name, sales_order
order by delta_posting_date desc