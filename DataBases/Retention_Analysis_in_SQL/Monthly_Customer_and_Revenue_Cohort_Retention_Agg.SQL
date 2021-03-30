with 
route_mapping as (select distinct route_id,depot_id, region_id, region_name from dmslive.cache_route_mapping),
shop_details as (
                  select distinct shop_id, region_name from dmslive.cache_shop_details sd
                  left join route_mapping rm on rm.route_id =  sd.route_id
                  ),
deliveries_date as (select a.*,region_name from dmslive.cache_deliveries_v1_v2 a left join shop_details sd on sd.shop_id = a.stall_id),
cohort_joining_month as (
                    select date_trunc(min(date), month) as joining_month, region_name,
                    stall_id as shop_id,
                    sum(amount) as revenue
                    from deliveries_date
                    group by 2,3
                    ),
-- find the size of each cohort by by counting the number of unique stalls that show up for the first time in a month
cohort_size as (
              select region_name,extract(year from joining_month) as joining_year,
              extract(month from joining_month) as joining_month, 
              count(1) as stalls,
              sum(revenue) as revenue
              from cohort_joining_month
              group by 1,2,3 order by 1,2),
              
next_delivery_month as (
                    select date_trunc(date, month) as subsequent_month, 
                    stall_id as shop_id, region_name,sum(amount) as revenue 
                    from deliveries_date
                    group by 1,2,3
                    ),
                    
shop_activities as (
                      select date_diff(b.subsequent_month, a.joining_month, month) as month_number, b.shop_id, b.region_name,sum(b.revenue) as revenue 
                      from next_delivery_month b
                      left join cohort_joining_month a on a.shop_id = b.shop_id and a.region_name = b.region_name
                      group by 1,2,3 order by 1 desc
                      ),
        
retention_table as (
                    select extract(year from j.joining_month) as joining_year,
                    extract(month from j.joining_month) as joining_month,c.region_name,
                    count(1) as num_stalls,
                    c.month_number, sum(c.revenue) as revenue
                    from shop_activities c  
                    left join cohort_joining_month j on c.shop_id = j.shop_id and c.region_name = j.region_name
                    group by 1,2,3,5 order by 1,2,4
                    )

select r.joining_year, 
       r.joining_month, 
       r.region_name,
       r.num_stalls as total_vendors, 
       r.month_number, 
       round(cast(r.num_stalls as float64) /s.stalls,1) as cohort_percentage_retention,
       r.revenue,
       cast(r.revenue as float64) /s.revenue as revenue_percentage_retention
       from retention_table r
       left join cohort_size s on r.joining_year = s.joining_year and r.joining_month = s.joining_month and r.region_name = s.region_name
       where r.joining_year >= 2019
       order by 1,2,4