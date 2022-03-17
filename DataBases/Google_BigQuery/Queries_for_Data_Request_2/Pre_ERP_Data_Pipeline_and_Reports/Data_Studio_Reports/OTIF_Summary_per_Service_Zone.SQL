-- created by Rodgers Nyangweso
with
fed_ops_item_report as (
                                select distinct kyosk_code,
                                original_delivery_date_kenya,
                                service_zone_name,
                                drs_code,
                                order_code,
                                delivery_delay_status,
                                from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2`
                                where status = 'Completed' and rescheduled = false and boot_sale = false
                                ),
otif_mashup as (
                  select distinct original_delivery_date_kenya, 
                  service_zone_name, 
                  count(distinct drs_code) as total_drs_count,
                  count(distinct order_code) as total_order_count, 
                  count(distinct  kyosk_code) as unique_dukas,
                  count(distinct(case when delivery_delay_status = 'Early' then order_code else null end)) as early_deliveries,
                  count(distinct(case when delivery_delay_status = 'Late' then order_code else null end)) as late_deliveries,
                  count(distinct(case when delivery_delay_status = 'On-Time' then order_code else null end)) as on_time_deliveries,
                  count(distinct(case when delivery_delay_status = 'Early' then order_code else null end))/count(distinct order_code) as early_deliveries_percent,
                  count(distinct(case when delivery_delay_status = 'Late' then order_code else null end))/count(distinct order_code) as late_deliveries_percent,
                  count(distinct(case when delivery_delay_status = 'On-Time' then order_code else null end))/count(distinct order_code) as ont_time_deliveries_peercent
                  from fed_ops_item_report
                  group by 1,2
                  )
select * from otif_mashup where FORMAT_DATE('%Y%m%d', original_delivery_date_kenya) between @DS_START_DATE and @DS_END_DATE 