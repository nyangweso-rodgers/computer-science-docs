with
sales_orders as (
                  select distinct kyosk_code, 
                  count(distinct date_trunc(original_delivery_date_kenya, month)) as total_number_of_months_active,
                  count(distinct original_delivery_date_kenya) as total_days_ordered,
                  count(distinct (case when original_delivery_date_kenya between '2021-04-01' and '2021-04-30' then date_trunc(original_delivery_date_kenya, month) else null end)) as april_active,
                  count(distinct (case when original_delivery_date_kenya between '2021-05-01' and '2021-05-31' then date_trunc(original_delivery_date_kenya, month) else null end)) as may_active,
                  count(distinct (case when original_delivery_date_kenya between '2021-06-01' and '2021-06-30' then date_trunc(original_delivery_date_kenya, month) else null end)) as june_active,
                  count(distinct (case when original_delivery_date_kenya between '2021-07-01' and '2021-07-31' then date_trunc(original_delivery_date_kenya, month) else null end)) as july_active,
                  count(distinct (case when original_delivery_date_kenya between '2021-08-01' and '2021-08-31' then date_trunc(original_delivery_date_kenya, month) else null end)) as august_active,
                  count(distinct (case when original_delivery_date_kenya between '2021-09-01' and '2021-09-30' then date_trunc(original_delivery_date_kenya, month) else null end)) as september_active,
                  sum(total_price) as total_ordered_amount,
                  sum(total_price) / count(distinct original_delivery_date_kenya)  as order_size
                  FROM `kyosk-prod.sales.views_orders` 
                  where original_delivery_date_kenya between '2021-04-01' and '2021-09-30'
                  group by 1
                  ),
final_model as (
            select *, case 
              when total_number_of_months_active = 6 then 'Six-Months Active' 
              when (total_number_of_months_active = 5 and april_active = 0) then 'Five-Months Active'
              when (total_number_of_months_active = 4 and april_active = 0 and may_active = 0) then 'Four-Months Active'
              when (total_number_of_months_active = 3 and july_active = 1 and august_active = 1 and september_active = 1 )  then 'Three-Month Active' 
               when (total_number_of_months_active = 2 and august_active = 1 and september_active = 1 )  then 'Two-Month Active' 
              when (total_number_of_months_active = 1 and september_active = 1 )  then 'One-Month Active' 
              else 'Non - Regular Dukas' 
           end as monthly_active_classification_status 
              from sales_orders
              )
select * from final_model
--where monthly_active_classification_status = 'Not Classified' 