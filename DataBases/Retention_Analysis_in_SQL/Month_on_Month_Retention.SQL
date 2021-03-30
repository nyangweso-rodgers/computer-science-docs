with deliveries as (
                      select distinct(Unique_Stalls) as shop_id, 
                      date_trunc(delivery_date, month) as month
                      from dmslive.cache_finance_deliveries
                      where depot_name = 'Kisumu' -- for Kisumu
                      )

select 
      date_add(last_month.month, interval 1 month) as month, 
      count(distinct last_month.shop_id) as active_shops,
      count(distinct this_month.shop_id) as retained_shops,
      cast(SAFE_DIVIDE(count(distinct this_month.shop_id) , 
      coalesce(count(distinct last_month.shop_id),null))as float64) as retention
      from deliveries as last_month
      left join deliveries as this_month on last_month.shop_id = this_month.shop_id 
                                        and this_month.month = date_add(last_month.month, interval 1 month)
      group by 1
      order by 1