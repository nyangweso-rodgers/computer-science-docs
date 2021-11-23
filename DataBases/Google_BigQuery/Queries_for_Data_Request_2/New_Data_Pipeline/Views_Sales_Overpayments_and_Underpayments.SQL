-- created by Rodgers Nyangweso
with
overpayments as (
                  SELECT distinct completed_date,
                  completed_date_kenya, 
                  kyosk_id,
                  kyosk_code,
                  kyosk_name, 
                  service_zone_name,
                  sale_code,
                  drs_code,
                  string_agg(distinct mpesa_ref, "/" order by mpesa_ref) as mpesa_ref,
                  max(total_orginal_amount_with_vat) as total_orginal_amount_with_vat,
                  max(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                  sum(mpesa_amount) as mpesa_amount,
                  sum(mpesa_amount) - max(total_delivered_amount_with_vat) as variance_delivery_vs_paid_amount
                  FROM `kyosk-prod.inventory.views_sales` 
                  group by 1,2,3,4,5,6,7,8
                  )
select *, case when variance_delivery_vs_paid_amount > 0 then 'OVERPAYMENT' else 'UNDERPAYMENT' end as payment_status
from overpayments 
where variance_delivery_vs_paid_amount <> 0