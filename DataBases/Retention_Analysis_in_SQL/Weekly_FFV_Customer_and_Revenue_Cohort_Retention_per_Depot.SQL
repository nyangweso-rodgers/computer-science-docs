with shop_details as (
                        select distinct(shop_id) as shop_id, 
                        depot_name, 
                        route_name 
                        from dmslive.cache_shop_details
                        ),
----------------------------------------- Deliveries Data -------------------------------------------------------------------
finance_deliveries as (select * from dmslive.cache_finance_deliveries where product_type <> 'BUNDLE' and delivery_date between '2020-01-01' and '2021-04-30'),
vendor_segment as (select distinct unique_stalls as shop_id, string_agg(distinct product_type, "/" order by product_type) as segment from finance_deliveries group by 1),
deliveries as (select distinct(Unique_Stalls) as shop_id, delivery_date, sum(Amount) as revenue from finance_deliveries group by 1,2),      

 ---------------------------------------First Delivery Week ------------------------------------------------------------                  
first_delivery_week as (
                        select shop_id, 
                        date_trunc(min(delivery_date), week) as joining_week 
                        from  deliveries
                        group by 1
                        ),
 ----------------------------------Subsequent Delivery Week  ------------------------------------------------------------                  
next_delivery_week as (
                      select shop_id, 
                      date_trunc(delivery_date, week) as subsequent_delivery_week,
                      sum(revenue) as revenue
                      from deliveries
                      group by 1,2
                      )

-----------------------------------Delivery Retention Calculation----------------------------------------------------------------------
select first_delivery_week.shop_id, vs.segment,
        s.depot_name,
       first_delivery_week.joining_week, 
       next_delivery_week.subsequent_delivery_week,
       next_delivery_week.revenue,
       date_diff(next_delivery_week.subsequent_delivery_week, first_delivery_week.joining_week, week)  as week_since_signup
from first_delivery_week
join next_delivery_week on first_delivery_week.shop_id = next_delivery_week.shop_id
left join shop_details s on first_delivery_week.shop_id = s.shop_id
left join vendor_segment vs on first_delivery_week.shop_id = vs.shop_id
order by 1