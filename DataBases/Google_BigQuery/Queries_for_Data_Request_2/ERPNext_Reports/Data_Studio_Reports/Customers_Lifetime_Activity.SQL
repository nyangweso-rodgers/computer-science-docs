with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_original_items as (
                                      SELECT distinct dn.scheduled_delivery_date,
                                      dn.posting_date,
                                      dn.territory,
                                      dn.name as delivery_note,
                                      dn.kyosk_sales_order as sales_order,
                                      dn.workflow_state,
                                      oi.fulfilment_status,
                                      oi.kyosk_reason,    
                                      dn.customer,
                                      dn.customer_name,
                                      dn.contact_mobile,
                                      oi.item_group,
                                      oi.name,
                                      oi.item_code,
                                      oi.item_name,
                                      oi.uom,
                                      oi.amount
                                      FROM delivery_note_with_index dn
                                      cross join unnest(original_items) oi
                                      where index = 1
                                      --and scheduled_delivery_date = '2022-03-28'
                                      and workflow_state in ('PAID')
                                      and fulfilment_status not in ('CANCELLED', 'RESCHEDULED')
                                      order by scheduled_delivery_date,sales_order, delivery_note, item_name,uom
                                      ),
customer_list as (
                  select distinct customer,
                  customer_name,
                  contact_mobile,
                  territory,
                  min(posting_date) as first_delivery_date,
                  max(posting_date) as last_delivery_date,
                  date_diff(current_date(), max(posting_date), day) as days_since_last_delivery,
                  sum(amount) as lifetime_delivery_amount,
                  count(distinct sales_order) as count_of_sales_orders
                  from delivery_note_with_original_items
                  group by 1,2,3,4
                  )
select * from customer_list order by days_since_last_delivery desc