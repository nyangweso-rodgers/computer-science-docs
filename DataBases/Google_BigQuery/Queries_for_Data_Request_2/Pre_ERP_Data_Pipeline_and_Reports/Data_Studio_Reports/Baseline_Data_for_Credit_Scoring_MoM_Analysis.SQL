with
ops_item_report as (
                    SELECT distinct date(completed_date_kenya) as date,
                    kyosk_code,
                    kyosk_name,
                    duka_phone_numbers,
                    service_zone_name,
                    sum(delivered_catalog_amount) as revenue
                    FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date`
                    where status = 'Completed'
                    group by 1,2,3,4,5
                    ),
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, kyosk_name,duka_phone_numbers duka_phone_numbers ,service_zone_name
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by date desc) as index
                                        from
                                        (select distinct kyosk_code,kyosk_name, duka_phone_numbers , date, service_zone_name from ops_item_report)
                                        )
                                        where index = 1
                                        ),
mashup as (
            select distinct date_trunc(date,month) as month, 
            oir.kyosk_code,  
            dwlsz.*except(kyosk_code),
            sum(revenue) as revenue
            from ops_item_report oir
            left join dukas_with_last_served_service_zone dwlsz on oir.kyosk_code = dwlsz.kyosk_code
            group by 1,2,3,4,5
            )
select * from mashup where FORMAT_DATE('%Y%m%d', month) between @DS_START_DATE and @DS_END_DATE 