-- created by Rodgers Nyangweso
with
delivery_window_summary as (
                            select *,
                            coalesce(safe_divide(morning_window_ordered_amount , total_ordered_amount),0) as percent_morning_window_ordered_amount,
                            coalesce(safe_divide(afternoon_window_ordered_amount ,  total_ordered_amount),0) as percent_afternoon_window_ordered_amount
                            from
                            (
                            SELECT distinct original_delivery_date_kenya, 
                            service_zone_name, 
                            agent_name,
                            status,
                            sum(ordered_catalog_amount) as total_ordered_amount,
                            coalesce(sum(case when delivery_window_status = 'Morning Window' then ordered_catalog_amount else null end),0) as morning_window_ordered_amount,
                            coalesce(sum(case when delivery_window_status = 'Afternoon Window' then ordered_catalog_amount else null end),0) as afternoon_window_ordered_amount,
                            FROM `kyosk-prod.inventory.views_ops_item_report_v2` 
                            group by 1,2,3,4
                            )
                            )
select * from delivery_window_summary order by 1 desc