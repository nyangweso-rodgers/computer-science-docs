with
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, service_zone_name,
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by order_created_date_kenya desc) as index
                                        from
                                        (select distinct kyosk_code, order_created_date_kenya , service_zone_name from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2` )
                                        )
                                        where index = 1
                                        )

select a.*, b.service_zone_name from `kyosk-prod.inventory_v2.fed_scheduled_duka_universe_report_v2` a
left join dukas_with_last_served_service_zone b on a.kyosk_code = b.kyosk_code
where FORMAT_DATE('%Y%m%d', date(created_date_kenya)) between @DS_START_DATE and @DS_END_DATE 