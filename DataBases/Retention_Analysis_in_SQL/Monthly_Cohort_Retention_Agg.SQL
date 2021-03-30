with joining_month as (
                    select date_trunc(min(date), month) as cohort_month, 
                    stall_id as shop_id 
                    from dmslive.cache_deliveries_v1_v2
                    where product_type = 'FFV'
                    --and date between '2018-01-01' and  '2020-08-31'
                    group by 2
                    ),
-- find the size of each cohort by by counting the number of unique stalls that show up for the first time in a month
cohort_size as (
              select extract(year from cohort_month) as cohort_year,
              extract(month from cohort_month) as cohort_month, 
              count(1) as stalls 
              from joining_month
              group by 1,2 order by 1,2),
              
next_delivery_month as (
                    select date_trunc(date, month) as subsequent_month, 
                    stall_id as shop_id 
                    from dmslive.cache_deliveries_v1_v2 
                    where product_type = 'FFV'
                    --and date between '2018-01-01' and  '2020-08-31'
                    ),
                    
shop_activities as (select date_diff(b.subsequent_month, a.cohort_month, month) as month_number, b.shop_id 
               from next_delivery_month b
               left join joining_month a on a.shop_id = b.shop_id
               group by 1,2 order by 1 desc),
        
retention_table as (select   extract(year from j.cohort_month) as cohort_year,
                              extract(month from j.cohort_month) as cohort_month,
                              count(1) as num_stalls,
                              c.month_number 
                              from shop_activities c  
                          left join joining_month j on c.shop_id = j.shop_id
                          group by 1,2,4 order by 1,2,4)

select r.cohort_year, 
       r.cohort_month, 
       r.num_stalls as total_vendors, 
       r.month_number, 
       cast(r.num_stalls as float64) /s.stalls as percentage 
       from retention_table r
       left join cohort_size s on r.cohort_year = s.cohort_year and r.cohort_month = s.cohort_month
order by 1,2,4