with
delivery_note as (
                  SELECT distinct dn.posting_date,
                  dn.posting_time,
                  dn.lr_date,
                  dn.customer,
                  customer_name,
                  dn.territory,
                  dn.name,
                  oi.against_sales_order,
                  dn.workflow_state,
                  oi.fulfilment_status,
                  dn.status,
                  dn.driver,
                  dn.driver_name,
                  dn.vehicle_no,
                  oi.item_code,
                  oi.item_name,
                  oi.uom,
                  oi.item_group,
                  oi.qty,
                  oi.returned_qty,
                  oi.rate,
                  oi.discount_amount,
                  oi.amount
                  FROM `kyosk-prod.erp_reports.delivery_note` dn
                  cross join unnest(original_items) oi
                  )
select *
from delivery_note
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 