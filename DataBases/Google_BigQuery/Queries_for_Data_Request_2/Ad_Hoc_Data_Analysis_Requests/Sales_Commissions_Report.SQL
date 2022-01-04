with
dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2021-11-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sale_days as (select *,date_trunc(date,week) as week from dates where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
vars AS (
  SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
  --SELECT DATE '2021-12-01' as current_start_date, DATE '2021-12-31' as current_end_date ),
date_vars as (
               select *,
                       date_trunc(current_start_date,month) as start_month,
                       DATE_SUB(DATE_TRUNC(DATE_ADD(current_end_date, INTERVAL 1 MONTH), MONTH), INTERVAL 1 DAY) as end_month 
                       from vars
                       ),
sales_agents_monthly_revenue_targets as (
                            SELECT distinct agent_login, start_date, 
                            sum(monthly_target) as monthly_target
                            FROM `kyosk-prod.inv_prod_reports.uploaded_sales_agents_daily_and_monthly_targets`,date_vars
                            where start_date between start_month and end_month
                            group by 1,2
                            ),
ops_item_report as (
                      select oir.*, 
                      -- Added by Rodgers and Evans to add a column for delivery_delay-status( Early, On-Time. Late
                      case when deliveryDelay > 0 then 'Late'
                      when deliveryDelay = 0 then 'On-Time'
                      else 'Early' end as delivery_delay_status,
                      date(originalDeliveryDate , "Africa/Nairobi") as originalDeliveryDateKenya, 
                      ac.avgUnitCost,
                      ac.avgUnitCostIncl,
                      date(orderCreatedDate , "Africa/Nairobi") as orderCreatedDateKenya,
                      date(completedDate , "Africa/Nairobi") as completedDateKenya,
                      from `inv_prod_reports.ops_item_report` oir 
                      left join `inv_prod_reports.avg_costs` ac on oir.avgCostId = ac.id
                      where status = 'Completed'
                      and date(completedDate , "Africa/Nairobi") >= '2021-11-01'
                      ),
ops_item_report_with_dates as (
                                select distinct completedDateKenya,
                                agentLogin,
                                agentName,
                                serviceZoneName,
                                orderCode,
                                dukaCode,
                                catalogName,
                                catalogSku,
                                sum(deliveredCatalogQty * unitSellingPriceIncl) as actual_revenue,
                                from ops_item_report oir,date_vars 
                                where  completedDateKenya between start_month and end_month
                                group by 1,2,3,4,5,6,7,8
                                ),
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
                            round(sum(catalog_sku_count)/ count(distinct dukaCode),1) as avg_catalog_sku_per_duka_1,
                            round(avg(catalog_sku_count),1) as avg_catalog_sku_per_duka
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
                            coalesce(round(sum(actual_revenue) / sum(revenue_target),1),0) as achieved_revenue_target 
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
/*
-- invastigation of Wycliffe Ochieng Sales
select distinct catalogName, count(distinct dukaCode) as duka_count, sum(deliveredCatalogQty * unitSellingPriceIncl) as revenue
from ops_item_report where agentLogin = '28493190' and completedDateKenya between '2021-11-01' and '2021-11-30' group by 1 order by 2 desc
*/

select *, unlocked_revenue_bonus + unlocked_avg_sku_per_duka_bonus + unlocked_duka_count_bonus + unlocked_unique_sku_bonus as total_unlocked_bonus from bonus_model  --where agentLogin = 'elibrounkisangau@gmail.com'