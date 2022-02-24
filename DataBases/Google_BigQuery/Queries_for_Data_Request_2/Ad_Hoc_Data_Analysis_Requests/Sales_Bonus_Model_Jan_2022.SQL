with
dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2021-11-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sale_days as (select *,date_trunc(date,week) as week from dates where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
vars AS (
  SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
  --SELECT DATE '2022-01-01' as current_start_date, DATE '2022-01-31' as current_end_date ),
date_vars as (
               select *,
                       date_trunc(current_start_date,month) as start_month,
                       DATE_SUB(DATE_TRUNC(DATE_ADD(current_end_date, INTERVAL 1 MONTH), MONTH), INTERVAL 1 DAY) as end_month 
                       from vars
                       ),
sales_agents_monthly_revenue_targets as (
                            SELECT distinct agent_login, start_date, 
                            sum(monthly_target) as monthly_target
                            FROM `kyosk-prod.inventory_v2.uploaded_sales_agents_daily_and_monthly_targets`,date_vars
                            where start_date between start_month and end_month
                            group by 1,2
                            ),
ops_item_report as (
                      select distinct
                      completed_date_kenya as completedDateKenya,
                      case 
                          when agent_login = '34270825' then '28630155' 
                          when agent_login = '254711396184' then 'akinyimercy636@gmail.com' 
                          when agent_login = '254743807659' then 'meubrian46@gmail.com'
                          when agent_login = '254715555418' then 'gikarujeffercy@gmail.com'
                          when agent_login = 'evalinemakori2@gmail.com' or agent_login = 'evalinemakori0@gmail.com' then 'kemuntoevaline307@gmail.com'
                          when agent_login = 'adamseustace0@gmail.com' then 'adamseustace390@gmail.com'
                          when agent_login = 'vincentotieno567@gmail.com' then 'vincentotieno2800@gmail.com'
                          when agent_login = 'absolomkaranja@gmail.com' then '29715909'
                          when agent_login = 'mishlihabi@gmail.com' then 'lihabimitchelle@gmail.com'
                          when agent_login = 'danielligami17@gmail.com' then 'danielligami85@gmail.com'
                          when agent_login = 'kmulandi123@gmail.com' then 'jmulandi123@gmail.com'
                          when agent_login = 'jangara27.19@gmail.com' then 'belindajangara82@gmail.com'
                          when agent_login = '254711725288' then '35618339'
                          when agent_login = 'reginahwanjiru761@gmail.com' then 'wanjiruregina761@gmail.com'  when agent_login = '33490100' then 'wanjiruregina761@gmail.com' 
                      else agent_login end as agentLogin, 
                      
                      service_zone_name as serviceZoneName,
                      order_code as orderCode,
                      kyosk_code as dukaCode,
                      case when 	catalog_name = ' BABA LAO NGANO 2KG' then 'BABA LAO MAIZE 2KG' else catalog_name end as catalogName,
                      case when catalog_sku = 'INVHRO9-SU' then 'INVDA6E-CI' else catalog_sku end as catalogSku,
                      string_agg(distinct agent_name, "/" order by agent_name) as agentName,
                      sum(delivered_catalog_amount) as actual_revenue,
                      
                      from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date` oir 
                      where status = 'Completed' 
                      and agent_login is not null
                      and completed_date_kenya >= '2022-01-01'
  					          and agent_login not in ('ayumba.onguko@kyosk.app')
                      group by 1,2,3,4,5,6,7
                      ),
                      
ops_item_report_with_dates as ( select oir.* from ops_item_report oir,date_vars  where  completedDateKenya between start_month and end_month ),

unique_skus_per_sales_agent as (
                            select distinct agentLogin, 
                            count(distinct catalogSku) as unique_sku_count
                            from ops_item_report_with_dates
                            group by 1
                            ),
                          
unique_skus_per_duka as (
                          select distinct agentLogin, 
                          dukaCode,
                          count(distinct catalogSku) as catalog_sku_count
                          from ops_item_report_with_dates
                          group by 1,2
                          ),
agent_average_sku_per_duka as (
                            select distinct agentLogin, 
                            sum(catalog_sku_count) as total_sku_count,
                            round(sum(catalog_sku_count)/ count(distinct dukaCode),0) as avg_catalog_sku_per_duka
                            from unique_skus_per_duka 
                            group by 1
                            ),
bonus_statistics as (
                      select distinct date_trunc(completedDateKenya, month) as month,
                      oir.agentLogin, 
                      string_agg(distinct agentName, "/" order by agentName) as agentName, 
                      string_agg(distinct serviceZoneName, "/" order by serviceZoneName) as serviceZoneName,
                      count(distinct completedDateKenya) as days_worked,
                      samrt.monthly_target as revenue_target,
                      sum( actual_revenue) as actual_revenue,
                      
                      count(distinct orderCode) as order_count, 
                      count(distinct dukaCode) as duka_count,
                      total_sku_count,
                      avg_catalog_sku_per_duka,
                      unique_sku_count
                      from ops_item_report_with_dates oir
                      left join agent_average_sku_per_duka aaspd on oir.agentLogin = aaspd.agentLogin
                      left join unique_skus_per_sales_agent uspsa on oir.agentLogin = uspsa.agentLogin
                      left join sales_agents_monthly_revenue_targets samrt on samrt.agent_login = aaspd.agentLogin and date_trunc(completedDateKenya, month) = samrt.start_date
                      group by 1,2,6,11,10,12
                      ),
final_bonus_statistics as (
                            select *, 
                            coalesce(round(safe_divide(sum(actual_revenue), sum(revenue_target)),1),0) as achieved_revenue_target 
                            from bonus_statistics
                            group by 1,2,3,4,5,6,7,8,9,10,11,12
                            ),
bonus_model as (
                 select  *, case 
                                when achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 30 then 15000
                                when  achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 25 then 12000
                                when  achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 20 then 9000
                                when  achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 15 then 6000
                                else 0 
                            end as unlocked_avg_sku_per_duka_bonus,
                            
                            case
                                when achieved_revenue_target >= 2.5 then 35000
                                when achieved_revenue_target >= 1.8 then 30000
                                when achieved_revenue_target >= 1.6 then 25000
                                when achieved_revenue_target >= 1.4 then 20000
                                when achieved_revenue_target >= 1.2 then 15000
                                when achieved_revenue_target >= 1.0 then 10000
                                when achieved_revenue_target >= 0.9 then 5000
                                when achieved_revenue_target >= 0.8 then 2500
                                else 0
                            end as unlocked_revenue_bonus,
                            
                            case
                              when achieved_revenue_target >= 0.8 and duka_count >= 200 then 15000
                              when achieved_revenue_target >= 0.8 and duka_count >= 150 then 12000
                              when achieved_revenue_target >= 0.8 and duka_count >= 120 then 9000
                              when achieved_revenue_target >= 0.8 and duka_count >= 100 then 6000
                              else 0
                            end as unlocked_duka_count_bonus,
                           
                           case
                              when achieved_revenue_target >= 0.8 and unique_sku_count >= 50 then 15000
                              when achieved_revenue_target >= 0.8 and unique_sku_count >= 40 then 12000
                              when achieved_revenue_target >= 0.8 and unique_sku_count >= 30 then 9000
                              when achieved_revenue_target >= 0.8 and unique_sku_count >= 20 then 6000
                              else 0
                           end as unlocked_unique_sku_bonus
                  from final_bonus_statistics
                  )

select *, unlocked_revenue_bonus + unlocked_avg_sku_per_duka_bonus + unlocked_duka_count_bonus + unlocked_unique_sku_bonus as total_unlocked_bonus  from bonus_model