with 
finance_deliveries as (select * from dmslive.cache_finance_deliveries where product_type in ('FMCG', 'FFV') /*and depot_name = 'Kisumu'*/),
vendor_product_segment as (select distinct unique_stalls as shop_id,string_agg(distinct product_type, "/" order by product_type) as product_type  from finance_deliveries group by 1),


deliveries as (
                select distinct delivery_date, unique_stalls as shop_id, vps.product_type, region_name, sum(amount) as amount 
                from finance_deliveries  fd
                left join vendor_product_segment vps on vps.shop_id = fd.Unique_Stalls
                group by 1,2,3,4),
deliveries_with_index as (
                          select *, row_number()over(partition by shop_id,region_name, product_type order by delivery_month) as Index 
                          from
                          (select distinct shop_id, region_name,product_type, date_trunc(delivery_date,month) as delivery_month,sum(amount) as amount from deliveries group by 1,2,3,4 order by 1,2,3)
                          order by 1,2,3
                          ),
cohort_revenue as (select * from deliveries_with_index where Index = 1),
cohort_items as (select date_trunc(min(d.delivery_date),month) as cohort_month, d.shop_id, d.region_name, d.product_type from deliveries d  group by 2,3,4 order by 1,2),

cohort_mashup as (
                    select ci.*, amount from cohort_items ci  
                    left join cohort_revenue cr on cr.shop_id = ci.shop_id and cr.region_name = ci.region_name and cr.delivery_month = ci.cohort_month and cr.product_type = ci.product_type
                    ),
                     
cohort_size_customers as (select distinct region_name,product_type, cohort_month, count(1) as num_users from cohort_mashup group by 1,2,3),
cohort_size_revenue as (select distinct region_name,product_type, cohort_month, sum(amount) as amount from cohort_mashup group by 1,2,3),
cohort_size as (select c.*,r.amount from cohort_size_customers c left join cohort_size_revenue r on r.region_name = c.region_name and r.cohort_month = c.cohort_month and r.product_type = c.product_type),

user_activities as (select distinct d.shop_id ,d.region_name,d.product_type, date_diff(date_trunc(delivery_date,month), cohort_month, month) as month_number, sum(d.amount) as revenue 
                    from deliveries d
                    left join cohort_mashup ci on ci.shop_id = d.shop_id and d.region_name = ci.region_name and d.product_type = ci.product_type group by 1,2,3,4 order by 1,2,3
                    ),
retention_table as (
                    select A.region_name, A.product_type,C.cohort_month, A.month_number, count(1) as num_users, sum(A.revenue) as revenue 
                    from user_activities A 
                    left join cohort_mashup C ON A.shop_id = C.shop_id and A.region_name = C.region_name and A.product_type = C.product_type group by 1, 2,3,4 order by 1,2,3,4
                    
                    ),

-- our final value: (cohort_month, size, month_number, percentage)
mashup as (select B.region_name,B.product_type,

  B.cohort_month,
  S.num_users as total_customers,
  B.num_users as retained_customers,
  B.month_number,
  cast(B.num_users as float64) / S.num_users as customer_retention_percentage,
  
  S.amount as total_revenue,
  B.revenue as retained_revenue,
  cast(B.revenue as float64)/S.amount as revenue_retention_percentage,
  
from retention_table B
left join cohort_size S ON B.cohort_month = S.cohort_month and B.region_name = S.region_name and B.product_type = S.product_type
where B.cohort_month IS NOT NULL
group by 1,2,3,4,5,6,8,9,10 order by 1,2,3, 6)

select * from mashup 