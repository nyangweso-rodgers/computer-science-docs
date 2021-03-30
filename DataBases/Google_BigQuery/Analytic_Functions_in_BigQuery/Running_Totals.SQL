with reg_list as (
                  select distinct shop_id, date(shop_date_created) as registration_date, depot_name 
                  from `dmslive.cache_shop_details` 
                  where depot_name in ('Kisumu', 'Eldoret', 'Nakuru') and active = true
                  order by 3,2,1
                  ),
reg_list_count as (
                    select distinct depot_name, registration_date, count(distinct shop_id) as shops_count 
                    from reg_list 
                    group by 1,2 order by 1,2
                    ),
universe as (
              select depot_name,registration_date,shops_count, 
              sum(shops_count) over (partition by depot_name order by registration_date) as actual_universe
              from reg_list_count )
select * from universe