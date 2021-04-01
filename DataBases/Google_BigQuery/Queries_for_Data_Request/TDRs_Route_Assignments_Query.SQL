with
    route_mapping
    as
    (
        select distinct route_id, depot_id, region_id, route_name, depot_name, region_name
        from dmslive.cache_route_mapping
    ),
    sales_route_team
    as
    (
        select distinct sale_date, route_id, route_team_id
        from dmslive.sales_route_team
    ),
    sales_route_team_member
    as
    (
        select distinct sale_date, route_team_id, user_id
        from dmslive.sales_route_team_member
    ),
    user_service_user
    as
    (
        select distinct user_id, first_name, last_name, user_number, phone_number, email, primary_role_id
        from dmslive.user_service_user
    ),
    user_service_role
    as
    (
        select distinct role_id, role_name
        from dmslive.user_service_role
        where active = true
    ),

    mashup
    as
    (
        select srt.sale_date, srt.route_id, route_name, depot_name, srtm.user_id, user_number, first_name, last_name, concat(first_name,' ', last_name) as full_name,
            phone_number, primary_role_id, role_name, region_name
        from sales_route_team srt
            left join route_mapping rm on rm.route_id = srt.route_id
            left join sales_route_team_member srtm on srtm.sale_date = srt.sale_date and srtm.route_team_id = srt.route_team_id
            left join user_service_user usu on usu.user_id = srtm.user_id
            left join user_service_role usr on usr.role_id = usu.primary_role_id
    )

#Daily List of number of TDRs
select *
from mashup
where sale_date = '2021-03-31'
    and role_name = 'Trade Development Representative'
    and depot_name in ('Nairobi West')
--and route_name in ('Kaptembwa', 'Langalanga')
order by 3,1
-- Daily count of the number of TDRs
--select sale_date, region_name, count(distinct  user_id) from mashup where primary_role_id = 'e46c97d5-cdd4-4876-8b19-2ec883faf771' group by 1,2 order by 1,2