select 
    soi.parent,
    date(soi.creation) as creation,
    date(soi.modified) as modified,
    soi.delivery_date,
    soi.transaction_date,
    soi.fulfilment_status,
    soi.item_code,
    soi.item_name,
    soi.uom,
    soi.item_group,
    soi.qty,
    soi.base_price_list_rate,
    soi.price_list_rate,
    soi.discount_amount,
    soi.amount
from `tabSales Order Item` soi
order by transaction_date desc