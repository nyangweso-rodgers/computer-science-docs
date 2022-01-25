-- Created by Rodgers Nyangweso
-- Week on Week Retention for Dukas with 2+ orders
with
inventory_ops_item_report as (
                              select distinct original_delivery_date_kenya, 
                              kyosk_code
                              from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_original_delivery_date`
                              ),
weekly_mashup as (
                  select distinct kyosk_code, 
                  date_trunc(original_delivery_date_kenya, week) as  original_delivery_week,
                  count(distinct original_delivery_date_kenya) as order_frequency
                  from inventory_ops_item_report
                  group by 1,2
                  ),
weekly_retention as (
                    select date_add(last_week.original_delivery_week, interval 1 week) as week, 
                    count(distinct last_week.kyosk_code) as active_dukas,
                    count(distinct this_week.kyosk_code) as retained_dukas,
                    cast(SAFE_DIVIDE(count(distinct this_week.kyosk_code) , coalesce(count(distinct last_week.kyosk_code),null))as float64) as week_on_week_retention
                    from weekly_mashup as last_week
                    left join (select * from weekly_mashup where order_frequency >= 2 ) as this_week on last_week.kyosk_code = this_week.kyosk_code and this_week.original_delivery_week = date_add(last_week.original_delivery_week, interval 1 week)
                    where last_week.order_frequency >= 2 --and this_week.order_frequency >= 2
                    group by 1 
                    )
select * from weekly_retention order by 1 desc