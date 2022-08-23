----------------------- QA - Week on Week Retention -------------
with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note` 
                            where workflow_state in ('PAID', 'DELIVERED')
                            and company = 'KYOSK DIGITAL SERVICES LIMITED (UG)'
                            ),
previous_week as (select distinct customer from delivery_note_with_index where index = 1 and posting_date between '2022-08-07' and '2022-08-13'),
current_week as (select distinct customer from delivery_note_with_index where index = 1 and posting_date between '2022-08-14' and '2022-08-20')

select count(distinct customer) from current_week where customer in (select distinct customer from previous_week)
