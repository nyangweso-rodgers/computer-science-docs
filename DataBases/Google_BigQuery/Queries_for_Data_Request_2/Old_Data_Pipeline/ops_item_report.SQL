with
old_data_pipeline as (
                        select oir.*, 
                        -- Added by Rodgers and Evans to add a column for delivery_delay-status( Early, On-Time. Late
                        case 
                            when deliveryDelay > 0 then 'Late'
                            when deliveryDelay = 0 then 'On-Time'
                        else 'Early' end as delivery_delay_status,
                        date(originalDeliveryDate , "Africa/Nairobi") as originalDeliveryDateKenya, 
                        ac.avgUnitCost,
                        ac.avgUnitCostIncl,
                        date(orderCreatedDate , "Africa/Nairobi") as orderCreatedDateKenya,
                        date(completedDate , "Africa/Nairobi") as completedDateKenya,
                        from `inv_prod_reports.ops_item_report` oir 
                        left join `inv_prod_reports.avg_costs` ac on oir.avgCostId = ac.id
                        )
select distinct saleCode, bootSale --completedDateKenya, sum(deliveredCatalogQty * unitSellingPriceIncl) as delivered_catalog_amount
from old_data_pipeline
where status = 'Completed'
and  completedDateKenya = '2021-11-07' 
--group by 1 order by 1 desc