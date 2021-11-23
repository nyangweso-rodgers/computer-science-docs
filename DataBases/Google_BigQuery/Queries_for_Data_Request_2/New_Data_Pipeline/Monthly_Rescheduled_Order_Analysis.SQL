SELECT date_trunc(order_created_date_kenya, month) as order_created_month,
count(distinct order_code) as total_order_count,
count(distinct(case when rescheduled = true then order_code else null end)) as rescheduled_order_count,
count(distinct(case when rescheduled = true and status = 'Cancelled' then order_code else null end)) as cancelled_rescheduled_order_count,
count(distinct(case when rescheduled = true and status = 'Completed' then order_code else null end)) as completed_rescheduled_order_count,
count(distinct(case when rescheduled = true and status = 'Rescheduled' then order_code else null end)) as rescheduled_rescheduled_order_count,
count(distinct(case when rescheduled = true and status = 'OutOfStock' then order_code else null end)) as OOS_rescheduled_order_count,
count(distinct(case when rescheduled = true and status = 'Dispatched' then order_code else null end)) as dispatched_rescheduled_order_count
FROM `kyosk-prod.inventory.views_ops_item_report`
group by 1
order by 1 desc