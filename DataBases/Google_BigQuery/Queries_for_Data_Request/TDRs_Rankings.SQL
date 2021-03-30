with 
--------------------------------------------- Date Variables----------------------------------------------------------
dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2020-01-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sales_days as (select *,date_trunc(date,week) as week from dates), --where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
date_vars AS (
  --SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
    SELECT DATE '2021-03-24' as current_start_date, DATE '2021-03-24' as current_end_date ),
----------------------------------------------------------- TDRs Tracker --------------------------------------------------
route_mapping as (select distinct route_id, depot_id, region_id,route_name, depot_name, region_name from dmslive.cache_route_mapping),
sales_route_team as (select distinct sale_date, route_id, route_team_id from dmslive.sales_route_team),
sales_route_team_member as (select distinct sale_date, route_team_id, user_id from dmslive.sales_route_team_member),
user_service_user as (select distinct user_id, first_name,last_name,user_number,phone_number,email, primary_role_id from dmslive.user_service_user),
user_service_role as (select distinct role_id, role_name from dmslive.user_service_role where active = true),

tdr_assignment_mashup as (
                          select srt.sale_date, srt.route_id,route_name, depot_name, region_name,srtm.user_id,user_number, first_name, last_name,concat(first_name,' ', last_name) as full_name,
                          phone_number,primary_role_id, role_name 
                          from sales_route_team srt
                          left join route_mapping rm on rm.route_id = srt.route_id
                          left join sales_route_team_member srtm on srtm.sale_date = srt.sale_date and srtm.route_team_id = srt.route_team_id
                          left join user_service_user usu on usu.user_id = srtm.user_id
                          left join user_service_role usr on usr.role_id = usu.primary_role_id
                          ),
combined_tdr_names as (
                        select distinct route_name, depot_name, count(distinct user_id) as number_of_tdrs,
                        string_agg(distinct full_name, "/" order by full_name) as full_name 
                        from tdr_assignment_mashup, date_vars where sale_date between current_start_date and current_end_date 
                        and role_name in ('Trade Development Representative') group by 1,2
                        ),
 --------------------------------------------------- Actuals -----------------------------------------------------------
routes as (select distinct depot_name, route_name,route_id, 400000 as revenue_target from route_mapping),
daily_route_target as (select * from routes,daily_sales_days),
targets as (select distinct depot_name, route_name, sum(revenue_target) as revenue_target from daily_route_target,date_vars where date between current_start_date and current_end_date group by 1,2),


work_orders as (select * from dmslive.cache_work_order where depot_name not in ('Key Accounts')),
finance_deliveries as (select * from dmslive.cache_finance_deliveries where depot_name not in ('Key Accounts') and route_name not in ('Staff Route')),
deliveries as (
               select distinct depot_name, route_name, sum(amount) as revenue 
               from finance_deliveries, date_vars where delivery_date between current_start_date and current_end_date group by 1,2
               ),
target_visits as (
                    select distinct depot_name, route_name, count(shop_id) as shops_to_be_visited 
                    from work_orders, date_vars where sale_date between current_start_date and current_end_date group by 1,2
                    ),
actual_visits as (
                  select distinct depot_name, route_name, count(shop_id) as shops_visited 
                  from work_orders, date_vars where sale_date between current_start_date and current_end_date and comment is not null group by 1,2
                  ),
actual_conversions as (
                        select distinct depot_name, route_name, count(shop_id) as shops_converted 
                        from work_orders, date_vars where sale_date between current_start_date and current_end_date and comment is not null and orderd_amount > 0 group by 1,2
                        ),
shops_within_range as (
                        select distinct depot_name, route_name, count(shop_id) as within_range 
                        from work_orders, date_vars where sale_date between current_start_date and current_end_date and distance <= 50 and comment is not null group by 1,2
                        ),

first_mashup as (
          select d.*,revenue_target,shops_to_be_visited, shops_visited,shops_converted,within_range
          from deliveries d
          left join targets t on  t.depot_name = d.depot_name and t.route_name = d.route_name
          left join target_visits tv on  tv.depot_name = d.depot_name and tv.route_name = d.route_name
          left join actual_visits cv on  cv.depot_name = d.depot_name and cv.route_name = d.route_name
          left join actual_conversions ac on ac.depot_name = d.depot_name and ac.route_name = d.route_name
          left join shops_within_range swr on  swr.depot_name = d.depot_name and swr.route_name = d.route_name
          ),
second_mashup as (
                  select *, 
                  sum(revenue)/sum(revenue_target) as achived_revenue, (sum(revenue)/sum(revenue_target)) * 0.5 as weighted_achieved_revenue,
                  sum(shops_visited)/sum(shops_to_be_visited) as completion,
                  sum(shops_converted)/sum(shops_visited) as conversion, (sum(shops_converted)/sum(shops_visited)) / 0.5 as achieved_conversion,
                  sum(within_range)/sum(shops_visited) as location_accuracy, (sum(within_range)/sum(shops_visited)) / 0.95 as achieved_location_accuracy
                  from first_mashup group by 1,2,3,4,5,6,7,8
                  ),
third_mashup as (
                  select *, (weighted_behavious_performance+weighted_achieved_revenue) as performance
                  from
                  (select *, (completion+achieved_conversion+achieved_location_accuracy)/3*0.5 as weighted_behavious_performance from second_mashup)
                  )

select a.*, row_number()over(order by performance desc) as rank,full_name as tdrs_name from third_mashup a
left join combined_tdr_names b on b.route_name = a.route_name and a.depot_name = b.depot_name