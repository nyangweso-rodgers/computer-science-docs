/* This Query calculates actuals against warehouse dbm set targets */
with dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2020-01-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sale_days as (select *,date_trunc(date,week) as week from dates), --where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
vars AS (
  --SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
    SELECT DATE '2021-03-01' as current_start_date, DATE '2021-03-06' as current_end_date ),
date_vars as (select *,
    date_sub(current_start_date,interval 
              (case when FORMAT_DATE('%A',current_start_date) <> 'Sunday'  then date_diff(current_end_date,current_start_date,day)+1 
                    else date_diff(current_end_date,current_start_date,day)+1 end) 
                                    day) as previous_start_date,date_sub(current_start_date,interval 1 day) as previous_end_date,
    date_trunc(current_start_date,month) as mtd_start_date,current_end_date as mtd_end_date
    ,DATE_SUB(DATE_TRUNC(DATE_ADD(current_end_date, INTERVAL 1 MONTH), MONTH), INTERVAL 1 DAY) as end_month from vars
    ),
    
targets as (select * from `twigadms.dmslive.dbm_distribution_kpi`),
otif as (select * from `twigadms.dmslive.cache_otif` ),
payments as (select * from `twigadms.dmslive.cache_delivery_payments` ),
delivery_distance as (select * from `twigadms.dmslive.cache_delivery_distances`),
value_chain as (
                 select distinct date, sum(sold_amount) as sold_amount, sum(Projected_revenue) as Projected_revenue,
                 from dmslive.cache_value_chain where FORMAT_DATE('%A',date) <> 'Sunday'  -- to eliminate some noticed 0 values on Sundays 
                 and Projected_revenue > 0 and sold_amount > 0
                 and date >= '2021-01-01'
                 group by 1
                 ),

------------------------------- Previous Period -------------------------------
previous_otif as (select  count(distinct(case when ON_TIME = 'ON-TIME' then delivery_id end))/count(distinct delivery_id)  as on_time,
                           sum(case when IN_FULL = 'IF' then 1 else 0 end)/count(delivery_id) as strike_rate
                                from otif,date_vars
                                where delivery_date between previous_start_date and previous_end_date 
                                ),
previous_delivery_distance as (select  sum(case when Distance <= 50 then 1 else 0 end)/count(delivery_id) as delivery_accuracy
                                from delivery_distance,date_vars
                                where delivery_date between previous_start_date and previous_end_date 
                                ),
previous_payments as (select  sum(case when payment_mode in ('CASH') then 1 else 0 end)/count(delivery_id) as cash_payment,
                   sum(case when payment_mode in ('LOAN') then 1 else 0 end)/count(delivery_id) as loan_payment,
                    sum(case when payment_mode in ('MPESA_TILL_AUTO','MPESA_TILL') then 1 else 0 end)/count(delivery_id) as mobile_money_payment,
                    sum(case when payment_mode in ('MPESA_STK') then 1 else 0 end)/count(delivery_id) as mpesa_stk_payment,
                    sum(case when payment_mode in ('MPESA_STK','MPESA_TILL_AUTO','MPESA_TILL','LOAN') then 1 else 0 end)/
                                            count(delivery_id) as group_payment,
                                from payments,date_vars
                                where delivery_date between previous_start_date and previous_end_date 
                                ),
previous_revenue_realization as (select safe_divide(sum(sold_amount),sum(Projected_revenue)) as revenue_realization_lagging  from value_chain, date_vars
                                where date between previous_start_date and previous_end_date ),
------------------------------- current Period -------------------------------
current_otif as (select  count(distinct(case when ON_TIME = 'ON-TIME' then delivery_id end))/count(distinct delivery_id)  as on_time,
                           sum(case when IN_FULL = 'IF' then 1 else 0 end)/count(delivery_id) as strike_rate
                                from otif,date_vars
                                where delivery_date between current_start_date and current_end_date 
                                ),
current_delivery_distance as (select  sum(case when Distance <= 50 then 1 else 0 end)/count(delivery_id) as delivery_accuracy
                                from delivery_distance,date_vars
                                where delivery_date between current_start_date and current_end_date 
                                ),
current_payments as (select  sum(case when payment_mode in ('CASH') then 1 else 0 end)/count(delivery_id) as cash_payment,
                   sum(case when payment_mode in ('LOAN') then 1 else 0 end)/count(delivery_id) as loan_payment,
                    sum(case when payment_mode in ('MPESA_TILL_AUTO','MPESA_TILL') then 1 else 0 end)/count(delivery_id) as mobile_money_payment,
                    sum(case when payment_mode in ('MPESA_STK') then 1 else 0 end)/count(delivery_id) as mpesa_stk_payment,
                    sum(case when payment_mode in ('MPESA_STK','MPESA_TILL_AUTO','MPESA_TILL','LOAN') then 1 else 0 end)/
                                            count(delivery_id) as group_payment,
                                from payments,date_vars
                                where delivery_date between current_start_date and current_end_date 
                                ),
current_revenue_realization as (select safe_divide(sum(sold_amount),sum(Projected_revenue)) as revenue_realization_lagging   from value_chain, date_vars
                                where date between current_start_date and current_end_date  ),
