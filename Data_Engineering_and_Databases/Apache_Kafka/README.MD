# Apache Kafka

## Table of Contents
1. [Overview of Event Streaming](#Event-Sreaming)
2. [Overview of Apache Kafka](#Overview-of-Apache-Kafka)
    - [How Kafka Works](#How-Kafka-Works)
3. [When to use Apache Kafka?](#When-to-use-Apache-Kafka?)
4. [When not to use Apache Kafka](#When-not-to-use-Apache-Kafka?)
5. [References](#References)
    - [When not to use Apache Kafka](https://kai-waehner.medium.com/when-not-to-use-apache-kafka-a35345226a9f)
    - https://hackernoon.com/thorough-introduction-to-apache-kafka-6fbf2989bbc1

# Event Sreaming
* __Event streaming__ ( ES ) captures data in real-time and takes care of storing, processing, manipulating and routing it. 
# Overview of Apache Kafka
__Kafka__ was originally developed at LinkedIn in 2011, which is a __distributed__, __horizontally-scalable__, __fault-tolerant__, __commit log__.


# Definiion of Terms
1. __Distributed__:  A __distributed__ system is one which is split into multiple running machines, all of which work together in a cluster to appear as one single node to the end user. __Kafka__ is distributed in the sense that it stores, receives and sends messages on different nodes (called __brokers__).
2. __Horizontally-scalable__: involves adding more machines when there is an overload to the existing servers  
3. __Fault-tolerant__: In a 5-node Kafka cluster, you can have it continue working even if 2 of the nodes are down. It is worth noting that fault-tolerance is at a direct tradeoff with performance, as in the more fault-tolerant your system is, the less performant it is.
4. __Commit Log (transaction log)__: a persistent ordered data structure which only supports appends. You cannot modify nor delete records from it. It is read from left to right and guarantees item ordering.

# How Kafka Works
Applications (__producers__) send messages (__records__) to a Kafka node (__broker__) and said messages are processed by other applications called __consumers__. Said messages get stored in a __topic__ and __consumers__ subscribe to the topic to receive new messages. As topics can get quite big, they get split into __partitions__ of a smaller size for better performance and scalability.

__Kafka__ follows the principle of a __dumb broker__ and __smart consumer__. This means that Kafka does not keep track of what records are read by the consumer and delete them but rather stores them a set amount of time (e.g one day) or until some size threshold is met. Consumers themselves poll Kafka for new messages and say what records they want to read. This allows them to increment/decrement the offset they’re at as they wish, thus being able to replay and reprocess events.

__Kafka__ stores all of its records to disk and does not keep anything in RAM. 

# When to use Apache Kafka?
* Kafka consumes and processes high volumes of IoT and mobile data in real-time. Processing massive volumes of data in real-time is one of the critical capabilities of Kafka.
* Kafka correlates IoT data with transactional data from the MES and ERP systems. Data integration in real-time at scale is relevant for analytics and the usage of transactional systems like an ERP or MES system. Kafka Connect and non-Kafka middleware complement the core of event streaming for this task.
* Kafka is the scalable real-time backend for mobility services and gaming/betting platforms

# When not to use Apache Kafka?
* Kafka is NOT hard real-time. The definition of the term “real-time” is difficult. It is often a marketing term. Real-time programs must guarantee a response within specified time constraints.
* If your application requires sub-millisecond latency, Kafka is not the right technology. For instance, high-frequency trading is usually implemented with purpose-built proprietary commercial solutions.