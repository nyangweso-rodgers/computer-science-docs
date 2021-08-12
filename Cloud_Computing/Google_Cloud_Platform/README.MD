# Google Cloud Platform (GCP)
## Table of Contents
- [How to Interact with GCP](#Interacting-with-Google-Cloud-Platform)
- [GCP Services](#2.GCP-Services)
    - [Computing]()
    - [Storage]()
    - [Big Data]()
    - [Machine Learning]()

- [References](#References)

# Interacting with Google Cloud Platform
* __Cloud Platform console__ (web user interface)
* __Cloud Shell and Cloud Software Development Kitt (SDK)__ (command-line inteface)
* __Cloud console mobile App__ (for iOS and Android)
* __REST-based API__ (for custom applications)

# GCP Services
1. Computing Services
    * __Compute Engine__: let's you run __virtual machines__ on demand in the cloud. It's Google Cloud __Infrastructure as a Service__ solution. It provides maximum flexibility for people who prefer to manage server instances themselves.

    * __Kubernetes Engine__:  this is an open-source container orchestration platform. It basically handles everything related to _deploying_, _managing_ and _scaling_ containerized applications.
    
    * __App Engine__ is GCP fully managed __PaaS__ framework. i.e., it's a way to run code in the cloud without worrying about infrastructure.
    
    * __Cloud Functions__: is a completely serverless execution environment or __functions as a service__. It executes your code in response to events, such as a HTTP request or a database update, whether these events occur once a day or many times for a second. An alternative to CF is [AWS Lambda](https://aws.amazon.com/lambda/) or [Azure Functions](https://azure.microsoft.com/en-us/services/functions/).

2. Storage Services
    * Bigtable
    * Cloud Storage
    * Cloud SQL
    * Cloud Spanner
    * Cloud Datastore
    * Big Data Services
        - __Big Query__: _This is a fully managed data warehouse. It provides real-time interactive analysis of massive data sets (hundreds of TBs) using __SQL__ syntax._
        - __Pub/Sub__: _scalable and flexible enterprise messaging_
        - __Data Flow__: _Stream and batch, processing unified and simplified pipelines_
        - __Data Proc__: _Managed Hadoop, MapReduce, Spark, Pig and Hive Service._
        - __Data lab__: _interactive data exploration_
    * Machine Learning
        -  Natural Language API
        - Vision API
        - Machine Learning
        - Speech API
        - Translate API
# Cloud SQL
__Google Cloud SQL__ is a service that allows you to _create_, _configure_, and _use_ __relational databases__ that live in __Google's cloud__. It is a fully-managed service that maintains, manages, and administers your databases, allowing you to focus on your applications and services.

_Remarks:_
* _Google Cloud SQL is a MySQL database that lives in Google's cloud._ 
* _It has all the capabilities and functionality of MySQL, with a few additional features and a few unsupported features._
* _Its easy to use and doesn't require any software installation or maintenance, and is ideal for small to medium-sized applications._

# Features of Cloud SQL
* Host your MySQL 5.5 and 5.6 databases in the cloud
* All data replicated across multiple zones for greater availability and durability
* Choice of billing options:
    - Per use option means you only pay for the time you access your data
    - Package option allows you to control your costs for more frequent access
* Google Cloud SQL instances can have up to 16GB of RAM and 500GB data storage
* Create and manage instances in the Google Cloud Console
* Instances available in US, EU, or Asia
* Cloud SQL customer data is encrypted when on Google’s internal networks and when stored in database tables, temporary files, and backups
* Synchronous or asynchronous replication between multiple zones with automatic failover
* Import and export databases using mysqldump, or import and export CSV files.
* Java and Python compatibility
* Support for MySQL wire protocol and MySQL connectors
* Support for connections over IPv4 and IPv6
* Support for connecting with the __Secure Sockets Layer__ (SSL) protocol
* Automated backups and point-in-time recovery
* __ISO/IEC 27001__ compliant

# Restrictions of Cloud SQL
* Size limit for individual instances is 500GB
* User defined functions are not supported
* The following MySQL statements are not supported:
    - LOAD DATA INFILE
        - Note: LOAD DATA LOCAL INFILE is supported.
    - SELECT ... INTO OUTFILE/DUMPFILE
    - INSTALL/UNINSTALL PLUGIN ...
    - CREATE FUNCTION ...
    - LOAD_FILE()
* The SUPER privilege is not supported.
* The following MySQL functions are not supported:
    - SHA2()
* The following MySQL Client Program features are not supported:
    - [mysqlimport](https://dev.mysql.com/doc/refman/8.0/en/mysqlimport.html) without using the --local option. This is due to the LOAD DATA INFILE restriction. If you need to load data remotely, use the Cloud SQL [import function](https://cloud.google.com/sql/docs/mysql/import-export#importing)
    - [mysqlimport](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) using the --tab option or options that are used with --tab. This is because the [FILE](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html#priv_file) privilege is not granted for instance users. All other mysqlimport options are supported.
# BigQuery
__Google BigQuery__ is some kind of __read-only__. You can’t modify the data in a BigQuery, you can’t delete any row. You can only delete the whole table or append it to the table. This is a natural result of the technology behind it.

So when to use BigQuery? It is used for really larger datasets. You can query terabytes of data in seconds with it. Big or small it will mostly respond in seconds.

# BogQuery Pricing Model
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

# Cloud SQL vs. BigQuery
- __Cloud SQL__ is a __relational database__ that is more intended for _transactional_ purposes while __BigQuery__, on the other hand, is an _analytics data warehouse that is intended for analytics, data visualization, business intelligence and/or machine learning_, etc.
- __Google BigQuery__ is some kind _read only_. You can’t modify the data in a BigQuery, you can’t delete any row. You can only delete the whole table or append to table. This is a natural result of the technology behind it.
- So when to use BigQuery? It is used for really larger datasets. You can query terabytes of data in seconds with it. Big or small it will mostly response in seconds.
- And Google Cloud SQL is just a SQL. You can keep your users on it for example, edit it, delete it etc.


# References
1. _https://cloud.google.com/blog/topics/inside-google-cloud/21-google-cloud-tools-each-explained-under-2-minutes_
2. [Building ETL Pipeline with Python and Google Cloud Functions](https://towardsdatascience.com/part-2-building-a-simple-etl-pipeline-with-python-and-google-cloud-functions-mysql-to-bigquery-4e1987f9f89b)
3. [How Google Cloud SQL is different form MySQL](https://www.quora.com/How-Google-cloud-sql-is-different-from-mysql)
4. [Is BigQuery Expensive?](https://www.quora.com/Is-Googles-BigQuery-expensive)