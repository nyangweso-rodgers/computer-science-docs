with deliveries as (
                      select distinct(Unique_Stalls) as shop_id, 
                      date_trunc(delivery_date, week) as week
                      from dmslive.cache_finance_deliveries
                      where depot_name = 'Kisumu' -- for Kisumu only
                      )

select 
      date_add(last_week.week, interval 1 week) as week, 
      count(distinct last_week.shop_id) as active_shops,
      count(distinct this_week.shop_id) as retained_shops,
      cast(SAFE_DIVIDE(count(distinct this_week.shop_id) , 
      coalesce(count(distinct last_week.shop_id),null))as float64) as retention
      from deliveries as last_week
      left join deliveries as this_week on last_week.shop_id = this_week.shop_id 
                                        and this_week.week = date_add(last_week.week, interval 1 week)
      group by 1
      order by 1