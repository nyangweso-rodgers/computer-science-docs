-- The following query returns the schema metadata of table dim_customer in dataset test.
SELECT * EXCEPT(table_catalog) FROM test.INFORMATION_SCHEMA.COLUMNS
WHERE table_name='dim_customer' AND table_schema='test';