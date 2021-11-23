with 
sales_orders as (
                        SELECT distinct order_code as sales_order_code, created_date_kenya_from_orders_table
                        FROM `kyosk-prod.sales.views_orders` 
                        where created_date_kenya = '2021-11-08'
                        ),
inventory_ops_item as (
                        SELECT distinct order_code as inventory_order_code, boot_sale, created_date_kenya_from_ops_item_table
                        FROM `kyosk-prod.inventory.views_ops_item` 
                        where order_created_date_kenya = '2021-11-08'
                        )
select ioi.*, so.sales_order_code, so.created_date_kenya_from_orders_table
from inventory_ops_item ioi
left join sales_orders so on ioi.inventory_order_code = so.sales_order_code