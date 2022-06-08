with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.scheduled_delivery_date,
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
                              dni.qty,
                              dni.rate,
                              dni.net_rate,
                              dni.price_list_rate,
                              dni.discount_amount,
                              dni.amount,
                              dni.net_amount
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('DELIVERED', 'PAID')
                              --and dn.scheduled_delivery_date = '2022-03-21'
                              order by sales_order, delivery_note, item_code, uom
                              )
select * from delivery_note_with_items where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE