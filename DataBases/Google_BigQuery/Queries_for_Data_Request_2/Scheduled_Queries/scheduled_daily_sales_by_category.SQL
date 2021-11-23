with
completed_orders as (
                        select distinct date(oir.completed_date_kenya) as completed_date_kenya,
                        oir.catalog_sku, 
                        oir.catalog_name, 
                        oir.catalog_packaging, 
                        oir.service_zone_name,
                        sum(delivered_catalog_amount) as delivered_catalog_amount
                        FROM `kyosk-prod.inventory.views_ops_item_report` oir
                        where status = 'Completed' and date(completed_date_kenya) >= '2021-10-01'
                        group by 1,2,3,4,5
                        ),
product_mapping as (select * from `kyosk-prod.inventory.google_sheet_product_mapping`),
                        
mashup as (
               select co.*, brand, category, sub_category, segment,
               from completed_orders co
               left join product_mapping pm  on co.catalog_sku = pm.catalog_sku and co.service_zone_name = pm.service_zone_name
               )
select * from mashup