select 
    so.transaction_date,
    so.delivery_date,
    so.name as sales_order,
    dni.parent as delivery_note,
    so.created_on_app,

    so.workflow_state,
    so.territory,
    soi.item_code,
    soi.item_name,
    soi.uom,
    
    soi.qty as sales_order_qty,
    dni.qty as delivery_note_qty,
    
    soi.rate as sales_order_rate,
    dni.rate as delivery_note_rate,
    dni.rate - soi.rate as rate_difference,
    
    soi.discount_amount as sales_order_discount_amount,
    dni.discount_amount as delivery_note_discount_amount,
    
    soi.amount as sales_order_amount,
    dni.amount as delivery_note_amount,
    
    dni.amount - soi.amount as amount_difference
    
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
left join `tabDelivery Note Item` dni on so.name = dni.against_sales_order and soi.name = dni.so_detail
where so.delivery_date >= '2022-02-12' and (dni.rate - soi.rate) > 0
order by delivery_date desc