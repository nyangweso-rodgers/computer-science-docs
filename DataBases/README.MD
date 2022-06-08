
# Databases
## Table of Contents
- [Introduction to Databases](#Introduction-to-Databases)
- [Definitions of Terms used in Databases](#Definitions-of-Terms)
  - Data Tier
  - Database Tables
  - Primary Key
  - Database Management System (DBMS)
  - Structured Query Language (SQL)
  - SQL Views
  - Association (Composite) Table

- [Types of Databases](#Types-of-Databases)
  - Relational Databases
  - NoSQL Databases
- [Differenece between SQL and NoSQL Databases](#Difference-between-SQL-and-NoSQL)
- [References](#References)








 

  7. __Database Schema__: A __schema__ is a logical database object holder. A __database schema__ of a database system is its structure described in a formal language supported by the database management system. The formal definition of a __database schema__ is a _set of formulas (sentences) called integrity constraints imposed on a database_. These integrity constraints ensure compatibility between parts of the schema.

      __Example__: _Create schema in MySQL_: In __MySQL__, __CREATE SCHEMA__ is a synonym for __CREATE DATABASE__.

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
8. __FOREIGN KEY__ is a field (or collection of fields) in one table, that refers to the __PRIMARY KEY__ in another table. The table with the __foreign key__ is called the __child table__, and the table with the __primary key__ is called the __referenced__ or __parent table__. The __FOREIGN KEY__ constraint prevents invalid data from being inserted into the foreign key column, because it has to be one of the values contained in the parent table.

9. __Data Types__: Data types define the nature of the data that can be stored in a particular column of a table. __MySQL__ has 3 main categories of data types namely:
    - __Numeric Data types__: are used to store numeric values. It is very important to make sure range of your data is between lower and upper boundaries of numeric data types.

      Type | Limits
      |:----------:| :----------:|
      TINYINT( )|	-128 to 127 normal 0 to 255 UNSIGNED.
      SMALLINT( ) |	-32768 to 32767 normal 0 to 65535 UNSIGNED.
      MEDIUMINT( ) |	-8388608 to 8388607 normal 0 to 16777215 UNSIGNED.
      INT( ) | 	-2147483648 to 2147483647 normal 0 to 4294967295 UNSIGNED.
      BIGINT( ) |	-9223372036854775808 to 9223372036854775807 normal 0 to 18446744073709551615 UNSIGNED.
      FLOAT	| A small approximate number with a floating decimal point.
      DOUBLE( , )	| A large number with a floating decimal point.
      DECIMAL( , ) |	A DOUBLE stored as a string , allowing for a fixed decimal point. Choice for storing currency values.

    - __Text Data Types__: As data type category name implies these are used to store text values. Always make sure you length of your textual data do not exceed maximum lengths.

      Type | Limits
      |:----------:| :----------:|
      CHAR( )	| A fixed section from 0 to 255 characters long.
      VARCHAR( )|	A variable section from 0 to 255 characters long.
      TINYTEXT	| A string with a maximum length of 255 characters.
      TEXT|A string with a maximum length of 65535 characters.
      BLOB|	A string with a maximum length of 65535 characters.
      MEDIUMTEXT	| A string with a maximum length of 16777215 characters.
      MEDIUMBLOB	| A string with a maximum length of 16777215 characters.
      LONGTEXT	| A string with a maximum length of 4294967295 characters.
      LONGBLOB	| A string with a maximum length of 4294967295 characters.

    - __Date / Time__
        Type | Limits
        |:----------:| :----------:|
        DATE | YYYY-MM-DD
        DATETIME | YYYY-MM-DD HH:MM:SS
        TIMESTAMP | YYYYMMDDHHMMSS
        TIME | SHH:MM:SS

10. __SQL Stored Procedure__: this is a prepared __SQL code__ that you can save, so the code can be reused over and over  again. So if you have an SQL query that you write over and over again, save it as a __stored procedure__, and then just call it to execute it.

11. __SQL Trigger__: automatic action that is fired during the occurrence of an event is what we call Trigger in SQL. There are _four_ types of __SQL Triggers__ namely:
      - __DDL Triggers__: Triggers that are created on __DDL__ (__Data Definition Language__) Statements such as CREATE, ALTER, DROP. When __DDL__ Statements gets executed then a special type of stored procedure or operation executes that is __DDL Triggers__.

      - __DML Triggers__: This Trigger gets executed automatically when __DML__ (__Data Manipulation Language__) Statements like INSERT, UPDATE, DELETE is executed on a Table.

      - __CLR Triggers__: __CLR__ (__Common Language Runtime__) Trigger, a special kind of stored procedure that automatically fired when a language event executes.

      - __Logon Triggers__: A special type of operation or stored procedure executes automatically in response to a Logon event. This trigger executes only after successful authentication. If this fails the trigger will not be executed.

      Benefits of SQL Triggers | Limitations of SQL Triggers
      |:----------:| :----------:|
      Triggers are the alternative way to examine the integrity of data in a table. | Triggers make systems run slower. As SQL Triggers run on every update so it adds more load to the database, this makes the system processing slow.
      Triggers can easily catch the errors in business at the database level. | We can easily view tables relationship, indexes, stored procedures but Triggers are somehow difficult to view.
      It gives us an alternative way to run scheduled tasks. | To track or debug a SQL Trigger is not possible.
      It proves useful when there is a need to audit the changes of data in tables. | Triggers are not compiled.
      Triggers force for security approval | We cannot control the versions.

      _Remark_: __When to use SQL Triggers__ - For performing the following activities we can use triggers -
        * For implementing a business rule.
        * For making an audit trail of actions
        * For determining extra information that is not accessible inside a table.

12. __Association (composition) Table__: _Association tables_ are used for _many-to-many_ relationships between two objects. They consist of at least two foreign keys, each of which references one of the two objects. i.e., when setting up a database to answe the following questions, then an _association table_ is implemensted:
    - How many apples can one person eat?
    - How many people can eat a single apple?

# Types of Databases
There are two major types of databases available: __SQL__. and __NoSQL__. They differ in the way they how they store and process data.

1. __Relational databases__
A common type of database is a __Relational Database Management System__ (RDMS) in which data is stored according to the relationship it has to other data. In many implementations, an RDMS consists of storing data in different tables and building relationships between rows in the table. Data that is stored in an RDMS is available for querying by using a language called __Structured Query Language__ (SQL). 

Most Relationsl databases support SQL that conforms to the __American Natioanl Standards Institute__ (ANSI) standards. However, different database implementations offer different features and not all of them support the full range of ANSI SQL equally. This issue makes writing SQL that can be used equally in many different databases difficult.

 __Example__ Most popular __SQL__ databases are: 
  * MySQL
  * Oracle Database, 
  * Mocrosoft SQL Server
  * PostgreSQL  

2. __NoSQL databases__: __NoSQL__ databases are __non-relational databases__ that provide a way of storing and retrieving data in means other than tabular format. It is very helpful in handling unstructured data.

The most popular __NoSQL__ databases are: 
  * MongoDB,
  * Cassandra, 
  * Google Cloud BigTable, 
  * Apache HBase

# Difference between SQL and NoSQL
Feature | SQL | NoSQL
|:-------------:|:-----------------:|:------------:|
__Type__ | are primarily Relational Databases | are distributed or non-relational databases
__Storage__ | the data is stored in a tabular format, and the data is organized in a row-column format and each row is unique. | don't follow a table-based data storage model. Instead, they have a very flexible schema. The data can be stored in key-value, document, graph, and wide column format.
__Schema__ | have a fixed predetermined schema to determine the structure of your data before you work with it. Every time data is inserted it should  follow the predefined schema. The structure of the schema can be altered but it is difficult and also the entire database suffers downtime. | NoSQL schema has a very dynamic schema for storing unstructured data. It means additional columns can be added anytime and every row doesn't have to follow the same structure.
__Querying Language__ | SQL databases use __Standard Query Language__ for defining and manipulating the data.| The __NoSQL__ databases don't have any fixed schema for storing data hence they use __Unstructured Query Language__(UnQL). Unlike SQL, different databases have different syntax for UnQL.
__Property__ | SQL databases follow __ACID__(_Atomicity, Consistency, Isolation, and Durability_) properties. | __NoSQL__ databases follow __CAP__(_Consistency Availability, and Partition tolerance_) theorem.
__Scalability__|  SQL databases are mostly __vertically scalable__ which means we can increase performance of a single server by increasing various componets like RAM, SSD, and sometimes processors but the major challenge  with this approach is that increasing CPU components gets very expensive.| The __NoSQL__ databases are __horizontally scalable__ i.e., we can easily shard the database or add more servers hence our NoSQL infrastructure can easily handle a lot of traffic. Moreover, horizontal scaling is cheaper as compared to vertical scaling. This ability to become larger and powerful at scale makes NoSQL databases the preferred choice for large or ever-changing data sets.
# Which one to Choose?
Use __SQL__ when | Use __NoSQL__ when
|:-----------------:|:------------:|
the data is unchanging and structured. | data is changing and unstructured and is present in large volumes.
a SQL database is a great fit for transaction-oriented systems e.g., customer relationship management tools, accounting software, and e-commerce platforms. | Data is highly distributed abd you need the traffic with zero downtime.
you need to ensure ACID compliance | ACID property is not needed.
Preferred when you want to use joins and execute complex queries. | Rapid development is required because it doesn't need to be prepped ahead of time.
 | support for new application paradigm is required.





# References
1. https://www.w3resource.com/sql/sql-basic/create-schema.php
2. https://www.guru99.com/how-to-create-a-database.html
3. https://dev.mysql.com/doc/workbench/en/workbench-faq.html
4. [Stored Procedure](https://www.w3schools.com/sql/sql_stored_procedures.asp)
5. [SQL Trigger](https://www.quora.com/)
6. [Creating Association Table in a Database  ](https://openclassrooms.com/en/courses/2071486-retrieve-data-using-sql/5758019-create-an-association-table)
