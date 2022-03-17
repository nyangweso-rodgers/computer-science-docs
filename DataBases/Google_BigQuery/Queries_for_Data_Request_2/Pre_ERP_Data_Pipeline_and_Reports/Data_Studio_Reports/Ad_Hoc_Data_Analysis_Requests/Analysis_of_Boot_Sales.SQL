SELECT distinct date_trunc(date(completed_date_kenya),month) as month, 
count(distinct order_code) as total_order_count, 
sum(delivered_catalog_quantity) as delivered_quantity, 
sum(delivered_catalog_amount) as delivered_amount,
count(distinct(case when boot_sale = true then order_code else null end)) as boot_sale_order_count, 
sum(case when boot_sale = true then delivered_catalog_quantity else null end) as boot_sale_delivery_qty, 
sum(case when boot_sale = true then delivered_catalog_amount else null end) as boot_sale_delivery_amount, 
FROM `kyosk-prod.sales.scheduled_ops_item_report_v2`
where status = 'Completed' group by 1
order by 1 desc