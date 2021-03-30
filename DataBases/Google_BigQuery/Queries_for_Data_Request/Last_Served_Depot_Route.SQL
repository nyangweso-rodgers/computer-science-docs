with 
finance_deliveries as (select * from dmslive.cache_finance_deliveries),
last_served_depot_route as (
                             select *, row_number()over(partition by shop_id order by delivery_date desc) as Last_Served_Depot_Index
                             from
                             (select distinct unique_stalls as shop_id, delivery_date, route_name, depot_name from finance_deliveries order by 1,2,3,4)
                             order by 1,2,3
                             )
select distinct shop_id, route_name, depot_name from last_served_depot_route where Last_Served_Depot_Index = 1 order by 1,2,3