# Databases

## Table Of Contents

# Introduction to Databases

- **Database**: application that allow one to store and access data. a **database** is a collection of data that is organized in a manner that facilitates ease of access, as well as efficient management and tracking. a database is made up of **tables** that store relevant information.

# Definition of Terms in Databases

## 1. Database Table

- a **table** stores and displays data in a structtured format consisting of columns and rows. web applications use them to provide dynamic functions to users e.g., displaying products, content management, and user management.

## 2. Primary Key

- field in the table that uniquely identifies the table records.
- **Features** if a Primary Key include:
  - it must contain a unique value for each row
  - it cannot contain `NULL` values

## 3. Database Management System (DBMS)

- software to create, define and manage database. e.g.,
  - Microsoft,
  - Oracle,
  - IBM,
  - Apache,
  - SQLServer,
  - DB2,
  - Cassandra,
  - MongoDB,
  - MySQL,
  - PostgreSQL.

# ACID (Atomicity, Consistency, Isolation, & Durability) Properties in DMS (Database Management Systems)

- **ACID** properties ensure that a set of database operations (grouped together in a transaction) leave the database in a valid state even in the event of unexpected errors.
- **ACID** properties:
  - **Atomicity**
    - **Atomicity** guarantees that all of the commands that make up a transaction are treated as a single unit and either succeed or fail together.
    - This is important as in the case of an unwanted event, like a crash or power outage, we can be sure of the state of the database. The transaction would have either completed successfully or been rollbacked if any part of the transaction failed.
    - Example
      - money is deducted from the source and if any anomaly occurs, the changes are discarded and the transaction fails.
  - **Consistency**
    - **Consistency** guarantees that changes made within a transaction are consistent with database constraints. This includes all rules, constraints, and triggers. If the data gets into an illegal state, the whole transaction fails.
    - Example:
      - let’s say there is a constraint that the balance should be a positive integer. If we try to overdraw money, then the balance won’t meet the constraint. Because of that, the consistency of the ACID transaction will be violated and the transaction will fail.
  - **Isolation**
    - **Isolation** ensures that all transactions run in an isolated environment. That enables running transactions concurrently because transactions don’t interfere with each other.
    - Example:
      - let’s say that our account balance is $200. Two transactions for a $100 withdrawal start at the same time. The transactions run in isolation which guarantees that when they both complete, we’ll have a balance of $0 instead of $100.
  - **Durability**
    - **Durability** guarantees that once the transaction completes and changes are written to the database, they are persisted. This ensures that data within the system will persist even in the case of system failures like crashes or power outages.

## NoSQL Databases

### Types of NoSQL Databases

#### 1. `key - value`

- `key-value` are the least complex of the **NoSQL** databases. All data that is stored with a **key** and an associated **value** blob. **key-value** stores are represented as a **hashmap**, which makes them powerful for basic Create - Read - Update - Delete operations. however, these databases often are not meant for complex queries that are attempting to connect multiple pieces of data. Instead, they are suited only to situatiosn in which you always access data by using only a single key. some popular Key-Value databases are:
  - Redis
  - Hamster DM
  - DynamoDB
  - Berkely DB
  - Document
  - columnar
  - Graph

#### 2. Document

- **Document**: build off the **key-value** model by making the value visible and can be queried. Each piece of data is considered a document and often is stored in **JSON** or **XML** format. **document** databases can index and query the contents of the document, which offers key and value range lookups and search ability or analytical queries by using paradigms, such as **MapReduce**.
- **Document** databases are currently the most popular of the **NoSQL** databeses in use today. Some popular Document Databases include:
  - Cloudent
  - **MongoDB**: stores data in the form of **BSON** structure-based documents. These documents are stored in a collection. **MongoDB** allows a highly flexible and scalable document structure. Also, **MongoDB** databases are faster as compared to SQL databases due to efficient indexing and storage technoques. _Features_ include:
    - Flexible data model in form of documents
    - Agile and highly scalable database
    - Faster than traditional databases
    - Expressive query language
  - CouchDB

#### 3. Columnar

- **Columnar**: focus on columns and groups of columns when storing data. when compared to row-oriented databases, **columnar** databases can better compress data and save storage space. some popular columnar databases include:
  - dashDB
  - Cassandra

#### 4. Graph

- **Graph**: store information in entities (or nodes) and relationships (or edges). **graph** databases are useful when your dataset resembles a graph-like data structure. traversing all of the relationships is quick and efficient, but these databases tend not to scale well. some popular Graph databases include:
  - Neo4j
  - OrientDB
  - FlockDB

# Resources

1. [MongoDB Basics - What are ACID Properties in Database Management Systems?](https://www.mongodb.com/basics/acid-transactions)
