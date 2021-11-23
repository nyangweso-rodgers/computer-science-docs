-- created by Rodgers Nyangweso
with
sales_delivery_window as (
                          SELECT *, row_number()over(partition by id order by last_modified_date desc) as index
                          FROM `kyosk-prod.sales.tbl_delivery_window`
                          where available = true
                          )
select *except(index) from sales_delivery_window 
where index = 1 order by start, delivery_date