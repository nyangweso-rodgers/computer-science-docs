select
    pe.posting_date,
    pe.reference_date,
    pe.name as payment_entry,
    pe.status,
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
    pe.paid_to_account_type,
    pe.party_balance,
    pe.paid_from_account_balance,
    pe.paid_to_account_balance,
    pe.paid_amount,
    pe.received_amount
from `tabPayment Entry` pe
where pe.posting_date between %(from_date)s and %(to_date)s