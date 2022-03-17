-- Created by Rodgers Nyangweso
with
duka_app_adoption_summary as (
                              SELECT distinct order_created_date_kenya,
                              service_zone_name,   
                              agent_name,
                              count(distinct kyosk_code) as total_duka_count,
                              count(distinct order_code) as total_order_count, 
                              count(distinct (case when  created_on_app = 'AgentApp' then order_code else null end)) as order_count_agent_app,
                              count(distinct (case when  created_on_app = 'DukaApp' then order_code else null end)) as order_count_duka_app,
                              count(distinct (case when boot_sale = true then order_code else null end)) as order_count_boot_sale,
                              coalesce(safe_divide(
                                                    cast(count(distinct (case when created_on_app = 'AgentApp' then order_code else null end)) as int64), 
                                                    cast(count(distinct(case when boot_sale = false then order_code else null end)) as int64)),0) as percent_agent_app,
                              coalesce(safe_divide(
                                                    cast(count(distinct (case when created_on_app = 'DukaApp' then order_code else null end)) as int64) , 
                                                    cast(count(distinct(case when boot_sale = false then order_code else null end)) as int64)),0) as percent_duka_app,
                              sum(ordered_catalog_amount) as total_ordered_amount,
                              sum(case when created_on_app = 'AgentApp' then ordered_catalog_amount else null end) as agent_app_ordered_amount,
                              sum(case when created_on_app = 'DukaApp' then ordered_catalog_amount else null end) as duka_app_ordered_amount,
                             coalesce(safe_divide(sum(case when created_on_app = 'AgentApp' then ordered_catalog_amount else null end) , sum(ordered_catalog_amount)),0) as percent_agent_app_revenue,
                             coalesce(safe_divide(sum(case when created_on_app = 'DukaApp' then ordered_catalog_amount else null end) , sum(ordered_catalog_amount)),0) as percent_duka_app_revenue
                              FROM `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_order_created_date`
                              group by 1,2,3
                              )
select * from duka_app_adoption_summary where FORMAT_DATE('%Y%m%d', order_created_date_kenya) between @DS_START_DATE and @DS_END_DATE