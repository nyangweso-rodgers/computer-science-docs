WITH
delivery_note as (
                    select distinct dn.posting_date,
                    format_time('%R', dn.posting_time) as posting_time,
                    dn.lr_date, --this is Delivery Trip Date
                    dn.territory,
                    dn.name,
                    i.against_sales_order,
                    workflow_state,
                    dn.lr_no,
                    driver_name,
                    customer_name,
                    i.amount
                    FROM `kyosk-prod.erp_reports.delivery_note` dn
                    cross join unnest(items) i
                    cross join unnest(original_items) oi
                    ),
sales_order as (
                  select distinct so.name,
                  delivery_window_id,
                  format_time('%R', delivery_window_start_time)  as delivery_window_start_time,
                  format_time('%R', delivery_window_end_time)  as delivery_window_end_time,
                  sum(i.amount) as sales_order_amount
                  from `kyosk-prod.erp_reports.sales_order` so
                  cross join unnest(items) i
                  group by 1,2,3,4
                  ),
      
otif_raw_data as (
                  select dn.posting_date,
                  dn.posting_time,
                  dn.lr_date,
                  dn.territory,
                  dn.name,
                  dn.against_sales_order,
                  dn.workflow_state,
                  dn.lr_no,
                  dn.driver_name,
                  dn.customer_name,
                  so.delivery_window_id,
                  so.delivery_window_start_time,
                  so.delivery_window_end_time,
                  so.sales_order_amount,
                  sum(dn.amount) as delivery_note_amount,
                  case 
                      when posting_time between delivery_window_start_time and delivery_window_end_time then 'ON-TIME' 
                      when posting_time > delivery_window_end_time then 'LATE'
                      when posting_time < delivery_window_start_time then 'EARLY'
                      else null 
                  end as otif_status
                  from delivery_note dn
                  left join sales_order so on dn.against_sales_order = so.name
                  group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,16
                  )
select ord.* from otif_raw_data ord
--where posting_date = '2022-02-11' and (workflow_state = 'PAID' or workflow_state = 'DELIVERED') and against_sales_order = 'SAL-ORD-EASWNZF'
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 
order by 1 desc