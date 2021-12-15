-- created by Rodgers Nyangweso
with
inventory_catalog as (
                      select distinct id,  
                      last_modified_date, 
                      name as catalog_name, 
                      packaging as catalog_packaging, 
                      sku as catalog_sku, 
                      zone_code as service_zone_code, 
                      FROM `kyosk-prod.inventory.tbl_catalog` 
                      ),
inventory_catalog_with_index as (select *, row_number()over(partition by id order by last_modified_date desc) as inventory_catalog_index from inventory_catalog)

select icwi.* from inventory_catalog_with_index icwi where inventory_catalog_index = 1 order by id, catalog_sku, catalog_name, catalog_packaging