SELECT distinct order_created_date_kenya, order_code, rescheduled, count(distinct catalog_sku) as catalog_count, string_agg(distinct status ,"/" order by status) as status,
count(distinct(case when rescheduled = true and status = 'Cancelled' then catalog_sku else null end)) as cancelled_sku_count,
count(distinct(case when rescheduled = true and status = 'Completed' then catalog_sku else null end)) as completed_sku_count,
count(distinct(case when rescheduled = true and status = 'Rescheduled' then catalog_sku else null end)) as rescheduled_sku_count,
count(distinct(case when rescheduled = true and status = 'OutOfStock' then catalog_sku else null end)) as OOS_sku_count,
count(distinct(case when rescheduled = true and status = 'Dispatched' then catalog_sku else null end)) as dispatched_sku_count,
string_agg(distinct cancel_reason ,"/" order by cancel_reason) as cancellation_reasons,
FROM `kyosk-prod.inventory.views_ops_item_report`
where order_created_date_kenya between '2021-09-26' and '2021-10-02' and rescheduled = true
group by 1,2,3 order by 1,2