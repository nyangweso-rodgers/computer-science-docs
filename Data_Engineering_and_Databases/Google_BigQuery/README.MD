# Google BigQuery

## Table of Contents
- [Introduction to BigQuery](#Introdution-to-BigQuery)
- [BigQuery Pricing](#BigQuery-Pricing)
- [Generating Date Arrays](#Generating-Date-Arrays)
- [Using EXTRACT](#Using-EXTRACT)
- [References](References)


# Introdution to BigQuery
__BigQuery__ is a serverless data analytics platform i.e., it automatically allocates  resources based on demand.
# BigQuery Pricing
1. __Analysis pricing__ is the cost to _process queries_, including SQL queries, user-defined functions, scripts, and certain data manipulation language (DML) and data definition language (DDL) statements that scan tables.
    - __On-demand pricing__. With this pricing model, you are charged for the number of bytes processed by each query. The first 1 TB of query data processed per month is free.
    - __Flat-rate pricing__. With this pricing model, you purchase slots, which are virtual CPUs. When you buy slots, you are buying dedicated processing capacity that you can use to run queries. Slots are available in the following commitment plans:
        - Flex slots: You commit to an initial 60 seconds.
        - Monthly: You commit to an initial 30 days.
        - Annual: You commit to 365 days.

     With monthly and annual plans, you receive a lower price in exchange for a longer-term capacity commitment.
2. __Storage pricing__ is the cost to store data that you load into BigQuery. You pay for _active storage_ and _long-term storage_.
    - __Active storage__ includes any table or table partition that has been modified in the last 90 days.
    - __Long-term storage__ includes any table or table partition that has not been modified for 90 consecutive days. The price of storage for that table automatically drops by approximately 50%. There is no difference in performance, durability, or availability between active and long-term storage.
# Generating Date Arrays
```sql
    with
    dates as (SELECT * FROM UNNEST(GENERATE_DATE_ARRAY('2021-01-01', date_add(current_date(), interval 31 day), INTERVAL 1 day)) AS date),
    -- Excludes Sunday
    daily_sales_days as (select * from dates where FORMAT_DATE('%A',date) <> 'Sunday') 
    
    select * from daily_sales_days
 ```

# Using EXTRACT
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
# DATE_ADD(), DATE_SUB(), DATE_DIFF() & LAST_DAY
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
                  last_day(date, week(MONDAY)) as last_day_of_the_week_monday-- Last Day of the week for a week starting on a Monday
                  from dates
                  )

select * from date_variables
```

# References
1. [BigQuery Pricing](https://cloud.google.com/bigquery/pricing)
2. [BigQuery - Date Functions](https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions)