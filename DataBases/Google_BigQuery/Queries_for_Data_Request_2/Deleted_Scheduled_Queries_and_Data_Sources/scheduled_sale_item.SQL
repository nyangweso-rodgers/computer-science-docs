-- created by Rodgers Nyangweso
with
ops_item_report as (
                      select distinct id, 
                      date(completed_date_kenya) as completed_date_kenya,  
                      service_zone_name,
                      catalog_sku, 
                      catalog_name, 
                      catalog_packaging,
                      status,
                      sale_code,
                      order_code,
                      sum(delivered_catalog_amount) as delivered_catalog_amount
                      from `kyosk-prod.inventory.views_ops_item_report`
                      where status = 'Completed'
                      group by 1,2,3,4,5,6,7,8,9
                      ),
sale_item as (
               SELECT distinct id,
               last_modified_date,
               ops_item_id,
               sale_code,
               cast(json_extract_scalar(delivery_accounting, '$.qty') as float64) as catalog_quantity,
               cast(json_extract_scalar(delivery_accounting, '$.totalVatAmount')  as float64) as total_vat_amount,
               cast(json_extract_scalar(delivery_accounting, '$.unitCostWithoutVat')  as float64) as unit_cost_without_vat,
               cast(json_extract_scalar(delivery_accounting, '$.unitCostWithVat')  as float64) as unit_cost_with_vat,
               cast(json_extract_scalar(delivery_accounting, '$.totalCostWithoutVat')  as float64) as total_cost_without_vat,
               cast(json_extract_scalar(delivery_accounting, '$.totalCostWithVat')  as float64) as total_cost_with_vat,
               cast(json_extract_scalar(delivery_accounting, '$.discountRate')  as float64) as discount_rate,
               cast(json_extract_scalar(delivery_accounting, '$.unitDiscountAmount')  as float64) as unit_discount_amount,
               cast(json_extract_scalar(delivery_accounting, '$.totalDiscountAmount')  as float64) as total_discount_amount
               FROM `kyosk-prod.inventory.tbl_sale_item`
               where status = 'COMPLETED'
               ),
sale_item_with_index as (
                          select *
                          from 
                          (
                          select *,
                          row_number()over(partition by id order by last_modified_date desc) as sale_item_index 
                          from sale_item
                          ) where sale_item_index = 1
                          )

select oir.*, siwi.*except(id, sale_code) 
from ops_item_report oir
left join  sale_item_with_index  siwi on oir.id = siwi.ops_item_id  and oir.sale_code = siwi.sale_code