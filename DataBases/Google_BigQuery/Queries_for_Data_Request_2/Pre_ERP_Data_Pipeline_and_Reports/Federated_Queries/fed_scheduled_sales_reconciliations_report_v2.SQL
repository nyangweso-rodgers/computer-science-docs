SELECT
      opi.sale_code,
      date(opi.completed_date) as completed_date,
      date(opi.completed_date_kenya) as completed_date_kenya,
      s.zone_code,
      sz.service_zone_name,
      s.drs_code,
      kd.kyosk_code,
      kd.kyosk_name,
      kd.phone_numbers,
      s.invoice_status,
      s.payments,
      sum(opi.delivered_catalog_amount) as delivered_catalog_amount,
      cast(total_orginal_amount_with_vat as float64) as total_orginal_amount_with_vat,
      cast(s.total_delivered_amount_with_vat as float64) as total_delivered_amount_with_vat,
      cast(s.original_vat_amount as float64) as original_vat_amount,
      cast(s.delivered_vat_amount as float64) as delivered_vat_amount
FROM EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/inventory_conn", 
'''SELECT id::text,
          completed_date,
          completed_date at time zone 'utc' at time zone 'Africa/Nairobi' as completed_date_kenya,
          sale_detail ->> 'saleCode' as sale_code,
          unit_sale_price_incl * final_catalog_qty as delivered_catalog_amount
   FROM ops_item where status = 'Completed' ''' ) opi
left join EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/inventory_conn", 
'''SELECT id::text,
          kyosk_id::text,
          zone_code,
          code as sale_code,
          payments,
          payment_method,
          drs_code,
          status,
          invoice_status,
          original_amount ->> 'totalAmountWithVAT' as total_orginal_amount_with_vat,
          delivered_amount ->> 'totalAmountWithVAT' as total_delivered_amount_with_vat,
          original_amount ->> 'vatAmount' as original_vat_amount,
          delivered_amount ->> 'vatAmount' as delivered_vat_amount
   FROM sale''' ) s on opi.sale_code = s.sale_code

left join EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/inventory_conn", 
'''SELECT id::text,
          code as service_zone_code, 
          name as service_zone_name
       FROM service_zone''') sz  on s.zone_code = sz.service_zone_code
left join EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/inventory_conn", 
'''SELECT id::text,
          code as kyosk_code,
          name as kyosk_name,
          phone_numbers
       FROM kyosk_duka''') kd on s.kyosk_id = kd.id
 --where opi.sale_code = 'SQHSTXU' # for testing
 group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15,16