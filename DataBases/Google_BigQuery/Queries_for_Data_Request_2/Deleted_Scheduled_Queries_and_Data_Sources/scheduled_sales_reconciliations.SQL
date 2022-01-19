-- Created by Rodgers Nyangweso
with
inventory_ops_item as (
                        SELECT distinct  
                        sale_code, 
                        date(completed_date_kenya) as completed_date_kenya,
                        sum(delivered_catalog_amount) as delivered_catalog_amount
                        FROM `kyosk-prod.inventory.views_ops_item_report_v2` 
                        where status = 'Completed'
                        group by 1,2
                        ),
inventory_sales as (
                      select distinct sale_code,
                      service_zone_name,
                      kyosk_code,
                      kyosk_name,
                      drs_code,
                      invoice_status,
                      payments,
                      sum(mpesa_amount) as mpesa_amount,
                      max(total_delivered_amount_with_vat) as total_delivered_amount_with_vat,
                      max(total_orginal_amount_with_vat) as total_orginal_amount_with_vat,
                      max(original_vat_amount) as original_vat_amount,
                      max(delivered_vat_amount) as delivered_vat_amount,
                      string_agg(distinct mpesa_ref,"/" order by mpesa_ref) as mpesa_ref,
                      count(distinct mpesa_ref) as mpesa_ref_count
                      FROM `kyosk-prod.inventory.views_sales` 
                      group by 1,2,3,4,5,6,7
                      ),

sales_ops_item_mashup as (
                            select *, row_number()over(partition by sale_code order by mpesa_ref) as mpesa_ref_index
                            from
                            (
                            select ioi.*, 
                            s.*except(sale_code),
                            mpesa_amount - total_delivered_amount_with_vat as variance_mpesa_and_delivery_amount
                            from inventory_ops_item ioi
                            left join inventory_sales s on ioi.sale_code = s.sale_code
                            )
                            )
select * from sales_ops_item_mashup where sale_code = 'SQHSTXU'