create or replace table  `kyosk-prod.sales.partitioned_tbl_orders_daily`
partition by date(last_modified_date) --timestamp_trunc(last_modified_date, day)
as 
(select *
                  from
                  (
                  select *, 
                  row_number()over(partition by id, catalog_sku order by last_modified_date desc) as sales_order_index 
                  from
                  (
                  SELECT distinct id,
                  date(created_date, 'Africa/Nairobi') as created_date_kenya,
                  date(delivery_date, 'Africa/Nairobi') as original_delivery_date_kenya,
                  last_modified_date,
                  kyosk_code,
                  code as order_code,
                  created_on_app,
                  JSON_EXTRACT_SCALAR(delivery_window, '$.windowId') as delivery_window_id,
                  created_by as order_created_by,
                  created_by_name as order_created_by_name,
                  JSON_EXTRACT_SCALAR(kyosk_agent, '$.login') as agent_login,
                  string_agg(distinct JSON_EXTRACT_SCALAR(kyosk_agent, '$.name'), "/" order by JSON_EXTRACT_SCALAR(kyosk_agent, '$.name')) as agent_name,
                  JSON_EXTRACT_SCALAR(kyosk_agent, '$.phoneNumber') as agent_phone_number,
                  status as order_status,
                  JSON_EXTRACT_SCALAR(i, '$.sku') as catalog_sku,
                  JSON_EXTRACT_SCALAR(i, '$.name') as catalog_name,
                  JSON_EXTRACT_SCALAR(i, '$.packaging') as catalog_packaging,
                  cast(JSON_EXTRACT_SCALAR(i, '$.qty') as float64) as catalog_quantity,
                  cast(JSON_EXTRACT_SCALAR(i, '$.unitPrice') as float64)  as unit_price,
                  cast(JSON_EXTRACT_SCALAR(i, '$.totalPrice') as float64)  as total_price,
                  FROM `kyosk-prod.sales.tbl_orders`
                  left join unnest(json_extract_array(items)) as i
                  group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20
                  ) 
                  ) where sales_order_index = 1)