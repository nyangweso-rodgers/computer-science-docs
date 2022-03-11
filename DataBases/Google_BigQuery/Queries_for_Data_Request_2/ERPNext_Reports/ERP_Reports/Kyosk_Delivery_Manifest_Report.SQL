select 
    so.transaction_date as order_date,
    so.delivery_date as scheduled_delivery_date,
    #odni.posting_date as delivery_note_posting_date,
    #sii.posting_date as sales_invoice_posting_date,
    
    so.territory,
    so.name as sales_order,
    odni.parent as delivery_note,
    sii.parent as sales_invoice,
    
    so.kyosk_order_type,
    so.workflow_state as sales_order_workflow_state,
    so.delivery_status as sales_order_delivery_status,
    
    soi.fulfilment_status as sales_order_fulfilment_status,
    odni.fulfilment_status as delivery_note_fulfilment_status,
    
    odni.kyosk_reason,
    soi.item_group,
    soi.item_name,
    soi.uom,
    
    soi.qty as sales_order_qty,
    odni.qty as delivery_note_qty,
    sii.qty as sales_invoice_qty,
    
    soi.rate as sales_order_rate,
    odni.rate as delivery_note_rate,
    sii.rate as sale_invoice_rate,
    
    soi.discount_amount as sales_order_discount_amount,
    odni.discount_amount as delivery_note_discount_amount,
    sii.discount_amount as sales_invoice_discount_amount,
    
    soi.amount as sale_order_amount,
    odni.amount as delivery_note_amount,
    sii.amount as sales_invoice_amount
    
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
left join  `tabOriginal Delivery Note Item` odni on soi.name = odni.so_detail
left join `tabSales Invoice Item` sii on soi.name = sii.so_detail

where so.workflow_state not in ('INITIATED')

and so.transaction_date = '2022-03-03'
#and so.territory = 'Athi River'
#and so.kyosk_order_type = 'Bootsale'

order by order_date desc, sales_order, delivery_note