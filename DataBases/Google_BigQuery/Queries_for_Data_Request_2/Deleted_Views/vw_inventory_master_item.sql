SELECT 
	DISTINCT UPPER((i.sku)) as sku_code,
    UPPER(i.name) as name, 
	JSON_VALUE(dimensions, '$.length') as length,
	JSON_VALUE(dimensions, '$.width') as width,
	JSON_VALUE(dimensions, '$.height') as height,
	procurement_unit as packaging,
    concat('1:', pu_to_su_ratio) as units_per_case, 
	ac.avg_unit_cost as value_per_unit, 
 	'Yes' as fifo_required,
	FORMAT_DATE("%Y-%m-%d %H:%M:%S", i.created_date) as created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(i.created_date, 'Africa/Nairobi')) AS created_date_kenya 
FROM `kyosk-prod.inventory.tbl_inventory` i INNER JOIN 
	(
		SELECT MAX(avg_unit_cost) avg_unit_cost, inv_id 
		FROM `kyosk-prod.inventory.tbl_avg_cost` GROUP BY inv_id
	) ac on ac.inv_id = i.id 
ORDER BY sku_code, created_date DESC;