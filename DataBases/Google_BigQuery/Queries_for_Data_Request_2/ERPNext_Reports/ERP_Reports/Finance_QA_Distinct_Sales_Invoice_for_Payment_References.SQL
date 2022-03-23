select
    distinct date(per.creation) as payment_entry_creation_date,
    per.reference_name as sales_invoice,
    pe.driver,
    pe.party_name,
    count(distinct per.parent) as count_of_payment_entries,
    #group_concat(distinct per.parent order by per.parent asc SEPARATOR '/ ') as payment_entries,
    group_concat(distinct pe.reference_no order by pe.reference_no asc SEPARATOR '/ ') as mpesa_codes,
    group_concat(distinct pe.reference_date order by pe.reference_date asc SEPARATOR '/ ') as reference_dates,
    group_concat(distinct pe.posting_date order by pe.posting_date asc SEPARATOR '/ ') as posting_dates,
    sum(pe.paid_amount) as paid_amount,
    sum(per.allocated_amount) as allocated_amount,
    sum(pe.paid_amount) - sum(per.allocated_amount) as variance
from `tabPayment Entry Reference` per
left join `tabPayment Entry` pe on per.parent = pe.name 
where pe.party_type = 'Customer'
and date(per.creation) between %(from_date)s and %(to_date)s
group by 1,2,3,4
order by count_of_payment_entries desc