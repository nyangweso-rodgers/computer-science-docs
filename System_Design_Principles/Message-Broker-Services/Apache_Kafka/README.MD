# Apache Kafka

## Table Of Contents
- [Introduction to Apache Kafka](#Introduction-to-Apache-Kafka)

- [Definition Of Terms](#Definition-Of-Terms)

- [References]()
    - []()

# Introduction to Apache Kafka
* __Apache Kafka__ is a distributed streaming software that delivers live data feeds. 

# How Kafka Works
* __Kafka__ works in a unique way that involves __publishers__, __consumers__, and __topics__. Publishers produce data(e.g. web servers), consumers use data from publishers, and topics are an immutable log of events(made by publishers). Consumers can subscribe to topics to access their data.
# Kafka Based APIs
* __Kafka-based APIs__ are suitable for software that requires real-time data streaming, processing, and monitoring.  They are also great at handling high volumes of data. Kafka architecture uses five APIs:
    1. __Producer API__: publishes streams of a record to Kafka topics.
    2. __Consumer API__: used to subscribe to topics and process their streams of records.
    3. __Streams API__: allows applications to act as stream processors by transforming an input stream into an output stream for different output topics.
    4. __Connector API__: allows users to automate adding another app or data system to current Kafka topics.
    5. __Admin API__: used for managing and monitoring topics and other Kafka objects.


# Definition Of Terms
1. __Kafka Streams__: Part of what makes Kafka so powerful is __Kafka Streams__. The __Streams API__, available as a Java library, is the easiest way to write real-time apps and microservices. But, what if you prefer not to use Java? Or you want to use a more familiar query language like SQL?