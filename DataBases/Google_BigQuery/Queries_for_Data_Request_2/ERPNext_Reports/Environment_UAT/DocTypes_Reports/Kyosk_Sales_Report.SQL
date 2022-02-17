select 
        so.transaction_date,
        so.delivery_date,
        so.delivery_window_id,
        so.delivery_window_start_time,
        so.delivery_window_end_time,
        so.customer,
        so.customer_name,
        so.duka_latitude,
        so.duka_longitude,
        so.territory,
        c.district,
        c.sale_district_code,
        c.route_code,
        c.owner_phone_number,
        so.name,
        so.created_on_app,
        so.docstatus,
        so.workflow_state,
        so.kyosk_order_type,
        so.order_type,
        so.status,
        so.delivery_status,
        
        soi.item_code,
        soi.item_name,
        soi.uom,
        soi.brand,
        soi.fulfilment_status,
        soi.qty,
        soi.price_list_rate,
        soi.base_price_list_rate,
        soi.discount_amount,
        soi.amount,
        soi.base_net_rate
from `tabSales Order` so
left join `tabCustomer` c on so.customer = c.name
left join `tabSales Order Item` soi on so.name = soi.parent

order by 1, 6