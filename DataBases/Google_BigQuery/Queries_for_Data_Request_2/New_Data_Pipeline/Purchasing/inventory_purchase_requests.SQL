with
invetory_purchase_request as (
                               SELECT distinct id,
                               datetime(created_date, 'Africa/Nairobi') as created_date_kenya,
                               last_modified_date,
                               delivery_date,
                               datetime(delivery_date, 'Africa/Nairobi') as delivery_date_kenya,
                               created_by,
                               created_by_name,
                               created_date,
                               last_modified_by,
                               last_modified_by_name,
                               code as purchase_order_code,
                               status as purchase_order_status,
                               zone_code,
                               change_requested,
                               --purchase_items,
                               JSON_EXTRACT_SCALAR(i, '$.inv.sku') as inv_sku,
                               JSON_EXTRACT_SCALAR(i, '$.inv.name') as inv_name,
                               JSON_EXTRACT_SCALAR(i, '$.inv.stockingUnit') as stocking_unit,
                               JSON_EXTRACT_SCALAR(i, '$.inv.procurementUnit') as procurement_unit,
                               JSON_EXTRACT_SCALAR(i, '$.quantity') as quantity
                               FROM `kyosk-prod.inventory.tbl_purchase_request`
                               left join unnest(json_extract_array(purchase_items)) as i 
                               ),
invetory_purchase_request_with_index as (
                                          select *, 
                                          row_number()over(partition by id, inv_sku order by last_modified_date desc) as purchase_request_index 
                                          from invetory_purchase_request
                                          )

select * from invetory_purchase_request_with_index 
where  purchase_request_index = 1