------------------------------- mtd Period -------------------------------
mtd_otif as (select  count(distinct(case when ON_TIME = 'ON-TIME' then delivery_id end))/count(distinct delivery_id)  as on_time,
                           sum(case when IN_FULL = 'IF' then 1 else 0 end)/count(delivery_id) as strike_rate
                                from otif,date_vars
                                where delivery_date between mtd_start_date and mtd_end_date 
                                ),
mtd_delivery_distance as (select  sum(case when Distance <= 50 then 1 else 0 end)/count(delivery_id) as delivery_accuracy
                                from delivery_distance,date_vars
                                where delivery_date between mtd_start_date and mtd_end_date 
                                ),
mtd_payments as (select  sum(case when payment_mode in ('CASH') then 1 else 0 end)/count(delivery_id) as cash_payment,
                   sum(case when payment_mode in ('LOAN') then 1 else 0 end)/count(delivery_id) as loan_payment,
                    sum(case when payment_mode in ('MPESA_TILL_AUTO','MPESA_TILL') then 1 else 0 end)/count(delivery_id) as mobile_money_payment,
                    sum(case when payment_mode in ('MPESA_STK') then 1 else 0 end)/count(delivery_id) as mpesa_stk_payment,
                    sum(case when payment_mode in ('MPESA_STK','MPESA_TILL_AUTO','MPESA_TILL','LOAN') then 1 else 0 end)/
                                            count(delivery_id) as group_payment,
                                from payments,date_vars
                                where delivery_date between mtd_start_date and mtd_end_date 
                                ),
mtd_revenue_realization as (select safe_divide(sum(sold_amount),sum(Projected_revenue)) as revenue_realization_lagging    from value_chain, date_vars
                                where date between mtd_start_date and mtd_end_date),
final_models as (

select t.*,
case when kpi_name = 'grouped_payments' then pp.group_payment
when kpi_name = 'cash_payments_lagging' then pp.cash_payment
when kpi_name = 'strike_rate_lagging' then po.strike_rate
when kpi_name = 'on_time_lagging' then po.on_time
when kpi_name = 'product_delivery_accuracy_lagging' then pdd.delivery_accuracy
when kpi_name = 'loan_facility_payments' then pp.loan_payment
when kpi_name = 'sim_tool_kit_payments' then pp.mpesa_stk_payment
when kpi_name = 'mobile_money_payments' then pp.mobile_money_payment
when kpi_name = 'totals' then pp.group_payment
when kpi_name = 'cash_payments_leading' then pp.cash_payment
when kpi_name = 'strike_rate_leading' then po.strike_rate
when kpi_name = 'product_delivery_accuracy_leading' then pdd.delivery_accuracy
when kpi_name = 'revenue_realization_lagging' then prr.revenue_realization_lagging
else null
end as previous_period_actual,

case when kpi_name = 'grouped_payments' then cp.group_payment
when kpi_name = 'cash_payments_lagging' then cp.cash_payment
when kpi_name = 'strike_rate_lagging' then co.strike_rate
when kpi_name = 'on_time_lagging' then co.on_time
when kpi_name = 'product_delivery_accuracy_lagging' then cdd.delivery_accuracy
when kpi_name = 'loan_facility_payments' then cp.loan_payment
when kpi_name = 'sim_tool_kit_payments' then cp.mpesa_stk_payment
when kpi_name = 'mobile_money_payments' then cp.mobile_money_payment
when kpi_name = 'totals' then cp.group_payment
when kpi_name = 'cash_payments_leading' then cp.cash_payment
when kpi_name = 'strike_rate_leading' then co.strike_rate
when kpi_name = 'product_delivery_accuracy_leading' then cdd.delivery_accuracy
when kpi_name = 'revenue_realization_lagging' then crr.revenue_realization_lagging
else null
end as current_period_actual,

case when kpi_name = 'grouped_payments' then mtdp.group_payment
when kpi_name = 'cash_payments_lagging' then mtdp.cash_payment
when kpi_name = 'strike_rate_lagging' then mtdo.strike_rate
when kpi_name = 'on_time_lagging' then mtdo.on_time
when kpi_name = 'product_delivery_accuracy_lagging' then mtddd.delivery_accuracy
when kpi_name = 'loan_facility_payments' then mtdp.loan_payment
when kpi_name = 'sim_tool_kit_payments' then mtdp.mpesa_stk_payment
when kpi_name = 'mobile_money_payments' then mtdp.mobile_money_payment
when kpi_name = 'totals' then mtdp.group_payment
when kpi_name = 'cash_payments_leading' then mtdp.cash_payment
when kpi_name = 'strike_rate_leading' then mtdo.strike_rate
when kpi_name = 'product_delivery_accuracy_leading' then mtddd.delivery_accuracy
when kpi_name = 'revenue_realization_lagging' then mtdrr.revenue_realization_lagging
else null
end as mtd_period_actual

from targets t 
,previous_otif po
,previous_delivery_distance pdd
,previous_payments pp
,previous_revenue_realization prr
,current_otif co
,current_delivery_distance cdd
,current_payments cp
,current_revenue_realization crr
,mtd_otif mtdo
,mtd_delivery_distance mtddd
,mtd_payments mtdp
,mtd_revenue_realization mtdrr

)
select * from final_models 