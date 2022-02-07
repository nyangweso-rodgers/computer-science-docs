with
ops_item_report as (
                     SELECT 
                     date(completed_date_kenya) as original_delivery_date_kenya,
                     kyosk_code,
                     service_zone_name
                     FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2`
                     where status = 'Completed' 
                     ),
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, service_zone_name
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by original_delivery_date_kenya desc) as index
                                        from
                                        (select distinct kyosk_code, original_delivery_date_kenya, service_zone_name from ops_item_report)
                                        )
                                        where index = 1
                                        ),
monthly_ops_item_with_service_zones as (
                                  select distinct oir.kyosk_code,
                                  date_trunc(oir.original_delivery_date_kenya,month) as original_delivery_month,
                                  dwlssz.service_zone_name
                                  from ops_item_report oir
                                  left join dukas_with_last_served_service_zone dwlssz on oir.kyosk_code = dwlssz.kyosk_code
                                  ),
daily_ops_item_with_service_zones as (
                                  select distinct oir.kyosk_code,
                                  oir.original_delivery_date_kenya,
                                  dwlssz.service_zone_name
                                  from ops_item_report oir
                                  left join dukas_with_last_served_service_zone dwlssz on oir.kyosk_code = dwlssz.kyosk_code
                                  ),

cohort_items as (
                  select 
                  min(original_delivery_month) as cohort_month, 
                  kyosk_code,
                  service_zone_name
                  from monthly_ops_item_with_service_zones
                  group by 2,3
                  ),
cohort_size_customers as (
                            select distinct service_zone_name, 
                            cohort_month,
                            count(1) as num_users
                            from cohort_items
                            group by 1,2 order by 1,2
                            ),
user_activities as (
                    select 
                    distinct doiwsz.kyosk_code,
                    doiwsz.service_zone_name,
                    date_diff(date_trunc(doiwsz.original_delivery_date_kenya,month), ci.cohort_month, month) as month_number
                    from daily_ops_item_with_service_zones doiwsz
                    left join cohort_items ci on doiwsz.kyosk_code = ci.kyosk_code and doiwsz.service_zone_name = ci.service_zone_name
                    order by 1,2,3
                    ),
                    
retention_table as (
                      select A.service_zone_name,
                      C.cohort_month, 
                      A.month_number, 
                      count(1) as num_users, 
                      from user_activities A
                      left join cohort_items C on A.kyosk_code = C.kyosk_code and A.service_zone_name = C.service_zone_name
                      group by 1, 2,3 order by 1,2,3
                      ),
-- our final value: (cohort_month, size, month_number, percentage)
mashup as (
            select B.service_zone_name,

  B.cohort_month,
  S.num_users as total_customers,
  B.num_users as retained_customers,
  B.month_number,
  cast(B.num_users as float64) / S.num_users as customer_retention_percentage,

  
from retention_table B left join cohort_size_customers S ON B.cohort_month = S.cohort_month and B.service_zone_name = S.service_zone_name where B.cohort_month IS NOT NULL group by 1,2,3,4,5 order by 1,2, 5)

select * from mashup where service_zone_name = 'Thika Rd'