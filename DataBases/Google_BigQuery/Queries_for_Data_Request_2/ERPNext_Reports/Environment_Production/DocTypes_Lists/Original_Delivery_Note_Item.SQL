select 
    odni.creation,
    odni.modified,
    odni.name,
    against_sales_order,
    odni.parent,
    fulfilment_status,
    item_code,
    item_name,
    uom,
    item_group,
    qty,
    returned_qty,
    rate,
    amount
from `tabOriginal Delivery Note Item` odni