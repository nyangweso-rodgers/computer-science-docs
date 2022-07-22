with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            where territory not in ('Kyosk HQ')
                            and workflow_state in ('PAID', 'DELIVERD')
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              dn.customer,
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              ),
customers_last_activity as (
                              select  distinct customer, territory, company
                              from
                              (
                              select distinct customer, territory, company,posting_date,
                              row_number()over(partition by customer order by posting_date desc) as last_territory_index
                              from delivery_note_with_index where index = 1
                              )
                              where last_territory_index = 1
                              ),
joining_month as (
                  select date_trunc(min(posting_date), month) as cohort_month,
                  customer
                  from delivery_note_with_items
                  group by 2
                  ),
-- find the size of each cohort by by counting the number of unique stalls that show up for the first time in a month
cohort_size as (
                select extract(year from cohort_month) as cohort_year,
                extract(month from cohort_month) as cohort_month, 
                count(1) as customers,
                company,
                territory
                from joining_month jm 
                left join customers_last_activity cla on jm.customer = cla.customer
                group by 1,2,4,5
                ),
next_delivery_month as (select date_trunc(posting_date, month) as subsequent_month, customer from delivery_note_with_items),
shop_activities as (
                     select date_diff(b.subsequent_month, a.cohort_month, month) as month_number, b.customer,
                     cla.territory, cla.company
                     from next_delivery_month b
                     left join joining_month a on a.customer = b.customer
                     left join customers_last_activity cla on b.customer = cla.customer
                     group by 1,2,3,4 order by 1 desc
                     ),
retention_table as (
                      select extract(year from j.cohort_month) as cohort_year,
                             extract(month from j.cohort_month) as cohort_month,
                             count(1) as num_stalls,
                             c.month_number,
                             c.company,
                             c.territory 
                             from shop_activities c  
                          left join joining_month j on c.customer = j.customer
                          group by 1,2,4,5,6 order by 1,2,4
                          )
               
select r.cohort_year, 
       r.cohort_month, 
       r.company,
       r.territory,
       r.num_stalls as total_vendors, 
       cast(r.month_number as int64) as month_number, 
       cast(r.num_stalls as float64) /s.customers as percentage 
       from retention_table r
       left join cohort_size s on r.cohort_year = s.cohort_year and r.cohort_month = s.cohort_month and r.territory = s.territory and r.company = s.company
       --where r.territory = 'Athi River'
order by 1,2,3,4,6