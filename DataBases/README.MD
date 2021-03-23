# Databases

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

#### References
1. https://www.w3resource.com/sql/sql-basic/create-schema.php
2. https://www.guru99.com/how-to-create-a-database.html
3. https://dev.mysql.com/doc/workbench/en/workbench-faq.html
