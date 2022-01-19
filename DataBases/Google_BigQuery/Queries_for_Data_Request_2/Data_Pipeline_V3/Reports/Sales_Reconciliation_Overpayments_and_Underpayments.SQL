with
sale_reconcilaition_report as (
                                SELECT distinct sale_code,
                                drs_code,
                                completed_date_kenya,
                                kyosk_code,
                                kyosk_name,
                                phone_numbers,
                                service_zone_name,
                                json_extract_scalar(p, '$.mpesaRef') as mpesa_ref, 
                                cast(json_extract_scalar(p, '$.amount') as float64) as mpesa_amount, 
                                sum(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                                sum(total_orginal_amount_with_vat) as total_orginal_amount_with_vat
                                FROM `kyosk-prod.inventory_v2.fed_scheduled_sales_reconciliations_report_v2` 
                                left join unnest(json_extract_array(payments)) p
                                group by 1,2,3,4,5,6,7,8,9
                                ),
report as (
            select distinct sale_code,
            completed_date_kenya,
                      service_zone_name,
                      kyosk_code,
                      kyosk_name,
                      drs_code,
                      sum(mpesa_amount) - max(total_delivered_amount_with_vat) as variance_delivery_vs_paid_amount,
                      sum(mpesa_amount) as mpesa_amount,
                      max(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                      max(total_orginal_amount_with_vat) as total_orginal_amount_with_vat,
                      string_agg(distinct mpesa_ref,"/" order by mpesa_ref) as mpesa_ref,
                      from sale_reconcilaition_report
                      group by 1,2,3,4,5,6
            )
select *, case when variance_delivery_vs_paid_amount > 0 then 'OVERPAYMENT' else 'UNDERPAYMENT' end as payment_status 
from report where variance_delivery_vs_paid_amount <> 0
and FORMAT_DATE('%Y%m%d', completed_date_kenya) between @DS_START_DATE and @DS_END_DATE 