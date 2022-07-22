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
                    select distinct dnwi.customer, 
                    territory,
                    date_trunc(min(posting_date), month) as cohort_month
                    from delivery_note_with_items dnwi
                    left join customers_last_activity cla on dnwi.customer = cla.customer
                    group by 1,2
                    )
select distinct customer 
from delivery_note_with_items
where customer in (select  distinct customer from joining_month  where territory = 'Athi River'  and cohort_month = '2022-02-01')
and posting_date between  '2022-06-01' and '2022-06-30'