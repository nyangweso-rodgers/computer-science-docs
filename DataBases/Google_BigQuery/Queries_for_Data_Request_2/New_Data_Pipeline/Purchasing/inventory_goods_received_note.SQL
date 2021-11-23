with
inventory_goods_received_note as (
                                    SELECT distinct id,
                                    created_date,
                                    date(created_date, 'Africa/Nairobi') as created_date_kenya,
                                    last_modified_date,
                                    created_by,
                                    created_by_name,
                                    last_modified_by,
                                    last_modified_by_name,
                                    zone_code,
                                    vendor_code,
                                    code as grn_code,
                                    lpo_code,
                                    invoice_no,
                                    status as grn_status, 
                                   -- grn_items,
                                    JSON_EXTRACT_SCALAR(i, '$.inv.sku') as inv_sku,
                                    JSON_EXTRACT_SCALAR(i, '$.inv.name') as inv_name,
                                    JSON_EXTRACT_SCALAR(i, '$.inv.stockingUnit') as stocking_unit,
                                    cast(JSON_EXTRACT_SCALAR(i, '$.lpoAccounting.qty') as float64) as quantity
                                    FROM `kyosk-prod.inventory.tbl_goods_received_note` 
                                    left join unnest(json_extract_array(grn_items)) as i 
                                    ),
inventory_goods_received_note_with_index as (
                                              select *, 
                                              row_number()over(partition by id, inv_sku order by last_modified_date desc) as grn_index 
                                              from inventory_goods_received_note
                                              )

select * from inventory_goods_received_note_with_index where grn_index = 1