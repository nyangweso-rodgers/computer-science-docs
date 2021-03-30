## Working with Dates in BigQuery - Standard SQL

## Generating Date Arrays
```sql
 with
 dates as (SELECT * FROM UNNEST(GENERATE_DATE_ARRAY('2021-01-01', date_add(current_date(), interval 31 day), INTERVAL 1 day)) AS date),
 -- Excludes Sunday
 daily_sales_days as (select * from dates where FORMAT_DATE('%A',date) <> 'Sunday') 
 
 select * from daily_sales_days
 ```

## Using EXTRACT
Returns the value corresponding to the specified date part.
```sql
 with
 dates as (SELECT * FROM UNNEST(GENERATE_DATE_ARRAY('2021-01-01', date_add(current_date(), interval 31 day), INTERVAL 1 day)) AS date),
 date_parts as (
                select d.*, 
                extract(year from date) as year , -- Extract Year
                extract(month from date) as month , -- Extract Month
                extract(day from date) as day, -- Extract Day
                EXTRACT(WEEK(SUNDAY) FROM date) AS week, -- Extract week number -- Week starts on sunday
                extract(quarter from date) as quarter, -- Extract Quarter
                extract(dayofweek from date) as day_of_week -- Day of Week
                from dates d
                )
select * from date_parts
```

## DATE_ADD(), DATE_SUB(), DATE_DIFF() & LAST_DAY
```sql
with 
dates as (select * from UNNEST(GENERATE_DATE_ARRAY('2021-01-01', date_add(current_date(), interval 31 day), interval 1 day)) as date),
date_variables as (
                  select date as current_date, 
                  date_sub(date, interval 1 day) as previous_day,  -- Getting Previous Dates from the current date
                  date_add(date, interval 1 day) as next_day,  -- Getting Subsequent Dates from the current date
                  date_diff(date_add(date, interval 1 day), date_sub(date, interval 1 day),   day) as days_diff_between_next_and_previous_day,
                  last_day(date, month) as last_day_of_the_month, -- Last Day of the Month 
                  last_day(date, year) as last_day_of_the_year, -- Last Day of the Year
                  last_day(date, week(SUNDAY)) as last_day_of_the_week_sunday, -- Last Day of the week for a week starting on a Sunday
                  last_day(date, week(MONDAY)) as last_day_of_the_week_monday-- Last Day of the week for a week starting on a Sunday
                  from dates
                  )

select * from date_variables
```



_Reference_: 
1. https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions