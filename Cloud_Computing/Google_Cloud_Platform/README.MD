# Google Cloud Platform (GCP)
## Table of Contents
1. [Introduction to GCP](#Introduction-to-GCP)
2. [GCP Services](#2.GCP-Services)
    - [Computing Services](#Computing-Services)
        - Compute Engine
        - Kubernetes Engine
        - Cloud Run
        - App Engine
        - Cloud Functions
    - [Storage Services](#Storage-Services)
    - [Big Data]()
    - [Machine Learning]()

- [References](#References)

# Introduction to GCP
# GCP Services
# Computing Services
Where should I run my stuff? Choosing a Google Cloud compute option? _Choosing the right infrastructure options to run your application is critical, both for the success of your application and for the team that is managing and developing it_
1. __Compute Engine__: let's you run __virtual machines__ on demand in the cloud. It's Google Cloud __Infrastructure as a Service__ solution. It provides maximum flexibility for people who prefer to manage server instances themselves. You reserve a configuration of _CPU_, _memory_, _disk_, and _GPUs_, and decide what _OS_ and additional software to run.

2. __Kubernetes Engine__:  this is an open-source container orchestration platform. It basically handles everything related to _deploying_, _managing_ and _scaling_ containerized applications. You create a cluster and configure which containers to run; __Kubernetes__ keeps them running and manages scaling, updates and connectivity.

3. __Cloud Run__: A fully managed serverless platform that runs individual containers. You give code or a container to Cloud Run, and it hosts and auto scales as needed to respond to web and other events.

4. __App Engine__ is GCP fully managed __PaaS__ framework. i.e., it's a way to run code in the cloud without worrying about infrastructure. __App Engine__ handles the _networking_, _application scaling_, and _database scaling_. You write a web application in one of the supported languages, deploy to __App Engine__, and it handles scaling, updating versions, and so on. __Advantages__ include:
    * App engine let’s you build highly scalable applications on a fully managed serverless platform.
    * You can Scale your applications from zero to planet scale without having to manage infrastructure.
    * Also you can free up your developers with zero server management and zero configuration deployments.
    * You can even stay agile with support for popular development languages and a range of developer tools with google app engine.

5. __Cloud Functions__: is a completely serverless execution environment or __functions as a service__. It executes your code in response to events, such as a HTTP request or a database update, whether these events occur once a day or many times for a second. You write individual function code and Cloud Functions calls your function when events happen (for example, HTTP, Pub/Sub, and Cloud Storage changes, among others). 

_Remarks_:
* _If you need more control over the underlying infrastructure (for example, the operating system, disk images, CPU, RAM, and disk) then it makes sense to use Compute Engine. This is a typical path for legacy application migrations and existing systems that require a specific OS._
* _Containers provide a way to virtualize an OS so that multiple workloads can run on a single OS instance. They are fast and lightweight, and they provide portability. If your applications are containerized then you have two  main options._
    - _You can use Google Kubernetes Engine, or GKE, which gives you full control over the container down to the nodes with specific OS, CPU, GPU, disk, memory, and networking. GKE also offers Autopilot, when you need the flexibility and control but have limited ops and engineering support._
    - _If, on the other hand, you are just looking to run your application in containers without having to worry about scaling the infrastructure, then Cloud Run is the best option. You can just write your application code, package it into a container, and deploy it._
* _If you just want to code up your HTTP-based application and leave the scalability and deployment of the app to Google Cloud then App Engine — a serverless, fully-managed option that is designed for hosting and running web applications — is a good option for you._
* _If your code is a function and just performs an action based on an event/trigger, then deploying it with Cloud Functions makes sense_

# Storage Services
1. Bigtable
2. Cloud Storage
3. Cloud SQL
4. Cloud Spanner
5. Cloud Datastore
6. Big Data Services
    - __Big Query__: _This is a fully managed data warehouse. It provides real-time interactive analysis of massive data sets (hundreds of TBs) using __SQL__ syntax._
    - __Pub/Sub__: _scalable and flexible enterprise messaging_
    - __Data Flow__: _Stream and batch, processing unified and simplified pipelines_
    - __Data Proc__: _Managed Hadoop, MapReduce, Spark, Pig and Hive Service._
    - __Data lab__: _interactive data exploration_
7. Machine Learning
    -  Natural Language API
    - Vision API
    - Machine Learning
    - Speech API


# References
1. _https://cloud.google.com/blog/topics/inside-google-cloud/21-google-cloud-tools-each-explained-under-2-minutes_
2. [Building ETL Pipeline with Python and Google Cloud Functions](https://towardsdatascience.com/part-2-building-a-simple-etl-pipeline-with-python-and-google-cloud-functions-mysql-to-bigquery-4e1987f9f89b)
3. [How Google Cloud SQL is different form MySQL](https://www.quora.com/How-Google-cloud-sql-is-different-from-mysql)
