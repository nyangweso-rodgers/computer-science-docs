with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_original_items as (
                                      select distinct dn.posting_date,
                                      dn.scheduled_delivery_date,
                                      date_diff(dn.posting_date, dn.scheduled_delivery_date,day) as date_variance,
                                      dn.territory,
                                      dn.kyosk_sales_order as sales_order,
                                      dn.name as delivery_note,
                                      dn.workflow_state,
                                      odni.fulfilment_status,
                                      odni.kyosk_reason,
                                      dn.lr_no,
                                      dn.lr_date,
                                      dn.driver,
                                      dn.driver_name,
                                      dn.sales_partner,
                                      dn.customer,
                                      dn.customer_name,
                                      odni.item_group,
                                      odni.dn_item_id,
                                      odni.name,
                                      odni.item_name,
                                      odni.uom,
                                      odni.qty,
                                      odni.rate,
                                      odni.net_rate,
                                      odni.price_list_rate,
                                      odni.discount_amount,
                                      odni.amount,
                                      odni.net_amount
                                      from delivery_note_with_index dn
                                      cross join unnest(original_items) odni
                                      where index = 1
                                      order by sales_order, delivery_note, item_name, uom
                                      )
select * from delivery_note_with_original_items  where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE