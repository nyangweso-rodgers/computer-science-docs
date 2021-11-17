# Google BigQuery
__Google BigQuery__ is some kind of __read-only__. You can’t modify the data in a __BigQuery__, you can’t delete any row. You can only delete the whole table or append it to the table. This is a natural result of the technology behind it.

So when to use __BigQuery__? It is used for really larger datasets. You can query terabytes of data in seconds with it. Big or small it will mostly respond in seconds.

# Cloud SQL vs. BigQuery
- __Cloud SQL__ is a __relational database__ that is more intended for _transactional_ purposes while __BigQuery__, on the other hand, is an _analytics data warehouse that is intended for analytics, data visualization, business intelligence and/or machine learning_, etc.
- __Google BigQuery__ is some kind _read only_. You can’t modify the data in a BigQuery, you can’t delete any row. You can only delete the whole table or append to table. This is a natural result of the technology behind it.
- So when to use BigQuery? It is used for really larger datasets. You can query terabytes of data in seconds with it. Big or small it will mostly response in seconds.
- And Google Cloud SQL is just a SQL. You can keep your users on it for example, edit it, delete it etc.


# BigQuery Pricing Model
* Given that the files stored in __BigQuery__ cannot be compressed and the current cost is $5 per 1TB queried and $20 per month for every 1TB stored, the bill becomes huge when multiple users often query denormalized tables in there.
* the costs can become affordable by reducing the billing costs from several hundred of dollars to a few dollars per day if users avoid querying their stuff in a __denormalized table__ and not __aggregating the same results several times__.
* Some of the ways of reducing cost in BigQuery are:
    - __Aggregating data only once:__ _Instead of aggregating the raw data several times, it is best to store the calculations of the aggregations in a staging table and update it every day incrementally. For example, instead of aggregating for the last 90 days every day, aggregate only for today’s date and store it in a staging table where you will instead query from. That way, you retrieve fewer data from the raw table every day, reducing the query costs. BigQuery allows regular users to automate the task of incrementally updating their staging table by [scheduling queries](https://cloud.google.com/bigquery/docs/scheduling-queries)_
    - __Converting defined dimensions into metrics__: _If we have within our staging table a lot of dimensions that are in high cardinality, we will still have a lot of records to compute. To reduce the number of records, check if it is possible for some dimensions to be converted into metrics that we only need._
    - __Generalize existing dimensions__: _Otherwise, if the dimension is still important to remain, yet it has high cardinality, try to reduce it by generalizing the several values within said dimension into few categories. That way, the number of records will get decreased._
    - __Maintain staging tables with DML statements:__ _There will be a lot of occasions where you will need to add new columns within your existing staging table or update existing columns due to business logic changes. Instead of creating a new table again from scratch with the raw data, it is more cost effective on maintaining it when possible. [BigQuery has DML statements](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax) like MERGE/DELETE/INSERT/UPDATE to handle that._
    - __Using Partition columns:__ _When we filter our data in BigQuery, the cost of the query will be as if we were scanning the whole table. With setting [partitions](https://cloud.google.com/bigquery/docs/partitioned-tables) on our table, every time we filter with that partition column, we scan only the records the filter picks up, saving us a lot of costs. Make sure the staging table or any other table that gets created has a date partition column that you will usually often want to use as a filter._
    - __Storing raw data in a hierarchical format with nested fields__: _Instead of having several tables all denormalized into one, it is better whenever possible to store each table as a nested field within a table that stores such data in a hierarchical format. A table with nested fields gets the same benefit as a denormalized table that does not require the need to do joins leaving BigQuery to stay out of trouble on using computing resources to make the linking between tables on the fly. Unlike denormalized tables, tables with nested fields reduce data redundancy by keeping the data normalized. For a better explanation, I recommend taking a read of the article [Why Nesting Is So Cool](https://looker.com/blog/why-nesting-is-so-cool) from data-discovery platform Looker._
    - __Cluster Columns__: _[Cluster columns](https://cloud.google.com/bigquery/docs/clustered-tables) are not as effective as partition columns on saving query costs, but are still a great choice if you still have a lot of data to scan within each partition and the column that you cluster has high cardinality._
    - __Monitor Logs:__ _Have detail and summary reports so users can have visibility of their daily usage. [stackdriver logging](https://cloud.google.com/logging/docs/) allows you to import Bigquery activity logs within BigQuery and [Google provides several good views examples that you can create from the logs provided](https://cloud.google.com/bigquery/docs/reference/auditlogs/#querying-exported-logs)._
    - __Most queries should be considered experimental__: _If any query becomes almost like a production run, it is always good to check if the same metrics/dimensions are not created multiple times from other queries as well. Otherwise, it should instead be done only once by a team that maintains them. Make sure the scheduled queries are stopped when the deliverables produced are not in use and the tables created have an [expiry date by updating the table’s description](https://cloud.google.com/bigquery/docs/managing-tables#updating_a_tables_description)_
    - __Only get the records and columns that are in need__: _Make sure users do proper research of the data sources that they are working with so they can retrieve only the data that they will need._
    - __Train users to learn BigQuery__: Users will get the most on optimizing their queries by having actually tried most of what they can do with BigQuery. [Qwiklabs has a lot of BigQuery hands-on labs](https://www.qwiklabs.com/catalog?keywords=bigquery) that you can complete each at your own pace where each lab takes less than an hour or two. The quests that we recommend to start with are [BigQuery Basics for Data Analysis](https://google.qwiklabs.com/quests/69), [BigQuery for Marketing Analysts](https://google.qwiklabs.com/quests/70), [BigQuery for Data Warehousing](https://google.qwiklabs.com/quests/68), and [BigQuery for Machine Learning](https://google.qwiklabs.com/quests/71).

# BigQuery Table Partition
__Partition__ involves dividing a large table into smaller portions.

# Advantages of Table Partitions
1. Improve Query Performance
2. Control costs by reducing the number of bytes read by the query


# References
1. [Getting table metadata using INFORMATION_SCHEMA](https://cloud.google.com/bigquery/docs/information-schema-tables)
2. [How to unnest / extract nested JSON data in BigQuery](https://www.holistics.io/blog/how-to-extract-nested-or-array-json-in-bigquery/)
3. [Optimizing BogQuery Cost](https://medium.com%2F@medium.com/zalora-data/optimising-queries-in-bigquery-for-beginners-971be491f1de)