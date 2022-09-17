# SQL

## Table of Contents
- [Overview of SQL](#Overview-of-SQL)
- [SQL Query Execution Order](#SQL-Query-Execution-Order)
- [Concepts in SQL](#Concepts-in-SQL)
   - SQL Views
   - Store Procedure vs Functions
   - Indexing



# Overview of SQL
__SQL__ is used to access and manipulate a database. __SQL__ can:
   * insert, update, or delete records in a database
   * create new databases, tables, stored procedures views
   * retrieve data from a database, e.t.c.



# SQL Query Execution Order
1. __FROM & JOIN__: The DB looks at the tables we specified in FROM and in the JOINs, and then merges this data - this merged data is our starting "working set".
2. __WHERE__: Perhaps we don't want the whole merged working set - perhaps we want to filter this data, so this means we end up with a subset of our working set - we've retained some rows and discarded other rows.
3. __GROUP BY__: Time to make some buckets! When we're grouping data, we're creating buckets (groups). Each bucket has a key and the associated rows. These buckets help us perform aggregations.
4. __HAVING__: Perhaps we don't want all our buckets. This is where we can specify some conditions, so that we choose just some buckets, and discard others. (This is similar to the WHERE clause - in WHERE, we are filtering rows, whereas in HAVING we are filtering buckets).
5. __SELECT__: We can select column names as well as aggregations. That's it, we now have the resulting data set.
6. __ORDER BY__: Perhaps we want to order the data set - sorting data in ascending or descending order based on columns. Here, the data set remains the same, we're just changing the ordering of the rows.
7. __LIMIT & OFFSET__: Perhaps due to pagination, we want to limit the data returned, so we're returning just a subset of the rows above.
# Concepts in SQL
1. __SQL Views__: In SQL, a __view__ is a _virtual table based on the result-set of an SQL statement_. A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

2. __Store Procedure vs Functions__
   * __Store Procedure__ is a group of SQL statements stored on the DB side, to perform some action (business logic) or perform any DB-related task. SP may or may not return output and may or may not take arguments, they are optional.
   ```sql
      -- MySQL
      DELIMITER $$
      CREATE PROCEDURE `GetEmp`()
      BEGIN
         SELECT * FROM EMPLOYEE_TABLE;
      END$$
      DELIMITER;
   ```
   _Remark_:
   * we've created a store procedure with the name "GetEmp" which is simply querying an EMPLOYEE_TABLE and fetching all employees. Between BEGIN and END, we've got the body where we write all SQL statements & business logic.
   * In order to call the above procedure, we use the "CALL" keyword.

   ```sql
      CALL GetEmp
   ```
   * __Functions__ optionally take arguments, performs some calculations or operations and returns the computed value. Functions always return some value.

   
3. __Indexing__: It is a technique, using which we can improve search performance in our database. Helps in quickly searching the records in the table. When we search any record in DB, it goes to the index and finds the exact location of the record and skips the unnecessary records in between and quickly gives us the results.

   Different DB vendors have introduced their own types of __Index__. Many DB has even more than one type of Index. But more or less their purpose is the same. The query syntax to define the index may also vary based on the DB vendor.

   ```sql
      -- PostgreSQL - defining an index
      CREATE INDEX IDX_STUDENT_ROLL_NO
      ON STUDENT(ROLL_NO);
      -- Table = STUDENT
      -- Column = ROLL_NO
   ```
   _Remarks_;
      - _When to use Indexing?_: Always remember Indexing should be only applied to the column which is frequently being used in the where clause. 
      - Indexing works great on columns which contain numeric data.
      - Indexing on primary key columns is not required because most modern databases implicitly apply indexing to them.
      - _When Not to Use Indexing?_: If DB has fewer records no need to use indexing. it will overkill the purpose of Indexing. Try to avoid Indexing on a column containing long text-based data, in such case Indexing will be quite poor.
      - Don't apply it on every column, otherwise, this will degrade the write and update operation on DB. As every write and update operation also updates the Index.