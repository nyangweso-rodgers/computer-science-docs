# Databases
## Definitions
1. __Data Tier__: part of a web application that is responsible for performing your data operations. i.e., _Create_, _Read_, _Update_ and _Delete_ (CRUD).
## WHY DO WE NEED DATABASES? 
it must _grow_, _change over time_, _shared fast_, _searchble_, _reliable_, _interdependent_, _consistent_, _protected_ and _secure_.

2. __Database__: application that allow one to store and access data. _a database is a collection of data that is organized in a manner that facilitates ease of access, as well as efficient management and tracking._. a database is made up of tables that store relevant information.

3. __Database Tables__ : a table stores and displays data in a structtured format consisting of columns and rows. web applications use them to provide dynamic functions to users e.g., displaying products, content management, and user management.

4. __primary keys__: a primary key is a field in the table that uniquely identifies the table records.
### the primary key's main features:
* it must contain a unique value for each row
* it cannot contain NULL values

5. __Database Management System__ (DBMS) : software to create, define and manage database. e.g., _Microsoft_, _Oracle_, _IBM_, _Apache_, _SQLServer_, _DB2_, _Cassandra_, _Firebind, _MongoDB_, _FileMaker_,  _MySQL_, _PostgreSQL_ .

## Different databases are available. generally, they are divided into:
1. Relational databases
A common type of database is a __Relational Database Management System__ (RDMS) in which data is stored according to the relationship it has to other data. In many implementations, an RDMS consists of storing data in different tables and building relationships between rows in the table. Data that is stored in an RDMS is available for querying by using a language called __Structured Query Language__ (SQL). Most Relationsl databases support SQL that conforms to the __American Natioanl Standards Institute__ (ANSI) standards. However, different database implementations offer different features and not all of them support the full range of ANSI SQL equally. This issue makes writing SQL that can be used equally in many different databases difficult.
2. NoSQL databases

## The Marketpalce of Database Solutions
Relational 	| Non - Relational
----------|--------------
1. Oracle DB|1. MongoDB
2. Microsoft SQL Server |2. Redis
3. IBM DB2| 3. Cassandra
4. PostgreSQL|4. Noo4J
5. MySQL| 5.



## Structured Query Language (SQL)
__SQL__ is used to access and manipulate a database. __MySQL__ is a program that understands  SQL. __SQL__ can:
1. insert, update, or delete records in a database
2. create new databases, tables, stored procedures views
3. retrieve data from a database, e.t.c.


__REMARK__: SQL is an __ANSI__ (American National Standards Institute) standard, but there are different versions of SQL langauge. Most SQL database programs have their own proritory extensions in addition to the SQL standard, but all of them support the major commands.

Databases that uses SQL:
1. SQLServer
2. MySQL - this is an open source
3. Oracle
4. Postgre SQL
5. SQLite
6. DB2
7. BigData							
### Tools to write SQL:
1. SQL Server Management Studio (SSMS)
2. SQL Developer
3. SQL Workbench
4. TOAD
# SQL Views
In SQL, a __view__ is a _virtual table based on the result-set of an SQL statement_. A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

# SQL vs NoSQL Databases
There are two major types of databases available: SQL. and NoSQL. They differ in the way they how they store and process data.

__SQL__ - Structured Query Language are languages for defining and inserting, deleting, and updating data in relational databases such as MySQL, Oracle, Postgres, etc. It is very helpful in handling structured data. __NoSQL__ databases are non-relational databases that provide a way of storing and retrieving data in means other than tabular format orvides by relational databases. It is very helpful in handling unstructured data.

# Difference between SQL and NoSQL
1. __Type__: SQL databases are primarily Relational Databases. NoSQL databases are distributed or non-relational databases.
2. __Storage__: In SQL databases, the data is stored in a tabular format, and the data is organized in a row-column format and each row is unique. NoSQL databases don't follow a table-based data storage model. Instead, they have a very flexible schema. The data can be stored in key-value, document, graph, and wide column format.
3. __Schema__: SQL  databases have a fixed predetermined schema to determine the structure of your data before you work with it. Every time data is inserted it should  follow the predefined schema. The structure of the schema can be altered but it is difficult and also the entire database suffers downtime. __NoSQL__ schema has a very dynamic schema for storing unstructured data. It means additional columns can be added anytime and every row doesn't have to follow the same structure.
4. __Querying Language__: SQL databases use __Standard Query Language__ for defining and manipulating the data. The __NoSQL__ databases don't have any fixed schema for storing data hence they use __Unstructured Query Language__(UnQL). Unlike SQL, different databases have different syntax for UnQL.
5. __Property__: SQL databases follow __ACID__(Atomicity, Consistency, Isolation, and Durability) properties. __NoSQL__ databases follow __CAP__(Consistency Availability, and Partition tolerance) theorem.
6. __Scalability__: SQL databases are mostly __vertically scalable__ which means we can increase performance of a single server by increasing various componets like RAM, SSD, and sometimes processors but the major challenge  with this approach is that increasing CPU components gets very expensive.

