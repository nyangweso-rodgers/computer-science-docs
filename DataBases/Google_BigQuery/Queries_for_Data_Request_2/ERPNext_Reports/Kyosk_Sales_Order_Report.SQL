select 
    so.name, 
    so.transaction_date, 
    so.delivery_date, 
    so.customer, 
    so.kyosk_naming_seed, 
    so.created_on_app, 
    so.duka_latitude, 
    so.duka_longitude, 
    so.kyosk_status, 
    so.kyosk_order_type,
    so.delivery_window_id,
    so.delivery_window_start_time,
    so.delivery_window_end_time,
    c.territory,
    c.district, 
    c.route_code, 
    c.sale_district_code, 
    c.district, 
    c.owner_phone_number,
    soi.item_code,
    soi.customer_item_code, 
    soi.item_name, 
    soi.uom, 
    soi.brand, 
    soi.kyosk_status as item_kyosk_status,
    sum(soi.qty) as qty,
    sum(price_list_rate) as price_list_rate,
    sum(soi.base_price_list_rate) as base_price_list_rate,
    sum(soi.discount_amount) as discount_amount,
    sum(soi.amount) as amount,
    sum(soi.base_net_rate) as base_net_rate
from `tabSales Order` as so
left join `tabCustomer` c on so.customer = c.name
left join `tabSales Order Item` soi on so.name = soi.parent
left join `tabItem Group` ig on 
where so.transaction_date between %(from_date)s and %(to_date)s
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24