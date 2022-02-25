select 
        so.transaction_date as order_date,
        so.delivery_date,
        so.customer_name,
        so.territory,
        so.name as sales_order,
        so.workflow_state,
        kyosk_order_type,
        soi.item_code,
        soi.item_name,
        soi.uom,
        soi.qty,
        soi.rate,
        soi.discount_amount,
        soi.amount
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
where so.transaction_date between %(from_date)s and %(to_date)s
and so.workflow_state not in ('INITIATED')