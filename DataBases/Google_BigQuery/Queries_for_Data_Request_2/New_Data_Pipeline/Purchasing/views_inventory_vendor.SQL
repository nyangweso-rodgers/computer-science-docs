with
inventory_vendor as (
                        SELECT distinct id,
                        created_date,
                        datetime(created_date, 'Africa/Nairobi') as created_date_kenya,
                        last_modified_date,
                        created_by, 
                        created_by_name,
                        last_modified_by,
                        last_modified_by_name,
                        code as vendor_code,
                        name as vendor_name,
                        delivers,
                        credit_days,
                        contact_persons
                        FROM `kyosk-prod.inventory.tbl_vendor` 
                        ),
inventory_vendor_with_index as (select *, row_number()over(partition by id order by last_modified_date desc) as vendor_index from inventory_vendor)

select * from inventory_vendor_with_index where vendor_index = 1