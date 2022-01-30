SELECT date_trunc(date(drs_created_date_kenya), month) as drs_created_month, driver_login,
string_agg(distinct driver_name, "/" order by driver_name) as driver_name,
string_agg(distinct service_zone_name, "/" order by service_zone_name) as service_zone_name,
count(distinct drs_code) as drs_count,
count(distinct date(drs_created_date_kenya)) as drs_date_count,
sum(delivered_catalog_amount) as revenue
FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2` 
where status = 'Completed'
and FORMAT_DATE('%Y%m%d', date(drs_created_date_kenya)) between @DS_START_DATE and @DS_END_DATE 
group by 1,2
order by 1 desc