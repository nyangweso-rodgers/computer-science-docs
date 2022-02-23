select
    pe.posting_date,
    pe.reference_date,
    pe.name as payment_entry, 
    per.reference_name as sales_invoice,
    pe.payment_reference,
    pe.reference_no,
    pe.driver,
    pe.mode_of_payment,
    pe.payment_method_sub_category,
    pe.party_type,
    pe.party,
    pe.party_name,
    pe.paid_from,
    pe.paid_to,
    pe.paid_amount,
    pe.received_amount,
    per.allocated_amount
    
from `tabPayment Entry` pe
left join `tabPayment Entry Reference` per on pe.name = per.parent
where pe.posting_date between %(from_date)s and %(to_date)s

and pe.party_type in ('Customer')
and per.reference_name = 'ACC-SINV-2022-11702'