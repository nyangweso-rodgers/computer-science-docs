with deliveries as (
                  select distinct(Unique_Stalls) as shop_id, 
                  delivery_date,
                  sum(Amount) as revenue
                  from `dmslive.cache_finance_deliveries` 
                  where delivery_date between '2020-01-01' and '2021-04-30'
                  group by 1,2
                  ),      

 -- First Delivery Month                    
first_delivery_month as (
                        select shop_id, 
                        date_trunc(min(delivery_date), month) as joining_month 
                        from  deliveries
                        group by 1
                        ),
 -- Subsequent Delivery Month                     
next_delivery_month as (
                      select shop_id, 
                      date_trunc(delivery_date, month) as subsequent_delivery_month,
                      sum(revenue) as revenue
                      from deliveries
                      group by 1,2
                      )

-- # Delivery Retention
select first_delivery_month.shop_id, 
       first_delivery_month.joining_month, 
       next_delivery_month.subsequent_delivery_month,
       next_delivery_month.revenue,
       date_diff(next_delivery_month.subsequent_delivery_month, first_delivery_month.joining_month, month)  as months_since_signup
from first_delivery_month
join next_delivery_month on first_delivery_month.shop_id = next_delivery_month.shop_id
order by 1