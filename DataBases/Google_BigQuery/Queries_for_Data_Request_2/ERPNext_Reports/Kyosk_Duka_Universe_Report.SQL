select 
    c.kyosk_identity_code as duka_code,
    c.customer_name,
    c.name as duka_name,
    date(c.creation) as date_created,
    date(c.modified) as last_modified_date,
    c.owner as created_by,
    c.modified_by as last_modified_by,
    c.district,
    c.territory,
    c.route_code,
    c.sale_district_code,
    c.duka_latitude,
    c.duka_longitude,
    c.owner_phone_number,
    c.owner_email,
    c.disabled,
    c.has_smart_phone,
    c.agent,
    c.agent_name,
    c.agent_email,
    c.agent_phone_number
from `tabCustomer` as c
where c.creation between %(from_date)s and %(to_date)s