with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note` 
                            where territory not in ('Kyosk HQ')
                            and workflow_state not in ('SUBMITTED', 'CHANGE_REQUESTED', 'DISPATCHING', 'PROCESSING', 'DELIVERING')
                            ),
regional_mapping as (SELECT * FROM `kyosk-prod.erp_reports.upload_regional_mapping`),
delivery_note_with_original_items as (
                                      SELECT distinct dn.scheduled_delivery_date,
                                      dn.company,
                                      dn.territory,
                                      dn.name as delivery_note,
                                      oi.against_sales_order as sales_order,
                                      dn.sales_partner,
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
                                      oi.amount,
                                      rm.*except(territory, company)
                                      FROM delivery_note_with_index dn
                                      cross join unnest(original_items) oi
                                      left join regional_mapping rm on dn.territory = rm.territory
                                      where index = 1
                                      )
select * from delivery_note_with_original_items 
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE