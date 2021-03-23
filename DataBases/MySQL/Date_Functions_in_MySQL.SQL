-- Getting Date Trunc Week
select 
distinct date(created_at) as date, 
date_sub(date(created_at), interval dayofweek(date(created_at))-1 day) as week -- gets the date_trunc(date, week) week starts on Sunday
FROM table_name order by 1