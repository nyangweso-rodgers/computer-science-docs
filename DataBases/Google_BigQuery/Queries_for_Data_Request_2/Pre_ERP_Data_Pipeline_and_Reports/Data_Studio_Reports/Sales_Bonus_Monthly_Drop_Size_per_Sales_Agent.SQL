with
completed_ops_item_report as (
                                select 
                                distinct completed_date_kenya,
                                kyosk_code,
                                order_code,
                                service_zone_name,
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
                                    when agent_login = 'reginahwanjiru761@gmail.com' then 'wanjiruregina761@gmail.com'  
                                    when agent_login = '33490100' then 'wanjiruregina761@gmail.com' 
                                else agent_login end as agent_login,
                                agent_name,
                                sum(delivered_catalog_amount) as amount
                                from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date` 
                                where status = 'Completed'
                                and agent_login is not null 
                                and completed_date_kenya between '2022-01-01'  and '2022-01-31'
                                and agent_login not in ('ayumba.onguko@kyosk.app')
                                group by 1,2,3,4,5,6
                                ),
monthly_working_days_per_agent as (
                                    select date_trunc(completed_date_kenya, month) as completed_month,
                                    agent_login,
                                    string_agg(distinct agent_name, "/" order by agent_name) as agent_name,
                                    string_agg(distinct service_zone_name, "/" order by  service_zone_name) as service_zone_name,
                                    count(distinct completed_date_kenya) as days_worked,
                                    count(distinct order_code) as count_of_orders
                                    from completed_ops_item_report
                                    group by 1,2
                                    ),
monthly_customer_drop_size as (
                                select date_trunc(completed_date_kenya, month) as completed_month,
                                kyosk_code,
                                agent_login,
                                service_zone_name,
                                string_agg(distinct agent_name, "/" order by agent_name) as agent_name,
                                count(distinct order_code) as count_of_orders,
                                count(distinct completed_date_kenya) as count_of_days_served,
                                sum(amount) as amount,
                                sum(amount) / count(distinct order_code) as avg_amount_per_sales_order
                                from completed_ops_item_report
                                group by 1,2,3,4
                                ),
monthly_sales_agent_drop_size as (
                                  select distinct completed_month,
                                  agent_login,
                                  count(distinct kyosk_code) as count_of_customers,
                                  sum(amount) as amount,
                                  round(avg(avg_amount_per_sales_order)) as avg_amount_per_sales_order,
                                  from monthly_customer_drop_size
                                  group by 1,2
                                  ),
agent_drop_size_mashup as (
                            select mwdpa.*,
                            msads.*except(agent_login, completed_month)  
                            from monthly_working_days_per_agent mwdpa
                            left join monthly_sales_agent_drop_size msads on  mwdpa.agent_login  = msads.agent_login and mwdpa.completed_month  = msads.completed_month
                            where FORMAT_DATE('%Y%m%d', mwdpa.completed_month) between @DS_START_DATE and @DS_END_DATE 
                            )
select * from monthly_customer_drop_size where FORMAT_DATE('%Y%m%d', completed_month) between @DS_START_DATE and @DS_END_DATE 