select 
    distinct si.posting_date,
    date(si.creation) as creation_date,
    si.due_date,
    si.territory,
    si.name as sales_invoice,
    sii.delivery_note,
    sii.sales_order,
    si.status,
    sum(sii.amount) as amount
    
from `tabSales Invoice` si
left join `tabSales Invoice Item` sii on si.name = sii.parent
where si.posting_date between %(from_date)s and %(to_date)s
group by 1,2,3,4,5,6,7,8 order by 9 desc