# Apache Kafka

## Table of Contents
- [Introduction to Apache Kafka](#Introduction-to-Apache-Kafka)
- [When to use Apache Kafka?](#When-to-use-Apache-Kafka?)
- [When not to use Apache Kafka](#When-not-to-use-Apache-Kafka?)
- [References](#References)

# Introduction to Apache Kafka
__Kafka__ is:
* a scalable real-time messaging platform to process millions of messages per second.
* an event streaming platform for massive volumes of big data analytics and small volumes of transactional data processing.
* a distributed storage provides true decoupling for backpressure handling, support of various communication protocols, and replayability of events with guaranteed ordering.
* a data integration framework for streaming ETL.
* a data processing framework for continuous stateless or stateful stream processing.

# When to use Apache Kafka?
* Kafka consumes and processes high volumes of IoT and mobile data in real-time. Processing massive volumes of data in real-time is one of the critical capabilities of Kafka.
* Kafka correlates IoT data with transactional data from the MES and ERP systems. Data integration in real-time at scale is relevant for analytics and the usage of transactional systems like an ERP or MES system. Kafka Connect and non-Kafka middleware complement the core of event streaming for this task.
* Kafka is the scalable real-time backend for mobility services and gaming/betting platforms

# When not to use Apache Kafka?
* Kafka is NOT hard real-time. The definition of the term “real-time” is difficult. It is often a marketing term. Real-time programs must guarantee a response within specified time constraints.
* If your application requires sub-millisecond latency, Kafka is not the right technology. For instance, high-frequency trading is usually implemented with purpose-built proprietary commercial solutions.

# References
1. [When not to use Apache Kafka](https://kai-waehner.medium.com/when-not-to-use-apache-kafka-a35345226a9f)