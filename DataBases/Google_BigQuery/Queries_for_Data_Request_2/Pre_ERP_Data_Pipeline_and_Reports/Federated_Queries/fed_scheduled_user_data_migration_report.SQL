SELECT
      jhiu.*,
     role_name as user_entity_role_name,
     case
          when role_name = 'ROLE_ADMIN' then 'WMS'
          when role_name = 'ROLE_AGENCYMANAGER' then 'WMS'
          when role_name = 'ROLE_AGENT' then 'WMS'
          when role_name = 'ROLE_DISPATCHASSOCIATE' then 'WMS'
          when role_name = 'ROLE_DISPATCHMANAGER' then 'ERPNext'
          when role_name = 'ROLE_DISPATCHSUPERVISOR' then 'WMS'
          when role_name = 'ROLE_DRIVER' then 'WMS'
          when role_name = 'ROLE_DUKA' then 'WMS'
          when role_name = 'ROLE_FINANCE' then 'ERPNext'
          when role_name = 'ROLE_FINANCEMANAGER' then 'ERPNext'
          when role_name = 'ROLE_FINANCEPAYMENTS' then 'WMS'
          when role_name = 'ROLE_HR' then 'WMS'
          when role_name = 'ROLE_INTERNALCONTROLSMANAGER' then 'WMS'
          when role_name = 'ROLE_INVENTORYACCOUNTANT' then 'ERPNext'
          when role_name = 'ROLE_IT' then 'ERPNext'
          when role_name = 'ROLE_LOSSCONTROLASSOCIATE' then 'WMS'
          when role_name = 'ROLE_LOSSCONTROLMANAGER' then 'ERPNext'
          when role_name = 'ROLE_PRODUCT' then 'ERPNext'
          when role_name = 'ROLE_PURCHASEASSOCIATE' then 'ERPNext'
          when role_name = 'ROLE_PURCHASEMANAGER' then 'ERPNext'
          when role_name = 'ROLE_PURCHASEOFFICER' then 'ERPNext'
          when role_name = 'ROLE_SALESMANAGER' then 'ERPNext'
          when role_name = 'ROLE_SALESSUPERVISOR' then 'WMS'
          when role_name = 'ROLE_STOCKCONTROLLER' then 'ERPNext'
          when role_name = 'ROLE_STOCKVERIFIER' then 'ERPNext'
          when role_name = 'ROLE_USER' then 'WMS'
          when role_name = 'ROLE_WAREHOUSEPERSONEL' then 'WMS'
          when role_name = 'ROLE_WHASSOCIATE' then 'WMS'
          when role_name = 'ROLE_WHMANAGER' then 'ERPNext'
          when role_name = 'ROLE_WHSECURITY' then 'WMS'
          when role_name = 'ROLE_WHSUPERVISOR' then 'WMS'
          else null end as domain

FROM EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/user_conn", 
'''SELECT distinct 
                   login,
                   first_name,
                   last_name,
                   concat(first_name, ' ', last_name) as full_name,
                   email,
                   phone_number,
                   user_status
       FROM jhi_user 
       where user_status = 'ACTIVE' and first_name is not null and last_name is not null and phone_number is not null and email is not null ''') jhiu 

left join (
            SELECT *
FROM EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/user_conn", 
'''SELECT distinct user_login,
                   entity_id,
                   entity_name,
                   case 
                        when user_login = 'rodgers.nyangweso@kyosk.app' then 'ROLE_PRODUCT' 
                        when user_login = 'harun.mwangi@kyosk.app' then 'ROLE_IT'
                        else role_name 
                        end as role_name
                   FROM user_entity_role 
                   where role_name not in ('ROLE_ADMIN') ''')) uer on  jhiu.login = uer.user_login 
where login not in ('alex.mbolonzi@kyosk.app', 'anne.mbugua@kyosk.app') and role_name is not null
--AND role_name in ('ROLE_SALESMANAGER')
--where first_name = 'Rodgers' and last_name = 'Nyangweso'
order by 2,3,4