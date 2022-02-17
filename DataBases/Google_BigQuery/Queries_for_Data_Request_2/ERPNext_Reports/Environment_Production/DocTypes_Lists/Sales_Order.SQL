select 
    so.transaction_date,
    so.delivery_date,
    so.creation,
    so.modified,
    so.delivery_window_id,
    so.delivery_window_start_time,
    so.delivery_window_end_time,
    so.name,
    so.created_on_app,
    so.kyosk_order_type,
    so.status,
    so.delivery_status,
    so.workflow_state,
    so.customer,
    so.customer_name,
    so.territory,
    so.duka_latitude,
    so.duka_longitude,
    so.total_qty,
    so.total
from `tabSales Order` as so
order by transaction_date desc