with 
finance_deliveries as (select distinct Unique_Stalls as shop_id, delivery_date, product_type, sum(amount) as amount from dmslive.cache_finance_deliveries where product_type <> 'BUNDLE' group by 1,2,3),
customer_categories as (select distinct shop_id, string_agg(distinct product_type, "/" order by product_type) as customer_category from  finance_deliveries group by 1 order by 1)

select * from customer_categories