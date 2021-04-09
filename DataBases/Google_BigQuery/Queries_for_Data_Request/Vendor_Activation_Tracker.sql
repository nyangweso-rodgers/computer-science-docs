with 
vendor_survey as (select *except(Index) from
                  (select *, row_number()over(partition by phone_number order by twiga_customer) as Index
                  from
                  (select distinct phone_number, twiga_customer, depot_name, route_name, customer_name from dmslive.cereals_FFV_vendor_survey_shop_details order by 1)
                  ) where Index = 1
                  ),

shop_details as (select distinct shop_id, phone_number, right(phone_number,12) as strip_phone_number from dmslive.cache_shop_details),

cache_orders as (
                  select *, row_number()over(partition by shop_id order by order_date) as Index 
                  from
                (select distinct unique_stalls as shop_id, strip_phone_number,order_date,sum(amount) as amount,
                sum(case when product_item_segment = 'FRESH' then amount else null end) as ffv_revenue,
                string_agg(distinct order_type, "/" order by order_type) as order_channel,
                string_agg(distinct product_name, "/" order by product_name) as products_ordered
                from dmslive.mediated_orders_ga_clientid_tracked o 
                left join shop_details sd on sd.shop_id = o.Unique_Stalls where order_date >= '2021-04-05' group by 1,2,3 order by 1
                ) order by 1
               ),
first_reactivation_route as (select * from cache_orders where Index = 1),
mashup as (
            select vs.*,order_date as activation_date,
            case when vs.phone_number in (select distinct strip_phone_number from first_reactivation_route) then 'YES' else 'NO' end as activated ,
            products_ordered, order_channel,amount, ffv_revenue
            from vendor_survey vs
            left join first_reactivation_route frr on frr.strip_phone_number = vs.phone_number
            )
select * from mashup