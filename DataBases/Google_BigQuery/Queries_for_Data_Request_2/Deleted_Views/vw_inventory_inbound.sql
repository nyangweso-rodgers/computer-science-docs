SELECT 
    UPPER(grn.code) AS grn_code,
    UPPER(grn.invoice_no) AS invoice_no,
    UPPER(ven.name) AS vendor_name,
    UPPER(wh.code) AS warehouse_code,
    FORMAT("%'d", CAST(JSON_VALUE(jt, '$.invoiceAccounting.qty') AS int64)) AS inv_qty,
    UPPER(JSON_VALUE(jt, '$.inv.name')) AS inv_name,
    UPPER(JSON_VALUE(jt, '$.inv.sku')) AS inv_sku,
    UPPER(JSON_VALUE(jt, '$.invoiceAccounting.packaging')) AS stocking_unit,
    UPPER(grn.lpo_code) AS lpo_code,
    UPPER(grn.status) AS grn_status,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", grn.created_date) AS created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(grn.created_date, 'Africa/Nairobi')) AS created_date_kenya,
    UPPER(grn.created_by) AS created_by,
    UPPER(grn.created_by_name) AS created_by_name
FROM `kyosk-prod.inventory.tbl_goods_received_note` grn
LEFT JOIN UNNEST(JSON_QUERY_ARRAY(grn_items, '$')) AS jt
LEFT JOIN `kyosk-prod.inventory.tbl_vendor` ven ON grn.vendor_code = ven.code
LEFT JOIN `kyosk-prod.inventory.tbl_warehouse` wh ON grn.zone_code = wh.zone_code
LEFT JOIN `kyosk-prod.inventory.tbl_purchase_order` po ON grn.lpo_code = po.code
WHERE wh.type = 'MainWH'
ORDER BY po.created_date;