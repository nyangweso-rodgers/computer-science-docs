with dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2020-01-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
vars AS (
 --SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date,  case when FORMAT_DATE('%A',PARSE_DATE('%Y%m%d', @DS_END_DATE) ) = 'Sunday'  then date_sub(PARSE_DATE('%Y%m%d', @DS_END_DATE), interval 1 day) else PARSE_DATE('%Y%m%d', @DS_END_DATE) end  as current_end_date ),
 SELECT DATE '2021-05-01' as current_start_date, case when FORMAT_DATE('%A',DATE '2021-05-01' ) = 'Sunday'  then date_sub(DATE '2021-05-01', interval 1 day) else DATE '2021-05-01' end  as current_end_date ),

number_of_sundays as (select count(*) as sundays from dates, vars where date between current_start_date and current_end_date and FORMAT_DATE('%A',date) = 'Sunday'),
date_vars as (  
              select *,
              case when current_start_date = date_trunc(current_start_date, month) and last_day(current_end_date) = current_end_date
                          then date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) )month)
                   when sundays >= 1
                          then date_add(date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) )  + sundays day), interval sundays -1 day)
                   when FORMAT_DATE('%A', date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) + 1)day)) = 'Sunday'
                          then date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) + 2)day)
                   when no_of_days < 3
                          then date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) + 1)day)
               else date_sub(current_start_date, interval (date_diff(current_end_date, current_start_date, day) + 2)day)
               end as previous_start_date,

                from
                (select *,
                date_sub(date_trunc(current_end_date,month), interval 1 month) as last_month,
                date_trunc(current_start_date,month) as current_month,
                date_sub(current_start_date, interval 1 day) as previous_end_date,
                date_diff(current_end_date, current_start_date, day) as no_of_days
                from vars, number_of_sundays)
                )
              
select * from date_vars