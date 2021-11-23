-- created by Rodgers Nyangweso
with
jhi_user as (
              SELECT distinct id,
              created_date, 
              datetime(created_date, 'Africa/Nairobi') as created_date_kenya, 
              last_modified_date,
              datetime(last_modified_date, 'Africa/Nairobi') as last_modified_date_kenya,
              login, 
              first_name, 
              last_name, 
              created_on_app,
              last_updated_on_app,
              created_by,  
              created_by_name,
              last_modified_by, 
              last_modified_by_name,
              phone_number,
              CHAR_LENGTH(phone_number) as phone_number_character_count,
              national_id,
              terms_accepted,
              terms_accepted_date,
              user_status,
              match_status,
              name_update_count
              FROM `kyosk-prod.users.tbl_jhi_user` 
              ),
jhi_user_with_row_index as (
                            select *,
                            row_number()over(partition by id order by last_modified_date desc) as jhi_user_row_index  
                            from jhi_user
                            )
select * from jhi_user_with_row_index  
where jhi_user_row_index = 1 
order by phone_number_character_count desc