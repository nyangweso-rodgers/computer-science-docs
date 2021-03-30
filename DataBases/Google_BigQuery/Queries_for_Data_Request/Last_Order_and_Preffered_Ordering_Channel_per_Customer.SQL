with ga_orders as (select distinct unique_stalls as shop_id, delivery_date, order_type from dmslive.mediated_orders_ga_clientid_tracked),

last_ordering_channel as (
                        select * from (select *, row_number()over(partition by shop_id order by delivery_date desc) as Index
                        from
                        (select  shop_id, delivery_date, string_agg(distinct order_type, "/" order by order_type) as last_order_type_channel from  ga_orders group by 1,2 order by 1)
                        order by 1,2) 
                        where Index = 1
                        ),
ordering_channel_mode_raw as (
                          select distinct a.shop_id, delivery_date, order_type, last_delivery_date, count(order_type) as order_count
                          from ga_orders a
                          left join (select distinct shop_id, max(delivery_date) as last_delivery_date from ga_orders group by 1) b on b.shop_id = a.shop_id
                          group by 1,2,3,4
                          ),
ordering_channel_mode_count as (
                                select * from
                                (select a.*,  row_number() over (partition BY shop_id order by order_count desc ) AS INDEX from ordering_channel_mode_raw a order by 1,2)
                                where INDEX = 1 order by 1,2
                                ),
mashup as (
            select distinct a.shop_id,a.last_order_type_channel, b.order_type as preffered_order_type  
            from last_ordering_channel a 
            left join ordering_channel_mode_count b on b.shop_id = a.shop_id
            )
select * from mashup