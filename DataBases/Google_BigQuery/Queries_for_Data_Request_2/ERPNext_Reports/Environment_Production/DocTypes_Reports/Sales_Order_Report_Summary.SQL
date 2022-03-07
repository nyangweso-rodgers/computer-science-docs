select
       distinct so.transaction_date,
       hour(so.creation) as creation_hour,
       so.delivery_date, 
       so.name as sales_order, 
       so.workflow_state,
       so.kyosk_order_type,
       so.created_on_app,
       so.territory, 
       sum(soi.amount) as amount
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
where so.transaction_date between %(from_date)s and %(to_date)s
and so.workflow_state not in ('INITIATED')
#and so.kyosk_order_type = 'Bootsale'
group by 1,2,3,4,5,6,7,8 
order by transaction_date desc, sales_order