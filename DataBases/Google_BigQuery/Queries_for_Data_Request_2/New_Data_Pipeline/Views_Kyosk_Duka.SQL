-- Created by Rodgers Nyangweso
with
inventory_kyosk_duka as (
                        select *, row_number()over(partition by id order by last_modified_date desc) as index
                        from
                        (
                        SELECT distinct id,
                        code as kyosk_code,
                        name as kyosk_name,
                        last_modified_date
                        FROM `kyosk-prod.inventory.tbl_kyosk_duka` 
                        )
                        )
select * from inventory_kyosk_duka 
where index = 1