The __NoSQL__ databases are __horizontally scalable__ i.e., we can easily shard the database or add more servers hence our NoSQL infrastructure can easily handle a lot of traffic. Moreover, horizontal scaling is cheaper as compared to vertical scaling. This ability to become larger and powerful at scale makes NoSQL databases the preferred choice for large or ever-changing data sets.
7. __Example__ Most popular __SQL__ databases are: 
  * MySQL
  * Oracle Database, 
  * Mocrosoft SQL Server
  * PostgreSQL 
  
  The most popular __NoSQL__ databases are: 
    * MongoDB,
    * Cassandra, 
    * Google Cloud BigTable, 
    * Apache HBase

## Which one to Choose?
### 1. Use SQL When:
1. the data is unchanging and structured.
2. a SQL database is a great fir for transaction-oriented systems e.g., customer relationship management tools, accounting software, and e-commerce platforms.
3. you need to ensure ACID compliance
4. Preferred when you want to use joins and execute complex queries.

### 2. Use NoSQL When:
1. data is changing and unstructured and is present in large volumes.
2. ACID property is not needed.
3. Data is highly distributed abd you need the traffic with zero downtime.
4. Rapid development is required because it doesn't need to be prepped ahead of time.
5. support for new application paradigm is required.


## Database Schema
A __schema__ is a logical database object holder. A __database schema__ of a database system is its structure described in a formal language supported by the database management system. The formal definition of a __database schema__ is a _set of formulas (sentences) called integrity constraints imposed on a database_. These integrity constraints ensure compatibility between parts of the schema.
### Create schema in MySQL - Example
In __MySQL__, __CREATE SCHEMA__ is a synonym for __CREATE DATABASE__.
```SQL
-- Cretae a Schema in MySQL
CREATE  TABLE IF NOT EXISTS `MyFlixDB`.`Members` (
  `membership_number` INT  AUTOINCREMENT ,
  `full_names` VARCHAR(150) NOT NULL ,
  `gender` VARCHAR(6) ,
  `date_of_birth` DATE ,
  `physical_address` VARCHAR(255) ,
  `postal_address` VARCHAR(255) ,
  `contact_number` VARCHAR(75) ,
  `email` VARCHAR(255) ,
  PRIMARY KEY (`membership_number`) )
ENGINE = InnoDB;
```

### SQL Foreign Key Constraint
A __FOREIGN KEY__ is a field (or collection of fields) in one table, that refers to the __PRIMARY KEY__ in another table. The table with the __foreign key__ is called the __child table__, and the table with the __primary key__ is called the __referenced__ or __parent table__.

The __FOREIGN KEY__ constraint prevents invalid data from being inserted into the foreign key column, because it has to be one of the values contained in the parent table.

```SQL
-- MySQL
-- The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:
CREATE TABLE orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID)
    FOREIGN KEY (PersonID) REFERENCES Persons(PERSONID)
);
```

```SQL
-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);
```

## Data Types
Data types define the nature of the data that can be stored in a particular column of a table

__MySQL__ has 3 main categories of data types namely

1. Numeric,
2. Text
3. Date/time.

### 1. Numeric Data types
__Numeric__ data types are used to store numeric values. It is very important to make sure range of your data is between lower and upper boundaries of numeric data types.
Type | Limits
----------| -----------
TINYINT( )|	-128 to 127 normal 0 to 255 UNSIGNED.
SMALLINT( ) |	-32768 to 32767 normal 0 to 65535 UNSIGNED.
MEDIUMINT( ) |	-8388608 to 8388607 normal 0 to 16777215 UNSIGNED.
INT( ) | 	-2147483648 to 2147483647 normal 0 to 4294967295 UNSIGNED.
BIGINT( ) |	-9223372036854775808 to 9223372036854775807 normal 0 to 18446744073709551615 UNSIGNED.
FLOAT	| A small approximate number with a floating decimal point.
DOUBLE( , )	| A large number with a floating decimal point.
DECIMAL( , ) |	A DOUBLE stored as a string , allowing for a fixed decimal point. Choice for storing currency values.

### 2. Text Data Types
As data type category name implies these are used to store text values. Always make sure you length of your textual data do not exceed maximum lengths.
Type | Limits
----------| ----------
CHAR( )	| A fixed section from 0 to 255 characters long.
VARCHAR( )|	A variable section from 0 to 255 characters long.
TINYTEXT	| A string with a maximum length of 255 characters.
TEXT|A string with a maximum length of 65535 characters.
BLOB|	A string with a maximum length of 65535 characters.
MEDIUMTEXT	| A string with a maximum length of 16777215 characters.
MEDIUMBLOB	| A string with a maximum length of 16777215 characters.
LONGTEXT	| A string with a maximum length of 4294967295 characters.
LONGBLOB	| A string with a maximum length of 4294967295 characters.

### 3. Date / Time
Type | Limits
----------| ----------
DATE | YYYY-MM-DD
DATETIME | YYYY-MM-DD HH:MM:SS
TIMESTAMP | YYYYMMDDHHMMSS
TIME | SHH:MM:SS

# SQL Stored Procedure
A __Stored procedure__ is a prepared __SQL code__ that you can save, so the code can be reused over and over  again. So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

## Stored Procedure Syntax
```sql
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;
```
## Execute a Stored Procedure
```sql
EXEC procedure_name;
```

# References
1. https://www.w3resource.com/sql/sql-basic/create-schema.php
2. https://www.guru99.com/how-to-create-a-database.html
3. https://dev.mysql.com/doc/workbench/en/workbench-faq.html
4. [Stored Procedure](https://www.w3schools.com/sql/sql_stored_procedures.asp)
