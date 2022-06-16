# Google BigQuery

## Table of Contents
1. [Introduction to BigQuery](#Introdution-to-BigQuery)
2. [BigQuery Pricing](#BigQuery-Pricing)
3. [Generating Date Arrays](#Generating-Date-Arrays)
4. [Using EXTRACT](#Using-EXTRACT)
5. [BigQuery GIS](#BigQuery-GIS)
    - [ST_GeoPoint](#ST_GeoPoint)
    - [ST_DISTANCE](#ST_DISTANCE)
    - [ST_MaxDistance](#ST_MaxDistance)
    - [ST_Intersection](#ST_Intersection)
    - [ST_Equals](#ST_Equals)
6. [References](References)
    - [Connecting BigQuery with Colab](https://colab.research.google.com/notebooks/bigquery.ipynb)


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
# BigQuery GIS
__Geospatial Analytics__ highlights historical changes and current shifts by collecting, displaying, and manipulating __Imagery__ and __Geographic Information System__ (GIS) Data related to a specific location. Each geography function begins with a signature ST_. These functions help create BigQuery GEOGRAPHY values. 5 Key BigQuery GIS Functions are:
* ST_GeoPoint
* ST_Distance
* ST_MaxDistance
* ST_Intersection
* ST_Equals

# ST_GeoPoint
__ST_GEOGPOINT__ function requires a single point to create __GEOGRAPHY__. This function uses a specific __FLOAT64__ longitude and latitude parameter to create the point and later returns it as a __GEOGRAPHY__ value.
```SQL
    select ST_GEOGPOINT(300, 20) as point_A, ST_GEOGPOINT(200, 30) as point_B -- Output: POINT(-60 20) POINT(-160 30)
```
_Remarks_:
* __Syntax__: ST_GeoPoint(longitude, latitude)
* __Return Type__: GEOGRAPHY
* Any latitude exceeding the range [-90, 90] will result in an error.
* It allows any longitude value ranging outside [-180, 180]. To obtain value within this range, the function uses the input longitude modulo 360

# ST_DISTANCE
Returns the _minimum distance covered in meters_ by the two non-empty __GEOGRAPHYs__. ST_DISTANCE returns NULL if any of the two input GEOGRAPHYs are empty. To analyze how the function measures the distance, you must use the use_spheroid parameter. Its default value is FALSE, which implies the distance is measured on a perfect sphere surface
_Remarks_:
* __Syntax__: ST_DISTANCE(geography_1, geography_2[, use_spheroid])
* __Return type__: FLOAT64
```SQL
    select 
    ST_GEOGPOINT(300, 20) as point_A,
    ST_GEOGPOINT(200, 30) as point_B,
    ST_DISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as distance_in_metres
    -- Output: point_A: POINT(-60 20), point_B: POINT(-160 30) distance_in_metres: 9818340.4056120031
```
# ST_MaxDistance
returns the _maximum distance covered in meters by the two non-empty GEOGRAPHYs_. __ST_MaxDistance__ function returns the distance covered between the two most distant vertices if both the GEOGRAPHY values (geography_1 and geography_2) are the same. However, the function returns NULL if any of the two input GEOGRAPHYs are empty. To analyze how the function measures the distance, you must use the use_spheroid parameter. Its default value is FALSE, which implies the distance is measured on a perfect sphere surface.
_Remarks_:
* __Syntax__:  ST_MAXDISTANCE(geography_1, geography_2[, use_spheroid])
* __Return type__: FLOAT64
```SQL
    select 
  ST_GEOGPOINT(300, 20) as point_A,
  ST_GEOGPOINT(200, 30) as point_B,
  ST_DISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as minimum_distance_in_metres,
  ST_MAXDISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as maximum_distance_in_metres
```
# ST_Intersection
Each point in the intersection appears in both input GEOGRAPHYs, as a result, it returns a GEOGRAPHY. If no point appears in both input GEOGRAPHYs (geometry_1 and geometry_2), then the function returns an empty GEOGRAPHY
_Remarks_:
* __Syntax__:  ST_INTERSECTION(geography_1, geography_2)
* __Return type__: GEOGRAPHY
```SQL
    select 
  ST_GEOGPOINT(300, 20) as point_A,
  ST_GEOGPOINT(200, 30) as point_B,
  ST_DISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as minimum_distance_in_metres,
  ST_MAXDISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as maximum_distance_in_metres,
  ST_INTERSECTION(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as point_of_intersection
```
# ST_Equals
_Remarks_:
* __Syntax__:  ST_EQUALS(geography_1, geography_2)
* If both the input GEOGRAPHYs (geometry_1 and geometry_2) show the same value, the ST_Equals function returns TRUE.
* __Return type__: BOOL
```SQL
    select 
  ST_GEOGPOINT(300, 20) as point_A,
  ST_GEOGPOINT(200, 30) as point_B,
  ST_DISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as minimum_distance_in_metres,
  ST_MAXDISTANCE(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as maximum_distance_in_metres,
  ST_INTERSECTION(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as point_of_intersection,
  ST_Equals(ST_GEOGPOINT(300, 20), ST_GEOGPOINT(200, 30)) as equality
```

# References
1. [BigQuery Pricing](https://cloud.google.com/bigquery/pricing)
2. [BigQuery - Date Functions](https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions)
3. [Working with BigQuery GIS](https://hevodata.com/learn/bigquery-gis/)