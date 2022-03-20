Select 
    distinct dn.posting_date,
    dn.territory,
    dn.name as delivery_note,
    dni.against_sales_order as sales_order,
    dn.workflow_state,
    dni.item_group,
    dni.name,
    dni.item_name,
    dni.item_code,
    dni.uom,
    dni.qty,
    dni.price_list_rate,
    dni.discount_amount,
    dni.rate,
    dni.amount,
    pi.item_name as packed_item_name,
    pi.uom as packed_item_uom,
    pi.conversion_factor as packed_item_conversion_factor,
    pi.qty as packed_item_qty,
    pi.projected_qty as packed_item_projected_qty,
    pi.actual_qty as packed_item_actual_qty
from `tabDelivery Note` dn
left join `tabDelivery Note Item` dni on dn.name = dni.parent
left join `tabPacked Item` pi on dni.name = pi.parent_detail_docname
where dn.workflow_state in ('DELIVERED','PAID')
and dn.posting_date between %(from_date)s and %(to_date)s
#and dn.name in  ('MAT-DN-2022-108541')
#and dn.posting_date = '2022-03-17'
order by sales_order, delivery_note