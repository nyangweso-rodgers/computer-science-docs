select 
    distinct dn.scheduled_delivery_date,
    dn.posting_date,
    hour(dn.posting_time) as posting_hour,
    dn.territory,
    dn.name as delivery_note, 
    dn.kyosk_sales_order,
    dn.workflow_state,
    odni.fulfilment_status,
    dn.lr_no as delivery_trip,
    dn.driver,
    dn.driver_name,
    sum(odni.qty) as qty,
    sum(odni.discount_amount) as discount_amount,
    sum(odni.amount) as amount
from `tabDelivery Note` dn
left join `tabOriginal Delivery Note Item` odni on dn.name = odni.parent
where dn.scheduled_delivery_date between %(from_date)s and %(to_date)s
group by 1,2,4,5,6,7,8,9,10,11
order by kyosk_sales_order, delivery_note