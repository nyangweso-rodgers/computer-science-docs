with
iventory_service_zone as (select * from `kyosk-prod.inventory.views_service_zone`),
inventory_vendor as (select * from `kyosk-prod.inventory.views_vendor`),
inventory_goods_received_note as (select * from `kyosk-prod.inventory.views_goods_received_note`),
inventory_purchase_order as (select * from `kyosk-prod.inventory.views_purchase_order`),

purchase_register as (
                        select igrn.*, 
                        iv.vendor_name,
                        isz.service_zone_name,
                        ipo.unit_cost_without_vat,
                        ipo.unit_cost_with_vat,
                        ipo.total_cost_without_vat,
                        ipo.total_cost_with_vat,
                        ipo.total_vat_amount
                        from inventory_goods_received_note igrn
                        left join inventory_vendor iv on igrn.vendor_code = iv.vendor_code
                        left join iventory_service_zone isz on igrn.zone_code = isz.service_zone_code
                        left join inventory_purchase_order ipo on igrn.lpo_code = ipo.lpo_code and igrn.inv_sku = ipo.inv_sku and igrn.zone_code = ipo.zone_code
                        )
select * from purchase_register