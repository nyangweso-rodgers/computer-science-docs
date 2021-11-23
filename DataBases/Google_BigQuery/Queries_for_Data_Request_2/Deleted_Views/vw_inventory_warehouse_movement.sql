SELECT DISTINCT 
    adj.id AS id, 
    UPPER(mvt_code) AS mvt_code,
    FORMAT("%'d", qty) AS qty,
    UPPER(sku) AS sku,
    UPPER(inv.name) AS inventory_name,
    UPPER(inv.stocking_unit) AS stocking_unit,
    UPPER(movement_type) AS movement_type,
    UPPER(inv.status) AS inventory_status,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", timestamp) AS adjustment_timestamp,
    UPPER(wh_code) AS wh_code,
    UPPER(wh.name) AS warehouse_name,
    UPPER(wh.type) AS warehouse_type,
    UPPER(adj.zone_code) AS zone_code,
    UPPER(sz.name) AS zone_name,
    FORMAT("%'d", wh_qty_before) AS wh_qty_before,
    FORMAT("%'d", wh_qty_after) AS wh_qty_after,
    FORMAT("%'d", zone_qty_before) AS zone_qty_before,
    FORMAT("%'d", zone_qty_after) AS zone_qty_after,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", adj.created_date) AS created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(adj.created_date, 'Africa/Nairobi')) AS created_date_kenya,
    UPPER(adj.created_by_name) AS created_by_name,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", adj.last_modified_date) AS last_modified_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(adj.last_modified_date, 'Africa/Nairobi')) AS last_modified_date_kenya
FROM `kyosk-prod.inventory.tbl_inventory_adjustment` adj
LEFT JOIN `kyosk-prod.inventory.tbl_service_zone` sz ON adj.zone_code = sz.code
LEFT JOIN `kyosk-prod.inventory.tbl_warehouse` wh ON adj.wh_code = wh.code
LEFT JOIN `kyosk-prod.inventory.tbl_inventory` AS inv ON adj.inv_id = inv.id;
