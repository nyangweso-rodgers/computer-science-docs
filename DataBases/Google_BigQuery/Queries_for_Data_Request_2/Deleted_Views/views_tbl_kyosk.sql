with 
sales_kyosks as (
                       select *, 
                       case when phone_number_1 = phone_number_2 then true else false end as phone_1_and_2_duplicate_status,
                       case when phone_number_1 = phone_number_3 then true else false end as phone_1_and_3_duplicate_status,
                       case when phone_number_2 = phone_number_3 then true else false end as phone_2_and_3_duplicate_status,
                       case when (phone_number_1 = phone_number_2) and (phone_number_1 = phone_number_3) and (phone_number_2 = phone_number_3) then true else false end as phone_1_and_2_and_3_duplicate_status
                       from
                       (
                       SELECT *except(owner, agent),
                       CHAR_LENGTH(phone_numbers) as phone_numbers_length,
                       trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])') as phone_number_1,
                       trim(split(phone_numbers, ',')[SAFE_ORDINAL(2)], '(""])') as phone_number_2,
                       trim(split(phone_numbers, ',')[SAFE_ORDINAL(3)], '(""])') as phone_number_3,
                       JSON_EXTRACT_SCALAR(owner, '$.name') as owner_name, JSON_EXTRACT_SCALAR(owner, '$.email') as owner_email, JSON_EXTRACT_SCALAR(owner, '$.phoneNumber') as owner_phone_number,
                       JSON_EXTRACT_SCALAR(agent, '$.name') as agent_name, JSON_EXTRACT_SCALAR(agent, '$.login') as agent_login, JSON_EXTRACT_SCALAR(agent, '$.phoneNumber') as agent_phone_number,
                       from `kyosk-prod.sales.tbl_kyosk`
                       )
                       ),
sales_orders as (
                 select *, row_number()over(partition by kyosk_code order by order_date desc) as order_date_index
                 from
                 (SELECT distinct kyosk_code, isz.name as service_zone_name, so.code as order_code, date(so.date_created) as order_date, min(date(so.created_date, 'Africa/Nairobi')) as min_order_created_date, 
                 max(date(so.created_date, 'Africa/Nairobi')) as max_order_created_date, count(distinct date(so.created_date, 'Africa/Nairobi')) as total_order_freq 
                 FROM `kyosk-prod.sales.tbl_orders` so
                 left join `kyosk-prod.inventory.tbl_ops_item` ioi on so.code = ioi.order_code
                 left join `kyosk-prod.inventory.tbl_service_zone`  isz on ioi.zone_id = isz.id
                 group by 1,2,3,4)
                  ),
kyosk_orders_mashup as (
                        select sk.*, so.*except(kyosk_code, order_date_index), case when min_order_created_date is null then 'Non-Converted' else 'Converted' end as conversion_status 
                        from sales_kyosks sk 
                        left join (select * from sales_orders where order_date_index = 1) so on sk.code = so.kyosk_code 
                        order by phone_numbers_length desc
                        ),

final_kyosk_list as (
                      select distinct phone_number_1, phone_number_2,phone_number_3, 
                      CHAR_LENGTH(phone_number_1) as length_phone_number_1, 
                      CHAR_LENGTH(phone_number_2) as length_phone_number_2, 
                      CHAR_LENGTH(phone_number_3) as length_phone_number_3,
                      code,
                      name as shop_name,
                      owner_name,
                      agent_name,
                      service_zone_name,
                      date(created_date) as date_created,date(last_modified_date) as date_modified,status, conversion_status,min_order_created_date, max_order_created_date,total_order_freq,
                      row_number()over(partition by phone_number_1 order by phone_number_1) as index, phone_numbers
                      from kyosk_orders_mashup
                      )
select * from final_kyosk_list order by 2 asc 