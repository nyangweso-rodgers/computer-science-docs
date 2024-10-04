# Google Cloud Platform (GCP)

## Table of Contents

1. [Introduction to GCP](#Introduction-to-GCP)

# Introduction to GCP

# GCP Services

# 1. Computing Services

## 1.1 Compute Engine

- **Compute Engine** let's you run **virtual machines** on demand in the cloud. It's Google Cloud **Infrastructure as a Service** solution. It provides maximum flexibility for people who prefer to manage server instances themselves. You reserve a configuration of **CPU**, **memory**, **disk**, and **GPUs**, and decide what **OS** and additional software to run.

## 1.2. Kubernetes Engine

- **Kubernetes Engine** is an open-source container orchestration platform. It basically handles everything related to **deploying**, **managing** and **scaling** containerized applications. You create a cluster and configure which containers to run; **Kubernetes** keeps them running and manages scaling, updates and connectivity.

- How Kubernetes Work?
  - A **kubernetes cluster** consists of woker machines, called **nodes**, that run containerized applications. Every cluster has at least one **worker node**. Hence, if a **node** fails, your application will still be accessible from other nodes as a cluster, multiple nodes are grouped.

## 1.3. Coud Run

- **Cloud Run** is a fully managed serverless platform that runs individual **containers**. You give code or a container to **Cloud Run**, and it hosts and auto scales as needed to respond to web and other events.

## 1.4. App Engine

- **App Engine** is GCP fully managed **PaaS** framework. i.e., it's a way to run code in the cloud without worrying about infrastructure.
  **App Engine** handles the **networking**, **application**, **scaling**, and **database scaling**. You write a web application in one of the supported languages, deploy to **App Engine**, and it handles scaling, updating versions, and so on. **Advantages** include:

  - App engine let’s you build highly scalable applications on a fully managed serverless platform.
  - You can Scale your applications from zero to planet scale without having to manage infrastructure.
  - Also you can free up your developers with zero server management and zero configuration deployments.
  - You can even stay agile with support for popular development languages and a range of developer tools with google app engine.

## 1.5. Cloud Functions

- **Cloud Functions** is a completely serverless execution environment or **functions as a service**. It executes your code in response to events, such as a HTTP request or a database update, whether these events occur once a day or many times for a second. You write individual function code and **Cloud Functions** calls your function when events happen (for example, HTTP, Pub/Sub, and Cloud Storage changes, among others).

- The architecture of this kind of service is refered as a **Serverless Architecture**, where pricing is calculated by the number of times the function is called and the quantity of memory and the CPU utilized. This kind of service is atractive as with little effort the function is up and running without worrying about managing a server.

- **Remarks**:
  - If you need more control over the underlying infrastructure (for example, the operating system, disk images, CPU, RAM, and disk) then it makes sense to use **Compute Engine**. This is a typical path for legacy application migrations and existing systems that require a specific OS.
  - Containers provide a way to virtualize an OS so that multiple workloads can run on a single OS instance. They are fast and lightweight, and they provide portability. If your applications are containerized then you have two main options.
  - You can use Google Kubernetes Engine, or GKE, which gives you full control over the container down to the nodes with specific OS, CPU, GPU, disk, memory, and networking. GKE also offers Autopilot, when you need the flexibility and control but have limited ops and engineering support.
  - If, on the other hand, you are just looking to run your application in containers without having to worry about scaling the infrastructure, then Cloud Run is the best option. You can just write your application code, package it into a container, and deploy it.
  - If you just want to code up your HTTP-based application and leave the scalability and deployment of the app to Google Cloud then App Engine — a serverless, fully-managed option that is designed for hosting and running web applications — is a good option for you.\
  - If your code is a function and just performs an action based on an event/trigger, then deploying it with Cloud Functions makes sense.

# 2. Storage Services

## 2.1: Cloud SQL

- **Cloud SQL** is a fully managed relational database for **MySQL**, **PostgreSQL** and **SQL Server**. It reduces maintenance cost and automates database provisioning, storage capacity management, backups and out of the box High availability and Disaster recovery/failover. **Set Up Process is as follows**:
  - select the region and zone where you would like the instance to be and they get created.
  - Configure the machine type with the right number of CPU & amount of memory your application needs
  - Choose storage type between solid state and hard disk drives depending on latency, QPS and cost requirements.

## 2.2: BigQuery

- **BigQuery** is a fully managed data warehouse. It provides real-time interactive analysis of massive data sets (hundreds of TBs) using **SQL** syntax.

## 2.3: Cloud Datastore

- **Cloud Datastore** is a **NoSQL**, document based database system. Even though it's a NoSQL database, it provides features like **ACID** tranasactions, SQL like queries and indexes. e.t.c.,

## 2.4: Bigtable

## 2.5: Cloud Storage

## 2.6: Cloud Spanner

# 3. Big Data Services

## 3.1: Pub/Sub (Publish/Subscribe)

- **Pub/Sub** is a model of distributed systems. In this model, any message **published** (produced) to a topic is immediately received by all of the subscribers to the topic. **Pub/sub** messaging can be used to enable event-driven architectures, or to decouple applications in order to increase **performance**, **reliability** and **scalability**.

- The **subscribers** to the message topic often perform different functions, so each one can do something different with the message in parallel. The **publisher** doesn’t need to know who is using the information that it is broadcasting, and the subscribers don’t need to know who the message comes from.

## 3.2: Data Flow

## 3.3: Data Proc

## 3.4: Data Lab

# Resources and Further Reading

1. [Where should I run my stuff? Choosing a Google Cloud compute option](https://cloud.google.com/blog/topics/developers-practitioners/where-should-i-run-my-stuff-choosing-google-cloud-compute-option?utm_source=linkedin&utm_medium=unpaidsoc&utm_campaign=fy22q4-googlecloud-blog-ease_of_use-in_feed-no-brand-global&utm_content=-&utm_term=-)
