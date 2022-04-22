with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_original_items as (
                                      select distinct dn.scheduled_delivery_date,
                                      dn.posting_date,
                                      date_diff(dn.posting_date, dn.scheduled_delivery_date,day) as date_varuiance,
                                      dn.territory,
                                      dn.kyosk_sales_order as sales_order,
                                      dn.name as delivery_note,
                                      dn.kyosk_order_type,
                                      dn.workflow_state,
                                      dn.lr_no,
                                      dn.driver,
                                      dn.driver_name,
                                      dn.customer,
                                      dn.customer_name,
                                      odni.dn_item_id,
                                      odni.name,
                                      odni.item_name,
                                      odni.uom,
                                      odni.amount,
                                      odni.fulfilment_status,
                                      from delivery_note_with_index dn
                                      cross join unnest(original_items) odni
                                      where index = 1
                                      and dn.scheduled_delivery_date = '2022-03-21'
                                      --and dn.name = 'DN-KISI-BQU3'
                                      order by sales_order, delivery_note, item_name, uom
                                      ),
delivery_note_with_items as (
                              select distinct 
                              dn.posting_date as posting_date_of_delivery_date,
                              date_diff(dn.posting_date, dn.scheduled_delivery_date,day) as date_varuiance,
                              dn.posting_time as posting_time_of_delivery_note,
                              dn.territory,
                              dn.kyosk_sales_order as sales_order,
                              dn.name as delivery_note,
                              dn.lr_no,
                              dn.driver,
                              dn.driver_name,
                              dn.workflow_state,
                              dn.customer,
                              dn.customer_name,
                              dni.item_group,
                              dni.name,
                              dni.item_name,
                              dni.item_code,
                              dni.uom,
                              dni.amount
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('DELIVERED', 'PAID')
                              --and dn.name = 'DN-KISI-BQU3'
                              --and dn.scheduled_delivery_date = '2022-03-22'
                              order by sales_order, delivery_note, item_code, uom
                              ),
driver_delivery_visibility_report as (
                                       select distinct dnwoi.driver_name,
                                       dnwoi.driver,
                                       dnwoi.lr_no,
                                       dnwoi.sales_order,
                                       dnwoi.delivery_note,
                                       
                                       dnwoi.workflow_state,
                                       dnwoi.kyosk_order_type,
                                       dnwoi.customer,
                                       dnwoi.customer_name,
                                       dnwoi.territory,
                                       dnwoi.scheduled_delivery_date,
                                       dnwoi.posting_date,
                                       sum(dnwoi.amount) as amount_of_sales_order,
                                       coalesce(sum(dnwi.amount),0) as amount_of_paid_delivery_note,
                                       sum(dnwoi.amount) - coalesce(sum(dnwi.amount),0) as amount_of_sales_order_balance,
                                       from delivery_note_with_original_items dnwoi
                                       left join delivery_note_with_items dnwi on dnwoi.dn_item_id = dnwi.name
                                       group by 1,2,3,4,5,6,7,8,9,10,11,12
                                       
                                       )
select *, row_number()over(partition by sales_order order by delivery_note) as delivery_note_number from driver_delivery_visibility_report 
--where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE
where driver_name like 'John%'
order by sales_order, delivery_note