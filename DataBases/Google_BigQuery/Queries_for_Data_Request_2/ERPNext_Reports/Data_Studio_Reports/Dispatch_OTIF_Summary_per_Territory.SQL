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
                    customer,
                    dn.lr_no,
                    driver_name,
                    sum(oi.amount) as amount
                    FROM delivery_note_with_index dn
                    cross join unnest(original_items) oi
                    where index = 1
                    group by 1,2,3,4,5,6,7,8,9,10
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
                  dn.customer,
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
                  ),
otif_summary_per_territory as (
                                select distinct scheduled_delivery_date,
                                territory,
                                count(distinct lr_no) as count_of_delivery_trip,
                                count(distinct sales_order) as count_of_sales_order,
                                count(distinct delivery_note) as count_of_delivery_note,
                                count(distinct customer) as count_of_customers,
                                count(distinct(case when otif_status = 'ON-TIME' then sales_order else null end)) as count_of_on_time_sales_order,
                                count(distinct(case when otif_status = 'LATE' then sales_order else null end)) as count_of_late_sales_order,
                                count(distinct(case when otif_status = 'EARLY' then sales_order else null end)) as count_of_early_sales_order,
                                count(distinct(case when otif_status = 'ON-TIME' then sales_order else null end)) / count(distinct sales_order) as percent_on_time_orders,
                                count(distinct(case when otif_status = 'LATE' then sales_order else null end)) / count(distinct sales_order) as percent_late_sales_order,
                                count(distinct(case when otif_status = 'EARLY' then sales_order else null end)) / count(distinct sales_order) as percent_early_sales_order,
                                sum(amount_delivery_note) as amount_delivery_note,
                                sum(amount_sales_order) as amount_sales_order
                                from otif_raw_data 
                                where workflow_state in ('PAID', 'DELIVERED')
                                group by 1,2
                                )
select * from otif_summary_per_territory
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE 
--where scheduled_delivery_date = '2022-03-01' order by 3 desc