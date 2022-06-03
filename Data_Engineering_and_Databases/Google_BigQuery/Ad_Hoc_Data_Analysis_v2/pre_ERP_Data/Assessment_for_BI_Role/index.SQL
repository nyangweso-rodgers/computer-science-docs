with
completed_ops_item as (
                          SELECT distinct kyosk_code as id,
                          completed_date_kenya as sale_date,
                          sum(delivered_catalog_amount) as amount
                          FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date` 
                          where status = 'Completed'
                          and completed_date_kenya between '2021-01-01' and '2021-04-30'
                          group by 1,2
                          )
select * from completed_ops_item