SELECT date_trunc(completed_date_kenya, month) as month, sum(delivered_catalog_quantity) as transaction_volume, 
count(distinct sale_code) as transaction_count,
sum(delivered_catalog_amount) / count(distinct order_code) as basket_size
FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date` 
WHERE completed_date_kenya >= "2021-07-01"
and status = 'Completed'
group by 1 order by 1