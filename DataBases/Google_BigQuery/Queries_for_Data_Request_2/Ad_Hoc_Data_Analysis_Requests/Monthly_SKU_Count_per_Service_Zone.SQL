with
ops_item_report as (
                      select oir.*, 
                      -- Added by Rodgers and Evans to add a column for delivery_delay-status( Early, On-Time. Late
                      case when deliveryDelay > 0 then 'Late'
                      when deliveryDelay = 0 then 'On-Time'
                      else 'Early' end as delivery_delay_status,
                      date(originalDeliveryDate , "Africa/Nairobi") as originalDeliveryDateKenya, 
                      ac.avgUnitCost,
                      ac.avgUnitCostIncl,
                      date(orderCreatedDate , "Africa/Nairobi") as orderCreatedDateKenya,
                      date(completedDate , "Africa/Nairobi") as completedDateKenya,
                      from `inv_prod_reports.ops_item_report` oir 
                      left join `inv_prod_reports.avg_costs` ac on oir.avgCostId = ac.id
                      where status = 'Completed'
                      and date(completedDate , "Africa/Nairobi") >= '2021-11-01'
                      )
select date_trunc(completedDateKenya, month) as month, serviceZoneName, count(distinct catalogSKU) as unique_sku_count
from ops_item_report group by 1,2 order by 3 desc