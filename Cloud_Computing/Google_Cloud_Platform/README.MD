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
# 1. Computing Services - App Engine
__Google App Engine__ is a platform which enables you to focus on developing web applications without worrying too much about anything else:
- _system administration_, aka having take care of computer on which will run software for your webapp, installing operation system, database, programs, enough space to handle data... all that handles Google App Engine
- depending on how many people visits your website one computer is not enough to handle the load (requests). Google App Engine takes care that you have just enough.

_Remark:_ 
* _Google app engine basically provide you resource (platform In programmers term) to run your application (or website ) free of cost with some agreement on the number of hits/visit to your web site._

# Advantages of Google App engine:
* App engine let’s you build highly scalable applications on a fully managed serverless platform.
* You can Scale your applications from zero to planet scale without having to manage infrastructure.
* Also you can free up your developers with zero server management and zero configuration deployments.
* You can even stay agile with support for popular development languages and a range of developer tools with google app engine.

# References
1. _https://cloud.google.com/blog/topics/inside-google-cloud/21-google-cloud-tools-each-explained-under-2-minutes_
2. [Building ETL Pipeline with Python and Google Cloud Functions](https://towardsdatascience.com/part-2-building-a-simple-etl-pipeline-with-python-and-google-cloud-functions-mysql-to-bigquery-4e1987f9f89b)
3. [How Google Cloud SQL is different form MySQL](https://www.quora.com/How-Google-cloud-sql-is-different-from-mysql)
4. [Is BigQuery Expensive?](https://www.quora.com/Is-Googles-BigQuery-expensive)