with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
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
select distinct scheduled_delivery_date,
        posting_date,  
        territory,
        name as delivery_note, 
        kyosk_sales_order, 
        workflow_state, 
        driver,
        driver_name,
        sum(amount) as amount,
        extract(hour from posting_time) as posting_hour
from delivery_note
--where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE 
where posting_date = '2022-03-01' 

group by 1,2,3,4,5,6,7,8,10
order by kyosk_sales_order, delivery_note