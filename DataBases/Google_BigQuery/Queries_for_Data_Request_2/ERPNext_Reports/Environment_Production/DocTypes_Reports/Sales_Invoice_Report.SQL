select 
    si.posting_date,
    si.posting_time,
    si.due_date,
    si.creation,
    si.territory,
    si.name,
    sii.sales_order,
    sii.delivery_note,
    si.customer,
    si.customer_name,
    sii.item_code,
    sii.item_name,
    sii.item_group,
    sii.uom,
    sii.qty,
    sii.rate,
    sii.discount_amount,
    sii.amount
from `tabSales Invoice` si
left join `tabSales Invoice Item` sii on si.name = sii.parent
where si.posting_date between %(from_date)s and %(to_date)s