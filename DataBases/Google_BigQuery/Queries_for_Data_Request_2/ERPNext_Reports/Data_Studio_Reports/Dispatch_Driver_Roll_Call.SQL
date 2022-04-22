with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              dn.lr_date,
                              dn.territory,
                              dn.kyosk_sales_order as sales_order,
                              dn.name as delivery_note,
                              dn.kyosk_order_type,
                              dn.lr_no,
                              dn.driver,
                              dn.driver_name,
                              dn.vehicle_no,
                              dn.customer,
                              dn.customer_name,
                              dni.item_group,
                              dni.name,
                              dni.item_name,
                              dni.item_code,
                              dni.uom,
                              dni.qty,
                              dni.rate,
                              dni.price_list_rate,
                              dni.discount_amount,
                              dni.amount,
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID')
                              --and posting_date = '2022-04-18'
                              --and driver is null
                              order by sales_order, delivery_note, item_code, uom
                              ),
monthly_driver_roll_call as (
                              select distinct --date_trunc(posting_date, month) as posting_month,
                              driver,
                              string_agg(distinct driver_name, "/" order by driver_name) as driver_name,
                              string_agg(distinct territory, "/" order by territory) as territory,
                              string_agg(distinct vehicle_no, "/" order by vehicle_no) as vehicle_no,
                              count(distinct lr_no) as count_of_delivery_trips,
                              count(distinct posting_date) as count_of_posting_dates,
                              count(distinct lr_date) as count_of_delivery_trip_dates,
                              count(distinct customer) as count_of_customers,
                              count(distinct delivery_note) as count_of_delivery_notes,
                              sum(amount) as revenue
                              from delivery_note_with_items
                              where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
                              group by 1
                              order by 3 desc
                              )
select * from monthly_driver_roll_call 