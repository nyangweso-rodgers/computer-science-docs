# BigQuery

## Table Of Contents
- [Overvie Of BigQuery](#Overview-Of-BigQuery)

- [References]()
    - [Streaming data from Cloud Storage into BigQuery using Cloud Functions](https://cloud.google.com/architecture/streaming-data-from-cloud-storage-into-bigquery-using-cloud-functions)
    - [No pipelines needed. Stream data with Pub/Sub direct to BigQuery](https://cloud.google.com/blog/products/data-analytics/pub-sub-launches-direct-path-to-bigquery-for-streaming-analytics?utm_source=linkedin&utm_medium=unpaidsoc&utm_campaign=fy22q3-googlecloud-blog-data-in_feed-no-brand-global&utm_content=pubsub-bigquery-blog&utm_term=-)
    - [Visualize GCP Billing using BigQuery and Data Studio](https://medium.com/google-cloud/visualize-gcp-billing-using-bigquery-and-data-studio-d3e695f90c08)
    - [Query Syntax](https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax)
    - [BigQuery explained: How to ingest data into BigQuery so you can analyze it](https://cloud.google.com/blog/topics/developers-practitioners/bigquery-explained-data-ingestion)
    - [Loading data directly into a warehouse via your messaging engine? Here’s how this handy new feature works in Google Cloud.](https://seroter.com/2022/07/27/loading-data-directly-into-a-warehouse-via-your-messaging-engine-heres-how-this-handy-new-feature-works-in-google-cloud/)

# Overview Of BigQuery

# BigQuery Slot
* A __BigQuery__ slot is a _virtual CPU_ used by __BigQuery__ to execute SQL queries. BigQuery automatically calculates how many slots each query requires, depending on query size and complexity.

* If too many complex queries run at the same time, query demands will exceed the slots you committed to.