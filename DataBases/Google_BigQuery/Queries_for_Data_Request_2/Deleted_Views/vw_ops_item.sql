SELECT DISTINCT (oi.id) AS id,
    oi.order_code AS order_code,
    UPPER(ky.name) AS duka_name,
    UPPER(ky.code) AS duka_code,
    UPPER(JSON_VALUE(ky.agent, '$.name')) AS agent_name,
    UPPER(JSON_VALUE(ky.agent, '$.login')) AS agent_login,
    UPPER( CAST(sa.boot_sale AS STRING) ) AS boot_sale,
    UPPER(oi.source_app) AS source_app, 
    UPPER(wh.type) AS warehouse_type,
    UPPER(sz.code) AS zone_code,
    UPPER(sz.name) AS zone_name,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", od.created_date) AS order_created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(od.created_date, 'Africa/Nairobi')) AS order_created_date_kenya,
    UPPER(cat.sku) AS catalog_sku,
    UPPER(cat.name) AS catalog_name,
    UPPER(cat.packaging) AS catalog_unit,
    FORMAT("%'.2f", CAST(avg.avg_unit_cost_incl AS float64)) AS unit_selling_price_incl,
    oi.catalog_qty AS ordered_catalog_quantity,
    oi.final_catalog_qty AS delivered_quantity,
    cat.conversion_ratio_from_catalog_to_inventory AS catalog_to_inventory_conversion_ratio,
    UPPER(inv.sku) AS stocking_sku,
    UPPER(inv.name) AS stocking_name,
    inv.stocking_unit AS stocking_unit,
    oi.stocking_qty AS ordered_stocking_quantity,
    oi.final_stocking_qty AS delivered_stocking_quantity,
    UPPER(drs.code) AS drs_code,
    UPPER(drs.delivery_state) AS delivery_state,
    UPPER(wh.name) AS driver_name,
    UPPER(wh.code) AS driver_login,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", drs.created_date) AS drs_creation_time,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(drs.created_date, 'Africa/Nairobi')) AS drs_creation_time_kenya,
    CONCAT( 
        CAST(dw.delivery_date AS STRING), 
        ' ', 
        REPEAT('0', 2 - LENGTH( CAST(dw.start AS STRING) )),
        dw.start,
        ':00:00'
    ) AS delivery_window_start,
    CONCAT( 
        CAST(dw.delivery_date AS STRING), 
        ' ', 
        REPEAT('0', 2 - LENGTH( CAST(dw.end AS STRING) )),
        dw.end,
        ':00:00'
    ) AS delivery_window_end,
    DATE(od.delivery_date) AS original_delivery_date,
    oi.delivery_delay AS delivery_delay,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", oi.completed_date) AS completed_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(oi.completed_date, 'Africa/Nairobi')) AS completed_date_kenya,
    UPPER(oi.status) AS status,
    UPPER(oi.cancel_reason) AS cancel_reason,
    UPPER(si.sale_code) AS sale_code,
    UPPER(JSON_VALUE(pay, '$.mpesaRef')) AS mpesa,
    UPPER(oi.created_by_name) AS created_by_name,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", oi.last_modified_date) AS last_modified_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(oi.last_modified_date, 'Africa/Nairobi')) AS last_modified_date_kenya,
    UPPER(oi.last_modified_by_name) AS last_modified_by_name
FROM `kyosk-prod.inventory.tbl_ops_item` oi
LEFT JOIN `kyosk-prod.inventory.tbl_kyosk_duka` kyd ON oi.kyosk_id = kyd.id
LEFT JOIN `kyosk-prod.sales.tbl_kyosk` ky ON kyd.code = ky.code
LEFT JOIN `kyosk-prod.sales.tbl_orders` od ON oi.order_code = od.code
LEFT JOIN `kyosk-prod.inventory.tbl_avg_cost` avg ON oi.avg_cost_id = avg.id
LEFT JOIN `kyosk-prod.inventory.tbl_delivery_run_sheet` drs ON oi.drs_code = drs.code
LEFT JOIN `kyosk-prod.inventory.tbl_service_zone` sz ON drs.zone_id = sz.id
LEFT JOIN `kyosk-prod.inventory.tbl_catalog` cat ON oi.cat_id = cat.id
LEFT JOIN `kyosk-prod.inventory.tbl_inventory` inv ON oi.inv_id = inv.id
LEFT JOIN `kyosk-prod.inventory.tbl_warehouse` wh ON drs.warehouse_id = wh.id
LEFT JOIN `kyosk-prod.inventory.tbl_sale_item` si ON oi.id = si.ops_item_id
LEFT JOIN `kyosk-prod.inventory.tbl_sale` sa ON si.sale_code = sa.code
LEFT JOIN UNNEST(JSON_QUERY_ARRAY(sa.payments, '$')) AS pay
LEFT JOIN `kyosk-prod.sales.tbl_delivery_window` AS dw ON CAST(JSON_VALUE(oi.delivery_window, '$.windowId') AS int64) = dw.id
WHERE drs.code IS NOT NULL 
    AND oi.order_code IS NOT NULL