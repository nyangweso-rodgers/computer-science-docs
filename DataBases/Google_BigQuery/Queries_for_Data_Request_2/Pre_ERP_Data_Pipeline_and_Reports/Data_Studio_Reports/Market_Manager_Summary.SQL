with
ops_item_report as (
                        select 
                        date_trunc(date(order_created_date_kenya ),month) as order_created_date_month,
                        service_zone_name,
                        avg(unit_sale_price_incl) as unit_sale_price_incl,
                        avg(avg_unit_cost) as avg_unit_cost,
                        avg(avg_unit_cost_incl) as avg_unit_cost_incl,
                        sum(delivered_catalog_quantity) as delivered_catalog_quantity,
                        sum(delivered_catalog_amount) as delivered_catalog_amount,
                        sum(total_cost_incl) as total_cost_incl,
                        sum(gross_margin_incl) as gross_margin_incl,
                        sum(gross_margin_incl) / sum(delivered_catalog_amount) as percent_gross_margin
                        from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2` 
                        where status = 'Completed' 
                        group by 1,2
                        )
select * from ops_item_report 
where FORMAT_DATE('%Y%m%d', order_created_date_month) between @DS_START_DATE and @DS_END_DATE 
--where order_created_date_month = '2022-01-01'
order by 4,5,2