with
sales_reconiliation_report as (
                                select *, row_number()over(partition by sale_code order by mpesa_ref) as mpesa_ref_index
                                from
                                (
                                SELECT a.*, 
                                json_extract_scalar(p, '$.mpesaRef') as mpesa_ref, 
                                cast(json_extract_scalar(p, '$.amount') as float64) as mpesa_amount, 
                                FROM `kyosk-prod.inventory_v2.fed_scheduled_sales_reconciliations_report_v2` a
                                left join unnest(json_extract_array(payments)) p
                                )
                                ),
 report as (
            select distinct sale_code,
            completed_date_kenya,
                      service_zone_name,
                      kyosk_code,
                      kyosk_name,
                      drs_code,
                      invoice_status,
                      payments,
                      sum(mpesa_amount) - max(total_delivered_amount_with_vat) as variance_mpesa_and_delivery_amount,
                      sum(mpesa_amount) as mpesa_amount,
                      max(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                      max(total_orginal_amount_with_vat) as total_orginal_amount_with_vat,
                      max(original_vat_amount) as original_vat_amount,
                      max(delivered_vat_amount) as delivered_vat_amount,
                      string_agg(distinct mpesa_ref,"/" order by mpesa_ref) as mpesa_ref,
                      count(distinct mpesa_ref) as mpesa_ref_count
                      from sales_reconiliation_report
                      group by 1,2,3,4,5,6,7,8
                      )
select *
from report 
--where completed_date_kenya between '2021-11-01' and '2021-11-30'
where FORMAT_DATE('%Y%m%d', completed_date_kenya) between @DS_START_DATE and @DS_END_DATE 
                      