select
    sr.posting_date,
    sr.purpose,
    sr.territory,
    sri.warehouse,
    sr.name,
    sri.item_code,
    sri.item_name,
    sri.qty,
    sri.valuation_rate,
    sri.amount
from `tabStock Reconciliation` sr
left join `tabStock Reconciliation Item` sri on sr.name = sri.parent
order by 1,3,5