with
fed_ops_item_report as (
                          select distinct kyosk_code,
                          kyosk_name,
                          duka_phone_numbers as phone_numbers,
                          service_zone_name,
                          order_created_date_kenya,
                          string_agg(distinct agent_name, "/" order by agent_name) as agent_name
                          from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2`
                          group by 1,2,3,4,5
                          ),
dukas_with_last_served_service_zone as (
                                        select distinct kyosk_code, service_zone_name, kyosk_name,phone_numbers,agent_name
                                        from
                                        (
                                        select *, row_number()over(partition by kyosk_code order by order_created_date_kenya desc) as index
                                        from
                                        (select distinct kyosk_code,kyosk_name,phone_numbers,agent_name, order_created_date_kenya, service_zone_name from fed_ops_item_report)
                                        )
                                        where index = 1
                                        ),
weekly_orders_mashup as (
                        SELECT distinct kyosk_code,  
                        date_trunc(order_created_date_kenya, week) as order_week,  
                        count(distinct order_created_date_kenya) as weekly_order_freq
                        FROM fed_ops_item_report
                        group by 1,2
                        ),
final_model as (
                  select wom.*, 
                  row_number()over(partition by wom.kyosk_code order by order_week desc) as order_week_index,
                  a.service_zone_name, a.kyosk_name, a.phone_numbers, a.agent_name
                  from weekly_orders_mashup wom
                  left join dukas_with_last_served_service_zone a on wom.kyosk_code = a.kyosk_code
                  order by 1,2,3,4,5 
                  )
select * from final_model where FORMAT_DATE('%Y%m%d', cast(order_week as date)) between @DS_START_DATE and @DS_END_DATE