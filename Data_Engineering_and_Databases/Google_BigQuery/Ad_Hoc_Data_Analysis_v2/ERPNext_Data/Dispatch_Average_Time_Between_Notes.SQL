with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              time(dn.posting_time) as posting_time_of_delivery_note,
                              dn.territory,
                              dn.name as delivery_note,
                              dn.lr_no,
                              dn.driver,
                              dn.driver_name,
                              sum(dni.amount) as revenue,
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID')
                              group by 1,2,3,4,5,6,7
                              ),
average_time_between_notes as (
                                select *,
                                row_number()over(partition by posting_date,lr_no order by posting_date,posting_time_of_delivery_note) as delivery_note_index,
                                lag(posting_time_of_delivery_note) over(partition by posting_date,lr_no order by posting_date,posting_time_of_delivery_note) as previous_time,
                                coalesce(TIME_DIFF(posting_time_of_delivery_note, 
                                          lag(posting_time_of_delivery_note) over(partition by posting_date,lr_no order by posting_date,posting_time_of_delivery_note), minute),0) as time_variance_in_minutes
                                from delivery_note_with_items 
                                where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
                                --and driver_name = 'Joshua  Mutiso'
                                )
select *, round(avg(time_variance_in_minutes)over(partition by lr_no order by posting_time_of_delivery_note),0) as running_average from average_time_between_notes
order by posting_date, posting_time_of_delivery_note