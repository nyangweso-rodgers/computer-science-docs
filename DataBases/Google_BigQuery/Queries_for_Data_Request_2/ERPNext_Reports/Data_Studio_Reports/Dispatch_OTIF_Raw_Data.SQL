WITH
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
sales_order_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_order`
                            ),

delivery_note as (
                    select distinct dn.scheduled_delivery_date,
                    format_time('%R', dn.posting_time) as posting_time,
                    dn.lr_date, --this is Delivery Trip Date
                    dn.territory,
                    dn.name,
                    oi.against_sales_order,
                    workflow_state,
                    dn.lr_no,
                    driver_name,
                    sum(oi.amount) as amount
                    FROM delivery_note_with_index dn
                    cross join unnest(original_items) oi
                    where index = 1
                    group by 1,2,3,4,5,6,7,8,9
                    ),
sales_order as (
                  select distinct so.name,
                  format_time('%R', delivery_window_start_time)  as delivery_window_start_time,
                  format_time('%R', delivery_window_end_time)  as delivery_window_end_time,
                  sum(i.amount) as amount
                  from sales_order_with_index so
                  cross join unnest(items) i
                  where index = 1
                  group by 1,2,3
                  ),
      
otif_raw_data as (
                  select dn.scheduled_delivery_date,
                  dn.posting_time,
                  dn.lr_date,
                  dn.territory,
                  dn.name as delivery_note,
                  dn.against_sales_order as sales_order,
                  dn.workflow_state,
                  dn.lr_no,
                  dn.driver_name,
                  so.delivery_window_start_time,
                  so.delivery_window_end_time,
                  so.amount as amount_sales_order,
                  dn.amount as amount_delivery_note,
                  case 
                      when posting_time between delivery_window_start_time and delivery_window_end_time then 'ON-TIME' 
                      when posting_time > delivery_window_end_time then 'LATE'
                      when posting_time < delivery_window_start_time then 'EARLY'
                      else null 
                  end as otif_status
                  from delivery_note dn
                  left join sales_order so on dn.against_sales_order = so.name
                  )
select ord.* from otif_raw_data ord
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE 
--where scheduled_delivery_date = '2022-02-25' and workflow_state in ('PAID', 'DELIVERED')
order by sales_order, delivery_note desc