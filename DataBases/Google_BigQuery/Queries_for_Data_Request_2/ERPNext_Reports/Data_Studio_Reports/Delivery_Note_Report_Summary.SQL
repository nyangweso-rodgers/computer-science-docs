with
delivery_note as (
                  SELECT distinct dn.posting_date,
                  scheduled_delivery_date,
                  dn.posting_time,
                  dn.lr_date,
                  dn.customer,
                  customer_name,
                  dn.territory,
                  dn.name,
                  dn.kyosk_sales_order,
                  oi.against_sales_order,
                  dn.workflow_state,
                  oi.fulfilment_status,
                  dn.kyosk_order_type,
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
select distinct name as delivery_note, 
        posting_date,  
        scheduled_delivery_date, 
        kyosk_sales_order, 
        workflow_state, 
        kyosk_order_type,
        sum(amount) as amount
from delivery_note
--where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 
where posting_date = '2022-02-22' 

group by 1,2,3,4,5,6 order by 7 desc