with
inventory_purchase_order as (
                             SELECT distinct id,
                             created_date,
                             datetime(created_date, 'Africa/Nairobi') as created_date_kenya,
                             last_modified_date,
                             created_by,
                             created_by_name,
                             last_modified_by,
                             last_modified_by_name,
                             code as lpo_code,
                             pr_code,
                             status,
                             zone_code,
                             vendor_id,
                             --vendor_code,
                             -- expiry_date,
                             --lpo_items,
                             JSON_EXTRACT_SCALAR(i, '$.inv.sku') as inv_sku,
                             JSON_EXTRACT_SCALAR(i, '$.inv.name') as inv_name,
                             JSON_EXTRACT_SCALAR(i, '$.inv.stockingUnit') as stocking_unit,
                             JSON_EXTRACT_SCALAR(i, '$.inv.procurementUnit') as procuremrnt_unit,
                             JSON_EXTRACT_SCALAR(i, '$.vendorCatalogCode') as vendor_catalog_code,
                             JSON_EXTRACT_SCALAR(i, '$.vendorTariffId') as vendor_tariff_id,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.qty') as float64) as requested_accounting_qty,
                             JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.packaging') as requested_accounting_packaging,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.unitCostWithoutVat') as float64) as unit_cost_without_vat,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.totalCostWithoutVat') as float64) as total_cost_without_vat,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.vat.rate') as float64) as vat_rate,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.unitCostWithVat') as float64) as unit_cost_with_vat,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.totalCostWithVat') as float64) as total_cost_with_vat,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.totalVatAmount') as float64) as total_vat_amount,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.discountRate') as float64) as discount_rate,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.unitDiscountAmount') as float64) as unit_discount_amount,
                             cast(JSON_EXTRACT_SCALAR(i, '$.requestedAccounting.totalDiscountAmount') as float64) as total_discount_amount,
                             cast(JSON_EXTRACT_SCALAR(i, '$.receivedQuantity') as float64) as received_qty
                             FROM `kyosk-prod.inventory.tbl_purchase_order`
                             left join unnest(json_extract_array(lpo_items)) as i 
                             ),
inventory_purchase_order_with_index as (
                                          select *, 
                                          row_number()over(partition by id, inv_sku order by last_modified_date desc) as purchase_order_index  
                                          from inventory_purchase_order
                                          )

select *  from inventory_purchase_order_with_index 
where purchase_order_index = 1
--and pr_code = 'PR-EMBU-NPDT'
--and lpo_code = 'LPO-1-KAWA-OOWJ'