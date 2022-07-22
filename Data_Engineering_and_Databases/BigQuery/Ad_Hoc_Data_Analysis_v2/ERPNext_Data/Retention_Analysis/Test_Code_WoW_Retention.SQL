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
previous_week as (
                  select distinct dnwi.customer 
                  from delivery_note_with_items dnwi
                  left join customers_last_activity cla on dnwi.customer = cla.customer
                  where date_trunc(posting_date, week) = '2022-06-19' and  cla.territory = 'Athi River'
                  ),
current_week as (
                  select distinct dnwi.customer 
                  from delivery_note_with_items dnwi
                  left join customers_last_activity cla on dnwi.customer = cla.customer
                  where date_trunc(posting_date, week) = '2022-06-26' and  cla.territory = 'Athi River'
                  ),
retention as (
              select * from previous_week
              where customer in (select * from current_week)
              )     
select * from retention             