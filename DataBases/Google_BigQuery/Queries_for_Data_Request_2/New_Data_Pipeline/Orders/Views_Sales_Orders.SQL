---- created by Rodgers Nyangweso
with
sales_orders as (
                  SELECT distinct id,
                  date(created_date) as created_date,
                  date(created_date, 'Africa/Nairobi') as created_date_kenya,
                  date(delivery_date) as original_delivery_date, 
                  date(delivery_date, 'Africa/Nairobi') as original_delivery_date_kenya,
                  last_modified_date,
                  kyosk_code, 
                  code as order_code,
                  created_on_app,
                  JSON_EXTRACT_SCALAR(delivery_window, '$.windowId') as delivery_window_id,
                  JSON_EXTRACT_SCALAR(kyosk_agent, '$.name') as agent_name,
                  status as order_status,
                  JSON_EXTRACT_SCALAR(i, '$.sku') as catalog_sku,
                  JSON_EXTRACT_SCALAR(i, '$.name') as catalog_name,
                  JSON_EXTRACT_SCALAR(i, '$.packaging') as catalog_packaging,
                  cast(JSON_EXTRACT_SCALAR(i, '$.qty') as float64) as catalog_quantity,
                  cast(JSON_EXTRACT_SCALAR(i, '$.unitPrice') as float64)  as unit_price,
                  cast(JSON_EXTRACT_SCALAR(i, '$.totalPrice') as float64)  as total_price,
                  FROM `kyosk-prod.sales.tbl_orders`
                  left join unnest(json_extract_array(items)) as i 
                  ),
sales_orders_with_index as (
                              select *, 
                              row_number()over(partition by id, catalog_sku order by last_modified_date desc) as sales_order_index 
                              from sales_orders
                              )

select *  from sales_orders_with_index  where sales_order_index = 1