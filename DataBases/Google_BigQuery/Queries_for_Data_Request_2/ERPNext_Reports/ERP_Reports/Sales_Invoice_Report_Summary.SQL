select 
    distinct si.posting_date,
    posting_time,
    hour(si.posting_time) as posting_hour,
    si.territory,
    si.name as sales_invoice,
    sii.delivery_note,
    sii.sales_order,
    si.status,
    sum(sii.qty) as qty,
    sum(sii.discount_amount) as discount_amount,
    sum(sii.amount) as amount
    
from `tabSales Invoice` si
left join `tabSales Invoice Item` sii on si.name = sii.parent
where si.posting_date between %(from_date)s and %(to_date)s
group by 1,2,3,4,5,6,7,8
order by sales_order, delivery_note, sales_invoice