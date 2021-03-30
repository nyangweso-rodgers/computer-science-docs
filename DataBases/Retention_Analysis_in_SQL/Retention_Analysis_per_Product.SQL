with deliveries as (select  distinct Unique_Stalls as shop_id,product_name,date_trunc(delivery_date, week) as week
from dmslive.cache_finance_deliveries
where delivery_date >= '2020-07-01'
group by 1,2,3
),
base as (
        select date_add(week, interval 1 week) as last_week,product_name,count(distinct shop_id) as last_weeks_shop 
        from deliveries d group by 1,2
         ),
retained as (
          select
            this_week.week as this_week,
            this_week.product_name,
            count(distinct this_week.shop_id) as retained_shops
          from deliveries as last_week
          join deliveries as this_week on
                this_week.shop_id = last_week.shop_id
            and this_week.product_name = last_week.product_name
            and this_week.week = date_add(last_week.week, interval 1 week)
          group by 1,2),

retention_rate as (select r.this_week,r.product_name,last_weeks_shop,retained_shops,SAFE_DIVIDE(retained_shops,last_weeks_shop)as retention from 
              base b 
              left join retained r on r.this_week = b.last_week and r.product_name = b.product_name  )
select * from retention_rate 