------------------------ Month on Month Retention Test Query --------------------------------------
with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            where workflow_state in ('PAID') 
                            and company in('KYOSK DIGITAL SERVICES LTD (KE)')
                            ),
previous_month as (
                      select distinct customer
                      from delivery_note_with_index
                      where index = 1
                      and date_trunc(posting_date,month) =  '2022-03-01'
                      ),
current_month as (
                      select distinct customer
                      from delivery_note_with_index
                      where index = 1
                      and date_trunc(posting_date,month) =  '2022-04-01'
                      )
select * from previous_month
where customer in (select * from current_month)