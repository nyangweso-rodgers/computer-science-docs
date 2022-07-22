with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            where territory not in ('Kyosk HQ')
                            ),
regional_mapping as (SELECT * FROM `kyosk-prod.erp_reports.upload_regional_mapping`),
delivery_note_with_original_items as (
                                      SELECT distinct dn.scheduled_delivery_date,
                                      dn.company,
                                      dn.territory,
                                      dn.customer,
                                      customer_name,
                                      dn.name as delivery_note,
                                      oi.against_sales_order as sales_order,
                                      dn.sales_partner,
                                      dn.workflow_state,
                                      oi.fulfilment_status,
                                      dn.lr_no,
                                      dn.driver,
                                      dn.driver_name,
                                      oi.name,
                                      oi.item_code,
                                      oi.item_name,
                                      oi.uom,
                                      oi.item_group,
                                      oi.qty,
                                      oi.rate,
                                      oi.discount_amount,
                                      oi.amount,
                                      rm.*except(id, territory, company)
                                      FROM delivery_note_with_index dn
                                      cross join unnest(original_items) oi
                                      left join regional_mapping rm on dn.territory = rm.territory
                                      where index = 1
                                      --and company = 'KYOSK DIGITAL SOLUTIONS NIGERIA LIMITED'
                                      )
select * from delivery_note_with_original_items
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE