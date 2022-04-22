with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice`
                            ),
sales_invoice_with_items as (
                              select distinct si.posting_date,
                              si.name as sales_invoice,
                              i.sales_order,
                              i.delivery_note,
                              i.name,
                              i.dn_detail,
                              i.item_code,
                              i.item_name,
                              i.qty,
                              i.amount
                              FROM sales_invoice_with_index si
                              cross join unnest(items) i
                              where index = 1
                              ),
delivery_note_with_original_items as (
                                      SELECT distinct dn.scheduled_delivery_date,
                                      dn.posting_date as posting_date_of_delivery_note,
                                      dn.posting_time as posting_time_of_delivery_note,
                                      dn.lr_date,
                                      dn.territory,
                                      dn.name as delivery_note,
                                      dn.kyosk_sales_order as sales_order,
                                      dn.lr_no,
                                      dn.driver,
                                      dn.driver_name,
                                      dn.workflow_state,
                                      oi.fulfilment_status,
                                      dn.status,
                                      case 
                                          when workflow_state = 'CANCELLED' and fulfilment_status = 'CANCELLED' then 'CANCELLED'
                                          
                                          when workflow_state = 'RESCHEDULED' and fulfilment_status = 'CANCELLED' then 'CANCELLED'
                                          when workflow_state = 'RESCHEDULED' and fulfilment_status = 'RESCHEDULED' then 'RESCHEDULED'

                                          when workflow_state = 'DISPATCHED' and fulfilment_status = 'FULFILLED' then 'DISPATCHED'
                                          when workflow_state = 'DISPATCHED' and fulfilment_status = 'CANCELLED' then 'CANCELLED'

                                          
                                          when workflow_state = 'DELIVERED' and fulfilment_status = 'CANCELLED' then 'CANCELLED'
                                          when workflow_state = 'DELIVERED' and fulfilment_status = 'FULFILLED' then 'DELIVERED'

                                          when workflow_state = 'PAID' and fulfilment_status = 'CANCELLED' then 'CANCELLED'
                                          when workflow_state = 'PAID' and fulfilment_status = 'RESCHEDULED' then 'RESCHEDULED'
                                          when workflow_state = 'PAID' and fulfilment_status = 'FULFILLED' then 'PAID'
                                      else null end as datastudio_status,
                                      oi.kyosk_reason,    
                                      dn.customer,
                                      dn.customer_name,
                                      oi.dn_item_id,
                                      oi.item_group,
                                      oi.name,
                                      oi.item_code,
                                      oi.item_name,
                                      oi.uom,
                                      oi.qty,
                                      oi.price_list_rate,
                                      oi.discount_amount,
                                      oi.rate,
                                      oi.amount
                                      FROM delivery_note_with_index dn
                                      cross join unnest(original_items) oi
                                      where index = 1
                                      --and scheduled_delivery_date = '2022-04-02'
                                      and workflow_state not in ('SUBMITTED', 'CHANGE_REQUESTED', 'DISPATCHING', 'PROCESSING', 'DELIVERING')
                                      ),
delivery_note_and_sales_invoice as (
                                    select dn.*,
                                    si.sales_invoice
                                    from delivery_note_with_original_items dn
                                    left join sales_invoice_with_items si on dn.dn_item_id = si.dn_detail
                                    order by scheduled_delivery_date,sales_order, delivery_note, item_name,uom
                                    )
select * from delivery_note_and_sales_invoice 
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE