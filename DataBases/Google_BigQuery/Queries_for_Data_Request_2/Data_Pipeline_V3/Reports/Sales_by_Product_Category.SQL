with
completed_orders as (
                        select distinct date(oir.completed_date_kenya) as completed_date_kenya,
                        date_trunc(date(oir.completed_date_kenya), month) as month,
                        oir.catalog_sku, 
                        oir.catalog_name, 
                        oir.catalog_packaging, 
                        oir.service_zone_name,
                        sum(delivered_catalog_quantity) as delivered_catalog_qty,
                        sum(delivered_catalog_amount) as delivered_catalog_amount,
                        sum(delivered_catalog_amount) /  sum(delivered_catalog_quantity) as average_selling_price
                        FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2` oir
                        where status = 'Completed' and date(completed_date_kenya) >= '2021-10-01'
                        group by 1,2,3,4,5,6
                        ),
product_mapping as (select * from `kyosk-prod.inventory.google_sheet_product_mapping`),
                        
mashup as (
               select co.*, brand, category, sub_category, segment,
               from completed_orders co
               left join product_mapping pm  on co.catalog_sku = pm.catalog_sku and co.service_zone_name = pm.service_zone_name
               )
select * from mashup where FORMAT_DATE('%Y%m%d', completed_date_kenya) between @DS_START_DATE and @DS_END_DATE 