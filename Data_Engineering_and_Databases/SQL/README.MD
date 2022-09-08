# SQL

## Table of Contents
- [Overview of SQL](#Overview-of-SQL)
- [Concepts in SQL](#Concepts-in-SQL)
- [SQL Query Execution Order](#SQL-Query-Execution-Order)

# Overview of SQL
__SQL__ is used to access and manipulate a database. __SQL__ can:
   * insert, update, or delete records in a database
   * create new databases, tables, stored procedures views
   * retrieve data from a database, e.t.c.

# Concepts in SQL
1. __SQL Views__: In SQL, a __view__ is a _virtual table based on the result-set of an SQL statement_. A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

# SQL Query Execution Order
1. __FROM & JOIN__: The DB looks at the tables we specified in FROM and in the JOINs, and then merges this data - this merged data is our starting "working set".
2. __WHERE__: Perhaps we don't want the whole merged working set - perhaps we want to filter this data, so this means we end up with a subset of our working set - we've retained some rows and discarded other rows.
3. __GROUP BY__: Time to make some buckets! When we're grouping data, we're creating buckets (groups). Each bucket has a key and the associated rows. These buckets help us perform aggregations.
4. __HAVING__: Perhaps we don't want all our buckets. This is where we can specify some conditions, so that we choose just some buckets, and discard others. (This is similar to the WHERE clause - in WHERE, we are filtering rows, whereas in HAVING we are filtering buckets).
5. __SELECT__: We can select column names as well as aggregations. That's it, we now have the resulting data set.
6. __ORDER BY__: Perhaps we want to order the data set - sorting data in ascending or descending order based on columns. Here, the data set remains the same, we're just changing the ordering of the rows.
7. __LIMIT & OFFSET__: Perhaps due to pagination, we want to limit the data returned, so we're returning just a subset of the rows above.