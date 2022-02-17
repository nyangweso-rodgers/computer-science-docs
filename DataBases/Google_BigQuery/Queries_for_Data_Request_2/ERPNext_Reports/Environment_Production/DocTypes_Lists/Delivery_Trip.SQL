select 
    dt.name,
    dt.creation,
    dt.modified,
    dt.departure_time,
    dt.status,
    dt.territory,
    dt.vehicle,
    dt.driver,
    dr.driver_name,
    dt.total_distance
from `tabDelivery Trip` dt