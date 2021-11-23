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
                              coalesce(safe_divide(cast(count(distinct (case when  created_on_app = 'AgentApp' then order_code else null end)) as int64), cast(count(distinct order_code) as int64)),0) as percent_agent_app,
                              coalesce(safe_divide(cast(count(distinct (case when  created_on_app = 'DukaApp' then order_code else null end)) as int64) , cast(count(distinct order_code) as int64)),0) as percent_duka_app,
                              sum(ordered_catalog_amount) as total_ordered_amount,
                              sum(case when created_on_app = 'AgentApp' then ordered_catalog_amount else null end) as agent_app_ordered_amount,
                              sum(case when created_on_app = 'DukaApp' then ordered_catalog_amount else null end) as duka_app_ordered_amount,
                             coalesce(safe_divide(sum(case when created_on_app = 'AgentApp' then ordered_catalog_amount else null end) , sum(ordered_catalog_amount)),0) as percent_agent_app_revenue,
                             coalesce(safe_divide(sum(case when created_on_app = 'DukaApp' then ordered_catalog_amount else null end) , sum(ordered_catalog_amount)),0) as percent_duka_app_revenue
                              FROM `kyosk-prod.inventory.views_ops_item_report_v2`
                              --where original_delivery_date_kenya is not null -- To eliminate boot sales from the data source
                              group by 1,2,3
                              )
select * from duka_app_adoption_summary 
--where order_created_date_kenya = '2021-11-16'
--order by 1 desc