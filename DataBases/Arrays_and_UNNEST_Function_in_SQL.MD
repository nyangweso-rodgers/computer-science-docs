# Using UNNEST Function and working with Arrays
__Objective:__ _we explain how arrays work, and how we can use the __UNNEST__ function to flatten arrays. After processing data in these arrays, we can then treat them like normal table records._

Like integers, numbers, and dates, an __array__ is a data type in BigQuery. 
### properties of Arrays
* The elements inside each array must all have the same data type. If an array contains all numbers, then we can only store numbers. If it contains strings, then all elements (including numbers) will be treated as strings.
* An array may have zero, one, or more elements inside. An array can be empty.
* The order matters inside an array.
* An array cannot have another array inside. No array-ception this time around.


### Creating a Sample Query with Arrays
```sql
with
colors as (
            select 'FFV' as category, ['Bananas', 'Onions', 'Potatoes', 'Tomatoes'] as product_name
            union all (select 'FMCG' as category, ['Whear Flour', 'Maize Flour'] as product_name)
            union all (select 'Promotions' as Category, ['Potatoes & Cooking Oil'] as product_name)
            )

select category, product_name from colors
```
We have two columns: __category__ and __product_name__. The first column is just a normal string, but the second column is an array of strings, containing the colors.

### Reduced Storage with Arrays
With arrays, since we do not have to repeat some information, this results in _reduced storage costs_ for BigQuery. We can simply ungroup the arrays at the time that we need to access the data for analysis.

### What is UNNEST in BigQuery?
While arrays are compact and are good for storage, they are not directly usable in many forms of analysis and database operations. For example, if you attempt to order a table using an array column, you will get an error. You are also not allowed to use an array as a JOIN condition.

### How Do You Unnest an Array in SQL?
We need to use the BigQuery __UNNEST__ function to flatten an array into its components. The following is a syntax to use this function:
```sql
SELECT 
  column(s),
  new_column_name
FROM 
  table_name,
  UNNEST(array_column_name) AS new_column_name
```
#### Example
```sql
with
colors as (
            select 'FFV' as category, ['Bananas', 'Onions', 'Potatoes', 'Tomatoes'] as product_name
            union all (select 'FMCG' as category, ['Whear Flour', 'Maize Flour'] as product_name)
            union all (select 'Promotions' as Category, ['Potatoes & Cooking Oil'] as product_name)
            )

select category, product_name 
from colors, 
unnest(product_name) as product_name
```
_Functions such as sorting and joining on the new column is now possible after using the UNNEST._


## _References_
1. _https://www.yuichiotsuka.com/google-bigquery-unnest-arrays/_