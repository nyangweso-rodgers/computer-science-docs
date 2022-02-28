select 
    distinct dn.scheduled_delivery_date,
    dn.posting_date,
    dn.territory,
    dn.name as delivery_note, 
    dn.kyosk_sales_order,
    dn.workflow_state, 
    dn.driver,
    dn.driver_name,
    sum(odni.amount) as amount
from `tabDelivery Note` dn
left join `tabOriginal Delivery Note Item` odni on dn.name = odni.parent
where dn.scheduled_delivery_date between %(from_date)s and %(to_date)s
group by 1,2,4,5,6,7,8 order by 9 desc