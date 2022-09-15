with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note` 
                            where workflow_state in ('PAID', 'DELIVERED')
                            ),
------------------------------- Newly Active, old Active and Reactivation ---------------------------------------------------------------
monthly_report as (
                    select *, lag(posting_month)over(partition by customer order by posting_month)  as previous_posting_month
                    from
                    (select distinct customer,company, date_trunc(posting_date, month) as posting_month, from delivery_note_with_index where index = 1)
                    ),
classification_report as (
                            select *, case when months_since_last_served = 0 then 'Newly Active' when months_since_last_served = 1 then 'Old Active' else 'Reactivated' end as customer_active_status
                            from
                            (select *, coalesce(date_diff(posting_month, previous_posting_month, month),0) as months_since_last_served  from monthly_report)
                            )
select *  from classification_report