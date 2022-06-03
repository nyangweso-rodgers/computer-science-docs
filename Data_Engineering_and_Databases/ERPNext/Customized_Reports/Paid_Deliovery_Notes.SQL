select
    distinct dn.posting_date,
    dn.scheduled_delivery_date,
    #count(distinct dn.customer) as count_of_customers,
    #count(distinct kyosk_sales_order) as count_of_sales_orders,
    #count(distinct dn.name) as count_of_delivery_notes,
    sum(amount) as amount
from `tabDelivery Note` dn
left join `tabDelivery Note Item` dni on dn.name = dni.parent
where dn.posting_date between %(from_date)s and %(to_date)s
and dn.workflow_state = 'PAID' #and dn.territory = 'Meru'
group by 1,2
order by 1,2