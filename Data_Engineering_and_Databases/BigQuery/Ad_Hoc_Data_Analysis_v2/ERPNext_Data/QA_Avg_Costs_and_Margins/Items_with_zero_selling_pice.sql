select
    DISTINCT dn.posting_date,
    dn.name as delivery_note,
    dn.workflow_state,
    dn.territory,
    dni.name,
    dni.item_group,
    dni.item_name,
    dni.uom,
    dni.price_list_rate,
    dni.rate,
    dni.qty,
    dni.amount,
    dn.grand_total
from `tabDelivery Note` dn
left join `tabDelivery Note Item` dni on dn.name = dni.parent
where dn.workflow_state in ('PAID', 'DELIVERED') and dni.price_list_rate = 0
order by 1 desc