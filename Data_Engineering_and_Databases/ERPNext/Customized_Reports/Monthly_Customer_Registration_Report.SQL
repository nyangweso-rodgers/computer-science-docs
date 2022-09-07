select
    extract(YEAR_MONTH from c.creation) as creation_month,
    c.company,
    count(distinct c.name) as count_of_customers_registered
from `tabCustomer` c
group by 1,2 order by 1,2