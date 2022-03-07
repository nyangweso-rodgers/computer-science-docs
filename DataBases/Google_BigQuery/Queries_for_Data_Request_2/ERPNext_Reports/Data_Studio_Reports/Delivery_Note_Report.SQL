with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note as (
                  SELECT 
                  distinct dn.scheduled_delivery_date,
  				  dn.posting_date,
                  dn.posting_time,
                  dn.lr_date,
                  dn.customer,
                  customer_name,
                  dn.territory,
                  dn.name,
                  oi.against_sales_order,
                  dn.workflow_state,
                  oi.fulfilment_status,
  				  dn.lr_no,
                  dn.driver,
                  dn.driver_name,
                  oi.item_code,
                  oi.item_name,
                  oi.uom,
                  oi.item_group,
                  oi.qty,
                  oi.rate,
                  oi.discount_amount,
                  oi.amount
                  FROM delivery_note_with_index dn
                  cross join unnest(original_items) oi
                  where index = 1
                  )
select * from delivery_note
where FORMAT_DATE('%Y%m%d', scheduled_delivery_date) between @DS_START_DATE and @DS_END_DATE