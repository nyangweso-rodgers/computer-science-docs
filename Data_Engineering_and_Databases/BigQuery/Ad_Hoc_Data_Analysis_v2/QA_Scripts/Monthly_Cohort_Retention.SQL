------------------------ Month on Month Retention Test Query --------------------------------------
with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            where workflow_state in ('PAID', 'DELIVERED') 
                            and company = 'KYOSK DIGITAL SERVICES LIMITED (UG)'
                            ),
monthly_acqusitions as (
                          select distinct customer, min(posting_date) as first_posting_date
                          from delivery_note_with_index
                          where index = 1
                          group by 1
                          order by 1
                          ),
previous_month as (select distinct customer from delivery_note_with_index where index = 1 and date_trunc(posting_date,month) =  '2022-06-01'),
current_month as (select distinct customer from delivery_note_with_index where index = 1 and date_trunc(posting_date,month) =  '2022-08-01')

--select count(distinct customer) from monthly_acqusitions where date_trunc(first_posting_date,month) = '2022-08-01'
select count(distinct customer) from current_month where customer in (select distinct customer from monthly_acqusitions where date_trunc(first_posting_date,month) = '2022-07-01')