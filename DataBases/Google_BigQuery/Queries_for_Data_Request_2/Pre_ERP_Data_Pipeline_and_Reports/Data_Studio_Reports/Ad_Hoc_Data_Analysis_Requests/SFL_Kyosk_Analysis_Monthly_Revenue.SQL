with
old_data_pipeline as (
                        select oir.serviceZoneName, 
                        date(completedDate , "Africa/Nairobi") as completedDateKenya,
                        deliveredCatalogQty * unitSellingPriceIncl as delivered_catalog_amount
                        from `inv_prod_reports.ops_item_report` oir 
                        where status = 'Completed'
                        ),
monthly_revenue_with_index as (
                                select *, 
                                lag(delivered_catalog_amount) over(partition by serviceZoneName order by month asc) as lag_delivered_catalog_amount,
                                row_number()over(partition by serviceZoneName order by month) as index,
                                sum(delivered_catalog_amount) over(partition by serviceZoneName order by month asc ) as running_total_per_service_zone,
                                from
                                (
                                select date_trunc(completedDateKenya, month) as month, 
                                serviceZoneName, 
                                sum(delivered_catalog_amount) as delivered_catalog_amount
                                from old_data_pipeline 
                                
                                group by 1,2 
                                )) 
select *,  coalesce(delivered_catalog_amount / lag_delivered_catalog_amount, 0) as percent_revenue_growth,
from monthly_revenue_with_index
where FORMAT_DATE('%Y%m%d', month) between @DS_START_DATE and @DS_END_DATE  
order by 2,1