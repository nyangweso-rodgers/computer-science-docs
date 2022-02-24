select 
    dn.posting_date, 
    date(dn.creation) creation_date,
    dn.territory,
    dn.name as delivery_note, 
    dn.kyosk_sales_order, 
    so.created_on_app,
    dn.workflow_state, 
    sum(odni.amount) as amount

from `tabDelivery Note` dn
left join `tabOriginal Delivery Note Item` odni on dn.name = odni.parent
where dn.posting_date between %(from_date)s and %(to_date)s
group by 1,2,3,4,5,6,7 order by 8 desc