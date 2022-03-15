select 
   distinct kyosk_identity_code,
   owner_phone_number,
   mobile_no,
   count(*) as number_of_records,
   group_concat(distinct territory order by territory SEPARATOR '/ ') as territory,
   group_concat(distinct route_code order by route_code SEPARATOR '/ ') as route_code
from `tabCustomer`
group by 1,2,3
order by 4 desc