with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
  							            where territory not in ('Kyosk HQ')
                            and workflow_state in ('PAID', 'DELIVERED')
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
                              from delivery_note_with_index 
                              where index = 1
                              )
                              where last_territory_index = 1
                              ),
weekly_mashup as (
                  select distinct dnwi.customer, 
                  cla.territory,
                  cla.company,
                  date_trunc(posting_date, week) as  week
                  from delivery_note_with_items dnwi
                  left join customers_last_activity cla on dnwi.customer = cla.customer
                  ),
weekly_retention as (
                    select last_week.company,
                    last_week.territory,
                    date_add(last_week.week, interval 1 week) as week, 
                    count(distinct last_week.customer) as active_dukas,
                    count(distinct this_week.customer) as retained_dukas,
                    cast(SAFE_DIVIDE(count(distinct this_week.customer) , coalesce(count(distinct last_week.customer),null))as float64) as week_on_week_retention
                    from weekly_mashup as last_week
                    left join weekly_mashup as this_week on last_week.customer = this_week.customer and this_week.week = date_add(last_week.week, interval 1 week)
                    group by 1,2,3 order by 1,2,3
                    )
select * from weekly_retention --where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE territory = 'Athi River'