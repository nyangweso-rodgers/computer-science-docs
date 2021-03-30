with shop_details as (
                      select distinct(shop_id) as shop_id, 
                      depot_name, route_name, channel, sub_channel 
                      from dmslive.cache_shop_details
                      ),

deliveries as (
                  select distinct(Unique_Stalls) as shop_id, 
                  delivery_date,
                  sum(Amount) as revenue
                  from `dmslive.cache_finance_deliveries` 
                  where product_type = 'FFV'
                  and depot_name not in ('Buruburu', 'Key Accounts', 'Kisumu', 'Market Depot', 'Tech-Depot-Kisumu', 'Valley Arcade', 'Westlands')
                  and route_name not in ('Twiga B2C Thome', 'Twiga B2C Ruaka', 'Twiga B2C PH', 'Staff Route', 'Packhouse - Depot', 'Twiga B2C Nairobi West', 'Twiga B2C Donholm')
                  -- and product_type = 'FMCG' -- specify product type
                  and delivery_date between '2019-12-29' and '2020-10-24'
                  -- and Unique_Stalls in ()
                  group by 1,2
                  ),      

 -- First Delivery Week                   
first_delivery_week as (
                        select shop_id, 
                        date_trunc(min(delivery_date), week) as joining_week 
                        from  deliveries
                        group by 1
                        ),
 -- Subsequent Delivery Week                    
next_delivery_week as (
                      select shop_id, 
                      date_trunc(delivery_date, week) as subsequent_delivery_week,
                      sum(revenue) as revenue
                      from deliveries
                      group by 1,2
                      )

-- # Delivery Retention
select first_delivery_week.shop_id, 
       first_delivery_week.joining_week, 
       next_delivery_week.subsequent_delivery_week,
       next_delivery_week.revenue,
       date_diff(next_delivery_week.subsequent_delivery_week, first_delivery_week.joining_week, week)  as week_since_signup
from first_delivery_week
join next_delivery_week on first_delivery_week.shop_id = next_delivery_week.shop_id
left join shop_details s on first_delivery_week.shop_id = s.shop_id
order by 1