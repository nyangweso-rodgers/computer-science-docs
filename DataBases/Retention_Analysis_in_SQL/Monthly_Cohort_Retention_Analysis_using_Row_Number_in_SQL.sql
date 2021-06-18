with
all_deliveries as 
(
select *, row_number()over(partition by shop_id order by delivery_month) as delivery_month_index
from
(SELECT distinct stall_id as shop_id, date_trunc(date, month) as delivery_month FROM `twigadms.dmslive.cache_deliveries_v1_v2` order by 1,2)
order by 1,2
),

monthly_cohort_retention_list as (
select distinct a.shop_id, a.delivery_month as joining_month,  b.delivery_month, date_diff(b.delivery_month, a.delivery_month, month) as months_since_conversion
from all_deliveries a
join (select shop_id, delivery_month from all_deliveries) b using(shop_id)
where a.delivery_month_index = 1
order by 1,2),

monthly_cohort_retention_count as (select distinct joining_month, months_since_conversion, count(distinct shop_id) as shops from monthly_cohort_retention_list group by 1,2)

select * from monthly_cohort_retention_count