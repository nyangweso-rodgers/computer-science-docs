with
date_vars AS (
              SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
              --SELECT DATE '2021-09-06' as current_start_date, DATE '2021-09-11' as current_end_date ),
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, service_zone_name,
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by order_created_date_kenya desc) as index
                                        from
                                        (select distinct kyosk_code, order_created_date_kenya , service_zone_name from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2` )
                                        )
                                        where index = 1
                                        ),
duka_universe_report as (
                          select a.*, 
                          b.service_zone_name 
                          from `kyosk-prod.inventory_v2.fed_scheduled_duka_universe_report_v2` a
                          left join dukas_with_last_served_service_zone b on a.kyosk_code = b.kyosk_code
                          ),
duka_universe_summary as (
                           SELECT distinct service_zone_name, 
                           count(distinct kyosk_code) as duka_universe, 
                           count(distinct(case when active_status = 'Active' then kyosk_code else null end)) as active_dukas,
                           count(distinct(case when active_status = 'Active' then kyosk_code else null end)) / count(distinct kyosk_code) as active_dukas_percent,
                           count(distinct(case when active_status = 'In-Active' then kyosk_code else null end)) as inactive_dukas,
                           count(distinct(case when active_status = 'In-Active' then kyosk_code else null end)) / count(distinct kyosk_code) as inactive_dukas_percent,
                           count(distinct(case when active_status = 'Dormant' then kyosk_code else null end)) as dormant_dukas,
                           count(distinct(case when active_status = 'Dormant' then kyosk_code else null end)) / count(distinct kyosk_code) as dormant_dukas_percent,
                           count(distinct(case when match_status = 'MATCHED' then kyosk_code else null end)) as matched_dukas,
                           count(distinct(case when match_status = 'MATCHED' then kyosk_code else null end)) / count(distinct kyosk_code) as matched_dukas_percent,
                           count(distinct(case when match_status = 'UNMATCHED' then kyosk_code else null end)) as unmatched_dukas,
                           count(distinct(case when match_status = 'UNMATCHED' then kyosk_code else null end)) / count(distinct kyosk_code) as unmatched_dukas_percent,
                           count(distinct(case when has_smart_phone is true then kyosk_code else null end)) as has_smart_phone,
                           count(distinct(case when has_smart_phone is true then kyosk_code else null end)) / count(distinct kyosk_code) as has_smart_phone_percent,
                           count(distinct(case when match_status = 'MATCHED' and first_order_date is not null then kyosk_code else null end)) as matched_dukas_with_at_least_one_order,
                           count(distinct(case when match_status = 'MATCHED' and first_order_date is null then kyosk_code else null end)) as matched_dukas_with_an_order,
                           count(distinct(case when match_status = 'MATCHED' and first_order_date is not null and order_count_duka_app >=1 then kyosk_code else null end)) as matched_dukas_with_at_least_one_order_on_duka_app,
                           FROM duka_universe_report,date_vars where created_date_kenya between current_start_date and current_end_date
                           group by 1
                           )
select * from duka_universe_summary