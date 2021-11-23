create  table  `kyosk-prod.inventory.partitioned_kyosk_duka_monthly`
partition by date_trunc(created_date_kenya, month) as 
(select *
from
                        (
                        select *, 
                        row_number()over(partition by id order by last_modified_date desc) as index
                        from
                        (
                          SELECT distinct id, 
                          date(created_date, 'Africa/Nairobi') as created_date_kenya, 
                          code as kyosk_code, 
                          name as kyosk_name, 
                          last_modified_date 
                          FROM `kyosk-prod.inventory.tbl_kyosk_duka` 
                          )) where index = 1)