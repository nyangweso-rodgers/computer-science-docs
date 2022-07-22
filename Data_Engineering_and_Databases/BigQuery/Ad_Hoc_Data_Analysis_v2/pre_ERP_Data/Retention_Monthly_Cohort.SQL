with
ops_item_report as (
              select distinct kyosk_code,
              date(completed_date_kenya) as date
              from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_original_delivery_date`
              where status = 'Completed'
              ),
joining_month as (
                  select date_trunc(min(date), month) as cohort_month,
                  kyosk_code
                  from ops_item_report
                  
                  group by 2
                  ),
-- find the size of each cohort by by counting the number of unique stalls that show up for the first time in a month
cohort_size as (
              select extract(year from cohort_month) as cohort_year,
              extract(month from cohort_month) as cohort_month, 
              count(1) as dukas 
              from joining_month
              group by 1,2 
              ),
next_delivery_month as (
                    select date_trunc(date, month) as subsequent_month, 
                    kyosk_code
                    from ops_item_report
                    ),
shop_activities as (
                   select date_diff(b.subsequent_month, a.cohort_month, month) as month_number, b.kyosk_code 
                   from next_delivery_month b
                   left join joining_month a on a.kyosk_code = b.kyosk_code
                   group by 1,2 order by 1 desc
                   ),
retention_table as (
                      select extract(year from j.cohort_month) as cohort_year,
                             extract(month from j.cohort_month) as cohort_month,
                             count(1) as num_stalls,
                             c.month_number 
                             from shop_activities c  
                          left join joining_month j on c.kyosk_code = j.kyosk_code
                          group by 1,2,4 order by 1,2,4
                          )
               
select r.cohort_year, 
       r.cohort_month, 
       r.num_stalls as total_vendors, 
       cast(r.month_number as int64) as month_number, 
       cast(r.num_stalls as float64) /s.dukas as percentage 
       from retention_table r
       left join cohort_size s on r.cohort_year = s.cohort_year and r.cohort_month = s.cohort_month
       --where r.cohort_year is not null
order by 1,2,4