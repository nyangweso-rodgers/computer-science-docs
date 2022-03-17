with
sale_reconcialiation_report as (
                                 SELECT distinct sale_code,
                                 completed_date_kenya, 
                                 sum(delivered_catalog_amount) as delivered_catalog_amount,
                                 service_zone_name, 
                                 kyosk_code,kyosk_name,  
                                 drs_code, 
                                 invoice_status, 
                                 payments,
                                 json_extract_scalar(p, '$.mpesaRef') as mpesa_ref, 
                                 sum(cast(json_extract_scalar(p, '$.amount') as float64)) as mpesa_amount,
                                 max(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                                 max(total_orginal_amount_with_vat) as total_orginal_amount_with_vat,
                                 max(delivered_vat_amount) as delivered_vat_amount
                                 FROM `kyosk-prod.inventory_v2.fed_scheduled_sales_reconciliations_report_v2` 
                                 left join unnest(json_extract_array(payments)) p
                                 group by 1,2,4,5,6,7,8,9,10
                                 )
select *, row_number()over(partition by sale_code order by mpesa_ref) as mpesa_ref_index from sale_reconcialiation_report 
where FORMAT_DATE('%Y%m%d', completed_date_kenya) between @DS_START_DATE and @DS_END_DATE 
--where sale_code = 'SQHSTXU'