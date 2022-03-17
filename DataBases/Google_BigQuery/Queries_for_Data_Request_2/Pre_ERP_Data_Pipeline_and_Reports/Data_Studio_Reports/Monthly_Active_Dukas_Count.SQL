WITH
fed_ops_item_report as (
                         select distinct kyosk_code,
                         service_zone_name,
                         duka_phone_numbers,
                         completed_date_kenya as delivery_date
                         from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date`
                         where status = 'Completed'
                         ),
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, service_zone_name, duka_phone_numbers
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by delivery_date desc) as index
                                        from
                                        (select distinct kyosk_code, delivery_date, service_zone_name, duka_phone_numbers from fed_ops_item_report)
                                        )
                                        where index = 1
                                        ),
monthly_sales_with_index as (
                              select *, row_number()over(partition by kyosk_code order by delivery_month desc) as delivery_month_index
                              from
                              (
                              select distinct kyosk_code,
                              date_trunc(delivery_date, month) as delivery_month
                              from fed_ops_item_report
                              )
                              order by 1,3
                              ), 

monthly_mashup as (
            select distinct a.kyosk_code, 
            dwlsss.service_zone_name,
            dwlsss.duka_phone_numbers,
            date_trunc(current_date, month) as current_month, 
            date_sub(date_trunc(current_date,month), interval 1 month) as previous_month,
            date_sub(date_trunc(current_date,month), interval 2 month) as two_previous_month,
            a.delivery_month as last_delivery_month, 
            b.delivery_month as previous_delivery_month,  
            c.delivery_month as two_previous_delivery_month
            from monthly_sales_with_index a
            left join dukas_with_last_served_service_zone dwlsss on a.kyosk_code = dwlsss.kyosk_code
            left join (select distinct kyosk_code, delivery_month from monthly_sales_with_index where delivery_month_index = 2) b on  a.kyosk_code = b.kyosk_code
            left join (select distinct kyosk_code, delivery_month from monthly_sales_with_index where delivery_month_index = 3) c on  a.kyosk_code = c.kyosk_code
            where a.delivery_month_index = 1
            ),
one_month_active_list as (
                select *, case 
                              when current_month = last_delivery_month then 'TRUE' 
                              else 'FALSE'
                           end as one_month_active_status 
                from monthly_mashup
                ),
two_month_active_list as (
                select *, case 
                              when current_month = last_delivery_month and previous_month = previous_delivery_month then 'TRUE'
                              else 'FALSE'
                           end as two_month_active_status 
                from monthly_mashup
                ),
three_month_active_list as (
                select *, case 
                              when current_month = last_delivery_month and previous_month = previous_delivery_month and two_previous_month = two_previous_delivery_month  then 'TRUE'
                              else 'FALSE'
                           end as three_month_active_status 
                from monthly_mashup
                ),
model_list as (
                select distinct dwlssz.kyosk_code, 
                dwlssz.service_zone_name,
                omal.one_month_active_status, 
                tmal.two_month_active_status, 
                thmal.three_month_active_status  
                from dukas_with_last_served_service_zone dwlssz
                left join one_month_active_list omal on dwlssz.kyosk_code = omal.kyosk_code
                left join two_month_active_list tmal on dwlssz.kyosk_code = tmal.kyosk_code
                left join three_month_active_list thmal on dwlssz.kyosk_code = thmal.kyosk_code
                ),
model_count as (
                select 
                      distinct service_zone_name, 
                      count(distinct kyosk_code) as base_count,
                      count(distinct(case when one_month_active_status = 'TRUE' then kyosk_code else null end)) as one_month_active_duka_count,
                      count(distinct(case when two_month_active_status = 'TRUE' then kyosk_code else null end)) as two_month_active_duka_count,
                      count(distinct(case when three_month_active_status = 'TRUE' then kyosk_code else null end)) as three_month_active_duka_count,
                      count(distinct(case when one_month_active_status = 'FALSE' then kyosk_code else null end)) as inactive_duka_count
                      from model_list
                      group by 1
                      ),
final_model_count as (
                        select *, 
                              round(one_month_active_duka_count / base_count, 2) as percent_one_month_active, 
                              round(two_month_active_duka_count / base_count, 2) as percent_two_month_active, 
                              round(three_month_active_duka_count / base_count, 2) as percent_three_month_active,
                              round(inactive_duka_count / base_count, 2) as percent_inactive
                        from model_count order by 2 desc
                        )
select * from final_model_count