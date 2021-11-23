create  table  `kyosk-prod.sales.partitioned_tbl_kyosk_monthly`
partition by date_trunc(created_date_kenya,month) as (
                  
                  select *
                  from
                  (select *, row_number()over(partition by id order by last_modified_date desc) as sale_kyosk_index
                  from
                  (
                  SELECT distinct id, 
                  date(created_date) as created_date, 
                  date(created_date, 'Africa/Nairobi') as created_date_kenya, 
                  last_modified_date,
                  date(last_modified_date, 'Africa/Nairobi') as last_modified_date_kenya,
                  created_by_name,
                  last_modified_by_name,
                  code as kyosk_code, 
                  name as kyosk_name, 
                  phone_numbers, 
                  coalesce(match_status, 'UNMATCHED') as  match_status,
                  json_extract_scalar(agent, '$.name') as agent_name,
                  json_extract_scalar(agent, '$.login') as agent_login,
                  created_on_app, 
                  last_updated_on_app,
                  coalesce(cast(has_smart_phone as string), 'Information not Captured') as has_smart_phone,
                  owner,
                  json_extract_scalar(owner, '$.phoneNumbers') as owner_phone_numbers,
                  json_extract_scalar(owner, '$.phoneNumber') as owner_phone_number
                  FROM `kyosk-prod.sales.tbl_kyosk` 
                  )
                  ) where sale_kyosk_index = 1)