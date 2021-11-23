SELECT DISTINCT  
    ac.id AS id,
    FORMAT("%'.2f", CAST(avg_unit_cost AS float64)) AS avg_unit_cost,
    FORMAT("%'.2f", CAST(avg_unit_cost_incl AS float64)) AS avg_unit_cost_incl,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", start_time) AS start_time,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(start_time, 'Africa/Nairobi')) AS start_time_kenya,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", end_time) AS end_time,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(end_time, 'Africa/Nairobi')) AS end_time_kenya,
    inv.sku AS inventory_sku,
    UPPER(inv.name) AS inventory_name,
    UPPER(sz.code) AS zone_code,
    UPPER(sz.name) AS zone_name,
    UPPER(avg_setter) AS avg_setter,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", ac.created_date) AS created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(ac.created_date, 'Africa/Nairobi')) AS created_date_kenya,
    UPPER(ac.created_by_name) AS created_by_name,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", ac.last_modified_date) AS last_modified_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(ac.last_modified_date, 'Africa/Nairobi')) AS last_modified_date_kenya,
    UPPER(ac.last_modified_by_name) AS last_modified_by_name
FROM `kyosk-prod.inventory.tbl_avg_cost` ac 
LEFT JOIN `kyosk-prod.inventory.tbl_inventory` inv  ON ac.inv_id = inv.id
LEFT JOIN `kyosk-prod.inventory.tbl_service_zone` sz ON ac.zone_id = sz.id;