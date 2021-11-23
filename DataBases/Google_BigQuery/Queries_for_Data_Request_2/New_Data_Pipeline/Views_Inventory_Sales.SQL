-- created by Rodgers Nyangweso
with
sale_kyosk as (select distinct id, kyosk_code, kyosk_name from `kyosk-prod.inventory.views_kyosk_duka`),
inventory_service_zone as (select distinct service_zone_code, service_zone_name from `kyosk-prod.inventory.views_service_zone`  ),
inventory_sale as (
                    select *, row_number()over(partition by id order by last_modified_date desc) as index
                    from
                    (
                    SELECT distinct id, 
                    created_date,
                    datetime(created_date, 'Africa/Nairobi') as created_date_kenya,
                    last_modified_date,
                    datetime(last_modified_date, 'Africa/Nairobi') as last_modified_date_kenya,
                    completed_date,
                    date(completed_date, 'Africa/Nairobi') as completed_date_kenya,
                    kyosk_id,
                    zone_code,
                    code as sale_code,
                    drs_code,
                    boot_sale,
                    status,
                    invoice_status,
                    payment_method,
                    payments,
                    cast(json_extract_scalar(original_amount, '$.totalAmountWithVAT') as float64) as total_orginal_amount_with_vat,
                    cast(json_extract_scalar(delivered_amount, '$.totalAmountWithVAT') as float64) as total_delivered_amount_with_vat,
                    cast(json_extract_scalar(original_amount, '$.vatAmount') as float64) as original_vat_amount,
                    cast(json_extract_scalar(delivered_amount, '$.vatAmount') as float64) as delivered_vat_amount
                    FROM `kyosk-prod.inventory.tbl_sale` 
                    
                    )
                    ),
sales_mashup as (
                  select *, row_number()over(partition by sale_code order by mpesa_ref) as mpesa_ref_index
                  from
                  (
                  select s.*, 
                  json_extract_scalar(p, '$.mpesaRef') as mpesa_ref, 
                  cast(json_extract_scalar(p, '$.amount') as float64) as mpesa_amount,
                  isz.service_zone_name,
                  kyosk_code,
                  kyosk_name
                  from inventory_sale s
                  left join unnest(json_extract_array(payments)) p
                  left join inventory_service_zone isz on s.zone_code = isz.service_zone_code
                  left join sale_kyosk sk on s.kyosk_id = sk.id
                  where s.index = 1
                  )
                  )
select * from sales_mashup
order by sale_code, mpesa_ref_index, completed_date_kenya desc