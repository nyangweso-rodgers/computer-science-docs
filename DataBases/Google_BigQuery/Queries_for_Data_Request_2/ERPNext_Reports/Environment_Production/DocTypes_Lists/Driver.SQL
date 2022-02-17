select 
    d.name,
    d.creation,
    d.modified,
    d.modified_by,
    d.owner,
    d.docstatus,
    d.status,
    d.full_name,
    d.transporter,
    d.cell_number,
    d.license_number,
    d.issuing_date,
    d.expiry_date,
    d.driver_warehouse,
    d.driver_territory,
    d.driver_login
from `tabDriver` d