select 
    pi.name,
    date(pi.creation) as creation_date,
    pi.creation as creation_datetime,
    date(pi.modified) as modified_date,
    pi.modified as modified_datetime,
    pi.docstatus,
    pi.parent,
    pi.parentfield,
    pi.parenttype,
    pi.parent_item,
    pi.item_code,
    pi.item_name,
    pi.warehouse,
    pi.target_warehouse,
    pi.conversion_factor,
    pi.qty,
    pi.uom,
    pi.actual_qty,
    pi.projected_qty
from `tabPacked Item` pi
order by 2 desc