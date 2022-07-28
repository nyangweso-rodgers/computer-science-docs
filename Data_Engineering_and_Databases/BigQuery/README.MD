# Google BigQuery

## Table of Contents
1. [Introduction to BigQuery](#Introdution-to-BigQuery)
2. [BigQuery Pricing](#BigQuery-Pricing)
3. [Arrays in BigQuery](#Arrays-in-BigQuery)
    - [Properties of Arrays](#Properties-of-Arrays)
    - [How Do You Unnest an Array in SQL?](#How-Do-You-Unnest-an-Array-in-SQL?)
4. [BigQuery GIS](#BigQuery-GIS)
    - [ST_GeoPoint](#ST_GeoPoint)
    - [ST_DISTANCE](#ST_DISTANCE)
    - [ST_MaxDistance](#ST_MaxDistance)
    - [ST_Intersection](#ST_Intersection)
    - [ST_Equals](#ST_Equals)

5. [Time Functions](https://cloud.google.com/bigquery/docs/reference/standard-sql/time_functions)
    - [Format Elements](https://cloud.google.com/bigquery/docs/reference/standard-sql/format-elements#format_elements_date_time)
    
6. [References](References)
    - [Connecting BigQuery with Colab](https://colab.research.google.com/notebooks/bigquery.ipynb)
    - [Is BigQuery Expensive?](https://www.quora.com/Is-Googles-BigQuery-expensive)
    - [Getting Started with BigQuery free tier?](https://blog.openbridge.com/unique-offer-powerful-data-warehouse-bigquery-for-free-9e9e98997a28)


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

# Arrays in BigQuery
# Properties of Arrays
* The elements inside each array must all have the same data type. If an array contains all numbers, then we can only store numbers. If it contains strings, then all elements (including numbers) will be treated as strings.
* An array may have zero, one, or more elements inside. An array can be empty.
* The order matters inside an array.
* An array cannot have another array inside. No array-ception this time around.

_Remarks_:
* _With __arrays__, since we do not have to repeat some information, this results in reduced storage costs for __BigQuery__. We can simply ungroup the arrays at the time that we need to access the data for analysis._
* _While __arrays__ are compact and are good for storage, they are not directly usable in many forms of analysis and database operations. For example, if you attempt to order a table using an array column, you will get an error. You are also not allowed to use an array as a JOIN condition._

```sql
    -- Creating a Sample Query with Arrays
        with
        colors as (
                    select 'FFV' as category, ['Bananas', 'Onions', 'Potatoes', 'Tomatoes'] as product_name
                    union all (select 'FMCG' as category, ['Whear Flour', 'Maize Flour'] as product_name)
                    union all (select 'Promotions' as Category, ['Potatoes & Cooking Oil'] as product_name)
                    )
        select category, product_name from colors
```
```sql
    -- generating date arrays
    with
    dates as (SELECT * FROM UNNEST(GENERATE_DATE_ARRAY('2021-01-01', date_add(current_date(), interval 31 day), INTERVAL 1 day)) AS date),
    -- Excludes Sunday
    daily_sales_days as (select * from dates where FORMAT_DATE('%A',date) <> 'Sunday') 
    
    select * from daily_sales_days
 ```
# How Do You Unnest an Array in SQL?
```sql
    with
    products as (
                select 'FFV' as category, ['Bananas', 'Onions', 'Potatoes', 'Tomatoes'] as product_name
                union all (select 'FMCG' as category, ['Whear Flour', 'Maize Flour'] as product_name)
                union all (select 'Promotions' as Category, ['Potatoes & Cooking Oil'] as product_name)
                )

    select category, product_name 
    from products, 
    unnest(product_name) as product_name
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