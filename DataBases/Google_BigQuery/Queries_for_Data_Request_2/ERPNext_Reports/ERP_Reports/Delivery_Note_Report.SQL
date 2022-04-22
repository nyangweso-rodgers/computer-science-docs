select 
    dn.scheduled_delivery_date,
    dn.posting_date,
    dn.territory,
    dn.workflow_state,
    odni.fulfilment_status,
    dn.driver,
    dn.driver_name,
    dn.name as delivery_note,
    odni.against_sales_order as sales_order,
    odni.item_name,
    odni.uom,
    odni.item_group,
    odni.qty,
    odni.rate,
    odni.discount_amount,
    odni.amount
from `tabDelivery Note` dn
left join `tabOriginal Delivery Note Item` odni on dn.name = odni.parent
where dn.scheduled_delivery_date between %(from_date)s and %(to_date)s