select 
    dni.creation,
    dni.modified,
    dni.name,
    dni.against_sales_order,
    dni.so_detail,
    dni.parent,
    dni.item_code,
    dni.item_name,
    dni.item_group,
    dni.uom,
    dni.price_list_rate,
    dni.discount_amount,
    dni.amount
from `tabDelivery Note Item` dni[]