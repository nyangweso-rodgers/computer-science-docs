# PostgreSQL
__PostgreSQL__ is an open-source, __object-relational database system__ that supports a large part of the __SQL__ standard and offers many modern features:
* complex queries
* foreign keys
* triggers
* updatable
* transactional integrity
* multiversion concurrency control
## PostgreSQL show tables using pg_catalog schema
show tables in PostgreSQL
```sql
select * from pg_catalog.pg_tables
where schemaname != 'pg_catalog' and schemaname != 'information_schema'
-- we used a condition in the WHERE clause to filter system tables. If you omit the WHERE clause, you will get many tables including the system tables.
```
# References
1. [Download](https://www.postgresql.org/download/windows/)
2. [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)