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

    * __Kubernetes Engine__:  let's you run containerized applications on a card environment that Google manages for you under your administrative control
    
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





# References
1. _https://cloud.google.com/blog/topics/inside-google-cloud/21-google-cloud-tools-each-explained-under-2-minutes_
2. [Building ETL Pipeline with Python and Google Cloud Functions](https://towardsdatascience.com/part-2-building-a-simple-etl-pipeline-with-python-and-google-cloud-functions-mysql-to-bigquery-4e1987f9f89b)