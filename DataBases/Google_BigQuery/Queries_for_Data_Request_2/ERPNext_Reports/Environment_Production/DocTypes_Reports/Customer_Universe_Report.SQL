select 
    distinct date(c.creation) as creation_date,
    date(c.modified) as modified_date,
    created_by_name,
    last_modified_by_name,
    customer_name,
    kyosk_identity_code,
    first_name,
    last_name,
    territory,
    sale_district_code,
    route_code,
    mobile_no,
    owner_phone_number,
    duka_longitude,
    duka_latitude
from `tabCustomer` c
order by 1 desc