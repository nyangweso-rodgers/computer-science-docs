select
       distinct so.transaction_date,
       hour(so.creation) as creation_hour,
       so.delivery_date, 
       so.name as sales_order, 
       so.workflow_state,
       soi.fulfilment_status,
       so.kyosk_order_type,
       so.created_on_app,
       so.territory, 
       sum(soi.qty) as qty,
       sum(soi.discount_amount) as discount_amount,
       sum(soi.amount) as amount
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
where so.transaction_date between %(from_date)s and %(to_date)s
and so.workflow_state not in ('INITIATED')
group by 1,2,3,4,5,6,7,8,9
order by transaction_date desc, sales_order, item_name