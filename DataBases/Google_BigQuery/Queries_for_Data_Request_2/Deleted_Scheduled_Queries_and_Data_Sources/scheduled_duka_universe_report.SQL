with
sale_kyosks as (
                select *,
                CHAR_LENGTH(phone_numbers) as phone_numbers_count,
                trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])') as phone_number_1,
                trim(split(phone_numbers, ',')[SAFE_ORDINAL(2)], '(""])') as phone_number_2,
                trim(split(phone_numbers, ',')[SAFE_ORDINAL(3)], '(""])') as phone_number_3,
                CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])')) as phone_number_1_count,
                CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(2)], '(["])')) as phone_number_2_count,
                CHAR_LENGTH(trim(split(phone_numbers, ',')[SAFE_ORDINAL(3)], '(["])')) as phone_number_3_count,
                starts_with(trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])'), "+254") as phone_number_1_starts_with_plus_254,
                starts_with(trim(split(phone_numbers, ',')[SAFE_ORDINAL(1)], '(["])'), "254") as phone_number_1_starts_with_254,
                from 
                `kyosk-prod.sales.views_kyosk`
                ),
latest_duka_service_zone as (
                              select *
                              from
                              (
                              select *, row_number()over(partition by kyosk_code order by order_created_date_kenya desc ) as service_zone_index
                              from
                              (
                              SELECT distinct kyosk_code, 
                              service_zone_name, 
                              order_created_date_kenya
                              FROM  `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2`
                              where kyosk_code is not null
                              ))
                              where service_zone_index = 1
                              ),
sales_orders as (
                  SELECT distinct kyosk_code,
                  min(order_created_date_kenya) as first_order_date,
                  max(order_created_date_kenya) as last_order_date,
                  current_date() as current_date,
                  date_diff(date_trunc(current_date(),month), max(date_trunc(order_created_date_kenya,month)), month) as month_since_last_order,
                  count(distinct(case when created_on_app = 'DukaApp' then order_code else null end)) as order_count_duka_app,
                  count(distinct(case when created_on_app = 'AgentApp' then order_code else null end)) as order_count_agent_app
                  FROM  `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2`
                  group by 1
                  ),
users as (select *, 'YES' as kyosk_employee,  from `kyosk-prod.users.views_jhi_user` where phone_number is not null),
mashup as (
            select sk.*, 
            so.*except(kyosk_code), case when month_since_last_order is null then 'Dormant' when month_since_last_order <= 2 then 'Active' else 'In-Active' end as active_status,
            ldsz.service_zone_name,
            u.kyosk_employee, first_name as user_first_name, u.last_name as user_last_name
            from sale_kyosks sk
            left join sales_orders so on sk.kyosk_code = so.kyosk_code
            left join latest_duka_service_zone ldsz on sk.kyosk_code = ldsz.kyosk_code
            left join users u on sk.phone_number_1 = u.phone_number
            )
select *  from mashup 