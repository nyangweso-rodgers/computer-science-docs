-- created by Rodgers Nyangweso
with
sales_kyosk as (
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
                  CHAR_LENGTH(phone_numbers) as phone_numbers_count,
                  trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])') as phone_number_1,
                  trim(split(phone_numbers, ',')[SAFE_ORDINAL(2)], '(""])') as phone_number_2,
                  trim(split(phone_numbers, ',')[SAFE_ORDINAL(3)], '(""])') as phone_number_3,
                  CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])')) as phone_number_1_count,
                  CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(2)], '(["])')) as phone_number_2_count,
                  CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(3)], '(["])')) as phone_number_3_count,
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
                  ),
sale_kyosk_with_index as (select *, row_number()over(partition by id order by last_modified_date desc) as sale_kyosk_index from sales_kyosk)
select * from sale_kyosk_with_index where sale_kyosk_index = 1