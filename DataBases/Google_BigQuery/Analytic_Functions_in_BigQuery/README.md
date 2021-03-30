# Analytic Functions Concepts in Standard SQL
An __analytic function__ _computes values over a group of rows and returns a single result for each row_. This is different from an __aggregate function__, _which returns a single result for a group of rows_.

__Aggregate__ function syntax
```sql
SELECT unique_id, AVG(Price) FROM `Orders`
-- Each column that is not aggregated has to be present in the GROUP BY clause:
group by unique_id
```

An __analytic function__ includes an __OVER__ clause, which defines a window of rows around the row being evaluated. For each row, the analytic function result is computed using the selected window of rows as input, possibly doing aggregation.

__Analytic__ function syntax
```sql
SELECT AVG(Price) OVER () FROM `Orders`
-- Because grouping is done through the analytic function’s own condition block, the GROUP BY clause is not necessary.
```

With analytic functions you can compute:
* _moving averages_, 
* _rank items_, 
* _calculate cumulative sums_, and 
* _perform other analyses_.

## Clauses
### PARTITION BY
__PARTITION BY__ is arguably the most important clause of an _analytic function_. Similar to the _aggregate function’s_ __GROUP BY__ clause, it limits the number of rows the function computes merely on a subset of all rows. While all non-aggregate columns must be included in a __GROUP BY__ clause, there is no such restriction here.

```sql
with orders as (
    select distinct(depot_name) as depot_name,delivery_date as date, 
    sum(Amount) as revenue 
    from `dmslive.cache_orders` 
    where delivery_date between '2020-10-28' and '2020-10-29'
    group by 1,2
    )

select o.*,
-- Depot Average
avg(revenue) over (partition by depot_name) as depot_AVG,
-- Absolute Deviation from Mean
abs(revenue - avg(revenue) over (partition by depot_name)) as Absolute_deviation_from_mean,
-- Deviation from Mean
(revenue - avg(revenue) over (partition by depot_name)) as deviation_from_mean
from orders o
order by 1,2
```
This query computes the difference between the revenue and the depots average revenue. Since we’re using an analytic function, we can include the depot_name and Date columns in our results without grouping by them.


## ORDER BY
Next, we have the __ORDER BY__ clause. Similar to the ORDER BY at the (near) end of a query, its purpose is to order each partition prior to evaluating the analytic function. While functions such as SUM or AVG do not benefit from an ordered partition, there are certain functions where it is a must.

One such function is __LAG__. This function has one argument (a column name), and its return value is the _value of the column from the previous row_.

## Example1 - Grand Total
```sql
-- This computes a grand total for all items in the finance_deliveries table for the specified delivery date
select depot_name, shops, product_type, sum(actual_revenue) 
over () as total_delivery_amount 
from (
    select distinct(depot_name) as depot_name, 
    product_type, 
    count(distinct Unique_Stalls) as shops, 
    sum(Amount) as actual_revenue 
    from `dmslive.cache_finance_deliveries`
    where delivery_date = '2020-08-28' -- specified delivery date
    group by 1,2
    order by 1,2
    )
```

## Example2 - Subtotal
```sql
-- This computes a subtotal for each product_type in the finance_deliveries table for the specified delivery date
select depot_name, shops, product_type, sum(actual_revenue) 
over (partition by product_type order by depot_name ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as total_delivery_amount 
from (
    select distinct(depot_name) as depot_name, 
    product_type, 
    count(distinct Unique_Stalls) as shops, 
    sum(Amount) as actual_revenue 
    from `dmslive.cache_finance_deliveries`
    where delivery_date = '2020-08-28' -- specified delivery date
    group by 1,2
    order by 1,2
    )
```

## Example3 - Compute a cumulative sum
```sql
-- This computes a cumulative sum for each category in the finance_deliveries table. 
-- The sum is computed with respect to the order defined using the ORDER BY clause

```


## AVG() and SUM()
We’ve all been using aggregate functions such as __SUM__, __AVG__, __MIN__, __MAX__, and __COUNT__ in our __GROUP BY__ clauses. But when these functions are used over an __ORDER BY__ clause they can give us running _sum_, _mean_, _total_, etc.

The following example will make it a lot more clear — we want to calculate the running average revenue and total revenue for each agent in the third quarter:

## References:
1. https://cloud.google.com/bigquery/docs/reference/standard-sql/analytic-function-concepts
2. https://towardsdatascience.com/top-5-sql-analytic-functions-every-data-analyst-needs-to-know-3f32788e4ebb
3. https://medium.com/@aliz_ai/analytic-functions-in-google-bigquery-part-1-basics-745d97958fe2