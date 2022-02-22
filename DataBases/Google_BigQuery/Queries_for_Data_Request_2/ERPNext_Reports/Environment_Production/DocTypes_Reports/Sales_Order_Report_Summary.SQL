select 
       distinct so.transaction_date, 
       so.delivery_date, 
       so.name as sales_orders, 
       so.workflow_state,
       so.kyosk_order_type,
       so.territory, 
       sum(soi.amount) as amount
from `tabSales Order` so
left join `tabSales Order Item` soi on so.name = soi.parent
where so.transaction_date between %(from_date)s and %(to_date)s
and so.workflow_state not in ('INITIATED')
group by 1,2,3,4,5,6 order by 7 desc