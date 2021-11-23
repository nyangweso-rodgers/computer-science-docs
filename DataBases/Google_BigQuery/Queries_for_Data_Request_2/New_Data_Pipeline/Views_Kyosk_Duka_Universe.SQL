with
sale_kyosks as (select * from `kyosk-prod.sales.views_kyosk`),
latest_duka_service_zone as (
                              select *
                              from
                              (
                              select *, row_number()over(partition by kyosk_code order by order_created_date_kenya desc ) as service_zone_index
                              from
                              (
                              SELECT distinct kyosk_code, 
                              service_zone_name, 
                              order_created_date_kenya
                              FROM `kyosk-prod.inventory.views_ops_item_report`
                              where kyosk_code is not null
                              ))
                              where service_zone_index = 1
                              ),
sales_orders as (
                  SELECT distinct kyosk_code,
                  min(order_created_date_kenya) as first_order_date,
                  max(order_created_date_kenya) as last_order_date,
                  current_date() as current_date,
                  date_diff(date_trunc(current_date(),month), max(date_trunc(order_created_date_kenya,month)), month) as month_since_last_order,
                  count(distinct(case when created_on_app = 'DukaApp' then order_code else null end)) as order_count_duka_app,
                  count(distinct(case when created_on_app = 'AgentApp' then order_code else null end)) as order_count_agent_app
                  FROM `kyosk-prod.inventory.views_ops_item_report`
                  group by 1
                  ),
mashup as (
            select sk.*, 
            so.*except(kyosk_code), case when month_since_last_order is null then 'Dormant' when month_since_last_order <= 2 then 'Active' else 'In-Active' end as active_status,
            ldsz.service_zone_name
            from sale_kyosks sk
            left join sales_orders so on sk.kyosk_code = so.kyosk_code
            left join latest_duka_service_zone ldsz on sk.kyosk_code = ldsz.kyosk_code
            )
select *  from mashup  order by last_order_date desc