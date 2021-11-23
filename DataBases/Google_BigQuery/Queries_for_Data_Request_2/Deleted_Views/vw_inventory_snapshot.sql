SELECT DISTINCT 
    invs.id AS id,
    FORMAT("%'d", opening_stock) as opening_stock, 
    FORMAT("%'d", stock_on_hand) AS stock_on_hand,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", invs.created_date) AS stock_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(invs.created_date, 'Africa/Nairobi')) AS created_date_kenya,
    UPPER( CAST(invs.inter_wh_transit AS STRING) ) AS inter_wh_transit,
    UPPER(inv.sku) AS inventory_sku,
    case when  inv.status is null then "ACTIVE" else UPPER(inv.status) end ,
    UPPER(inv.name) AS inventory_name,
    UPPER(invs.wh_code) AS wh_code,
    UPPER(wh.name) AS warehouse_name,
    UPPER(wh.type) AS warehouse_type,
    UPPER(invs.zone_code) AS zone_code,
    UPPER(sz.name) AS zone_name,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", invs.last_modified_date) AS last_modified_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(invs.last_modified_date, 'Africa/Nairobi')) AS last_modified_date_kenya,
    FORMAT("%'.2f", avg_cost_open.avg_unit_cost) AS opening_average_cost,
    FORMAT("%'.2f", avg_cost_close.avg_unit_cost) AS closing_average_cost,
    FORMAT("%'.2f", avg_cost_open.avg_unit_cost_incl) AS opening_average_cost_incl,
    FORMAT("%'.2f", avg_cost_close.avg_unit_cost_incl) AS closing_average_cost_incl
FROM `kyosk-prod.inventory.tbl_inventory_snapshot` invs
LEFT JOIN `kyosk-prod.inventory.tbl_inventory` inv ON invs.inventory_id = inv.id
LEFT JOIN `kyosk-prod.inventory.tbl_inventory_adjustment` inv_adj_open ON invs.first_mvt_id = inv_adj_open.id
LEFT JOIN `kyosk-prod.inventory.tbl_inventory_adjustment` inv_adj_cl ON invs.last_mvt_id = inv_adj_cl.id
LEFT JOIN `kyosk-prod.inventory.tbl_avg_cost` avg_cost_open ON inv_adj_open.avg_cost_after_mvt_id = avg_cost_open.id
LEFT JOIN `kyosk-prod.inventory.tbl_avg_cost` avg_cost_close ON inv_adj_cl.avg_cost_after_mvt_id = avg_cost_close.id
LEFT JOIN `kyosk-prod.inventory.tbl_warehouse` wh ON invs.wh_code = wh.code
LEFT JOIN `kyosk-prod.inventory.tbl_service_zone` sz ON invs.zone_code = sz.code
