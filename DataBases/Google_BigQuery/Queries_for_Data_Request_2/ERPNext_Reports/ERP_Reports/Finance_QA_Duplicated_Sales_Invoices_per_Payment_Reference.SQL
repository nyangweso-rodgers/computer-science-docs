select 
    distinct distinct date(per.creation) as payment_entry_creation_date,
    time ( per.creation) as creation_time,
    pe.posting_date as payment_entry_posting_date,
    pe.driver,
    pe.party_type,
    pe.party_name,
    per.reference_name as sales_invoice,
    per.parent as payment_reference,
    ROW_NUMBER() OVER (PARTITION BY per.reference_name ORDER BY per.creation asc) as row_num,
    pe.reference_no as mpesa_codes,
    pe.paid_amount,
    per.allocated_amount,
    pe.paid_amount - per.allocated_amount as variance
from `tabPayment Entry Reference` per
left join `tabPayment Entry` pe on per.parent = pe.name 
where pe.party_type = 'Customer'
and date(per.creation) between %(from_date)s and %(to_date)s
order by sales_invoice, creation_time