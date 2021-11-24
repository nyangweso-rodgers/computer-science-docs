-- BigQuery provides system views to get a list of tables and views in a certain dataset. 
-- test is the dataset name
/*
-- the information returned include:
* Project ID
* Dataset ID
* Object Creation Time
* Last modification time
* Record count (for tables)
* Size in bytes (for tables)
* Type: 1 - table; 2- View
*/
select * from `test`.__TABLES__;