with
ops_item_report as (
                      select * 
                      from `kyosk-prod.inventory.views_partitioned_ops_item_report` 
                      where completed_date_kenya between '2021-07-01' and '2021-10-31' 
                      and status = 'Completed' and agent_name is not null
                      ),
--------------------------------------- Retention -----------------------------------------
dukas_agent_mapping as (
                          select *
                          from
                          (
                          select *, row_number()over(partition by kyosk_code order by completed_date_kenya desc) as index
                          from 
                          (
                          select distinct kyosk_code, 
                          agent_login, 
                          date(completed_date_kenya) as completed_date_kenya 
                          from ops_item_report
                          )
                          ) where index = 1
                          ),
three_month_duka_list as (
                            select distinct oir.kyosk_code,
                            dam.agent_login
                            from ops_item_report oir
                            left join (select distinct kyosk_code, agent_login from dukas_agent_mapping)  dam on oir.kyosk_code = dam.kyosk_code
                            ),    
current_month_duka_list as (
                            select distinct oir.kyosk_code
                            , dam.agent_login
                            from ops_item_report oir
                            left join (select distinct kyosk_code, agent_login from dukas_agent_mapping)  dam on oir.kyosk_code = dam.kyosk_code
                            where completed_date_kenya between '2021-10-01' and '2021-10-31'
                            ),
retained_dukas as (select * from current_month_duka_list where kyosk_code in (select distinct kyosk_code from three_month_duka_list)),
------------------------------------ Assortment ----------------------------------
dukas_assortment_list as (
                            select distinct oir.kyosk_code, agent_login,
                            count(distinct catalog_sku) as sku_count
                            from ops_item_report oir
                            where completed_date_kenya between '2021-10-01' and '2021-10-31'
                            group by 1,2
                            ),
---------------------------------------------------------- ------------------------------------
october_dukas as (
                    select distinct kyosk_code,
                    date(completed_date_kenya) as completed_date_kenya,
                    date_trunc(date(completed_date_kenya), month) as month,
                    agent_login, 
                    string_agg(agent_name, "/" order by agent_name) as agent_name,
                    string_agg(service_zone_name, "/" order by service_zone_name) as service_zone_name
                    FROM ops_item_report
                    where completed_date_kenya between '2021-10-01' and '2021-10-31' 
                    group by 1,2,3,4
                    ),

sales_mashup as (
                  SELECT distinct agent_login, 
                  count(distinct agent_name) as agent_names_count, 
                  string_agg(distinct agent_name, "/" order by agent_name) as agent_name ,
                  count(distinct service_zone_name) as service_zone_name_countc,
                  string_agg(distinct service_zone_name, "/" order by service_zone_name) as service_zone_name,
                  count(distinct date(completed_date_kenya)) as days_worked,
                  100000 as daily_revenue_target, 
                  2600000 as monthly_revenue_target,
                  sum(delivered_catalog_amount) as revenue, 
                  round(2600000 / sum(delivered_catalog_amount),2) as achieved_revenue_target,
                  FROM ops_item_report where completed_date_kenya between '2021-10-01' and '2021-10-31'
                  group by 1 
                  ),
weekly_order_frequency as (
                            select *, avg(weekly_re_order_frequency)over(partition by kyosk_code order by kyosk_code) as weekly_average, 
                            row_number()over(partition by kyosk_code order by week ) as week_index
                            from
                            (
                            select distinct kyosk_code, 
                            agent_login,
                            string_agg(distinct agent_name, "/" order by agent_name) as agent_name,
                            date_trunc(date(completed_date_kenya), month) as month,
                            date_trunc(date(completed_date_kenya), week) as week, 
                            count(distinct (date(completed_date_kenya))) as weekly_re_order_frequency 
                            from ops_item_report where completed_date_kenya between '2021-10-01' and '2021-10-31' group by 1,2,4,5
                            )
                            ),
weekly_order_frequency_mashup as (
                                  select distinct kyosk_code, 
                                  agent_login, 
                                  agent_name,
                                  cast(sum( case when week_index = 1 then weekly_re_order_frequency else 0 end) as INT64) as oct_wk1,
                                  cast(sum( case when week_index = 2 then weekly_re_order_frequency else 0 end) as INT64) as oct_wk2,
                                  cast(sum( case when week_index = 3 then weekly_re_order_frequency else 0 end) as INT64) as oct_wk3,
                                  cast(sum( case when week_index = 4 then weekly_re_order_frequency else 0 end) as INT64) as oct_wk4,
                                  cast(sum( case when week_index = 5 then weekly_re_order_frequency else 0 end) as INT64) as oct_wk5
                                  from weekly_order_frequency 
                                  --where kyosk_code = '2CUA' 
                                  group by 1,2,3
                                  )
select distinct agent_login, avg(sku_count) as avg_sku_count from dukas_assortment_list group by 1 order by 2