# BigQuery

## Table Of Contents
- [Overvie Of BigQuery](#Overview-Of-BigQuery)

- [Further Reading]()
    - [BigQuery 101: A Beginner's Guide to Google's Cloud Data Warehouse](https://airbyte.com/blog/bigquery-guide)
    - [Streaming data from Cloud Storage into BigQuery using Cloud Functions](https://cloud.google.com/architecture/streaming-data-from-cloud-storage-into-bigquery-using-cloud-functions)
    - [No pipelines needed. Stream data with Pub/Sub direct to BigQuery](https://cloud.google.com/blog/products/data-analytics/pub-sub-launches-direct-path-to-bigquery-for-streaming-analytics?utm_source=linkedin&utm_medium=unpaidsoc&utm_campaign=fy22q3-googlecloud-blog-data-in_feed-no-brand-global&utm_content=pubsub-bigquery-blog&utm_term=-)
    - [Visualize GCP Billing using BigQuery and Data Studio](https://medium.com/google-cloud/visualize-gcp-billing-using-bigquery-and-data-studio-d3e695f90c08)
    - [Query Syntax](https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax)
    - [BigQuery explained: How to ingest data into BigQuery so you can analyze it](https://cloud.google.com/blog/topics/developers-practitioners/bigquery-explained-data-ingestion)
    - [Loading data directly into a warehouse via your messaging engine? Here’s how this handy new feature works in Google Cloud.](https://seroter.com/2022/07/27/loading-data-directly-into-a-warehouse-via-your-messaging-engine-heres-how-this-handy-new-feature-works-in-google-cloud/)

# Overview Of BigQuery
* One of the key advantages of __BigQuery__ is its __serverless design__, which allows for independent scaling of storage and compute on demand. 

# BigQuery Concepts
1. A __BigQuery slot__ is a _virtual CPU_ used by __BigQuery__ to execute SQL queries. BigQuery automatically calculates how many slots each query requires, depending on query size and complexity.  If too many complex queries run at the same time, query demands will exceed the slots you committed to.

# Features Of BigQuery
# Columnar storage
* Traditional relational databases, like __MySQL__, store information in a __row-based format__ known as __record-oriented storage__, which makes them well-suited for transactional updates and __online transaction processing (OLTP) applications__. In contrast, __BigQuery__ uses a __columnar storage__ method, storing each column in its own file block, making it an excellent choice for __online analytical processing (OLAP) applications__.

# Partition and clustering
* A __partitioned table__ in __BigQuery__ is divided into smaller units called __partitions__ to make data management and querying more efficient. You can create partitions based on a __TIMESTAMP/DATE__ column or an __INTEGER__ column.

* __Clustering__ in __BigQuery__ involves organizing the data in a table based on the contents of one or more columns in the table's schema. These columns are used to group similar data, and it is usually best to use high cardinality and non-temporal columns for clustering. The order of the clustered columns determines the sort order of the data. 
