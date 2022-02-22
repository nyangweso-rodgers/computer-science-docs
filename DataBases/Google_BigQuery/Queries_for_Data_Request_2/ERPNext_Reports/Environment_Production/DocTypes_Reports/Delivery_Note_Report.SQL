select 
    dn.posting_date,
    dn.delivery_date,
    dn.lr_date,
    dn.customer,
    dn.customer_name,
    dn.territory,
    dn.workflow_state,
    odni.fulfilment_status,
    dn.driver,
    dn.vehicle_no,
    dn.driver_name,
    dn.name as delivery_note,
    odni.against_sales_order,
    odni.item_code,
    odni.item_name,
    odni.uom,
    odni.item_group,
    odni.qty,
    odni.returned_qty,
    odni.rate,
    odni.discount_amount,
    odni.amount
from `tabDelivery Note` dn
left join `tabOriginal Delivery Note Item` odni on dn.name = odni.parent
where dn.posting_date between %(from_date)s and %(to_date)s