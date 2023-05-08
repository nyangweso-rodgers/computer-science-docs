# Apache Kafka

## Table Of Contents
- [Introduction to Apache Kafka](#Introduction-to-Apache-Kafka)

- [Definition Of Terms](#Definition-Of-Terms)

# Introduction to Apache Kafka
* __Apache Kafka__ is a distributed streaming software that delivers live data feeds. __Kafka__ was originally developed at LinkedIn in 2011, which is a __distributed__, __horizontally-scalable__, __fault-tolerant__, __commit log__.

# How Kafka Works
* __Kafka__ works in a unique way that involves __publishers__, __consumers__, and __topics__:
  * _Publishers_ produce data(e.g. web servers), 
  * _consumers_ use data from _publishers_.  _Consumers_ can _subscribe_ to topics to access their data. 
  * _topics_ are an immutable log of events(made by publishers). _Topics_ are like Database table or a folder. Every _message_ goes to a particular _topic_. _Topics_ are made up of multiple _partitions_. _Partitions_ mean redundancy & make the topic horizontally scalable. Messages are appended to a particular _partition_ by the _producer_

# Kafka Producer
* _Producers_ create new _messages_, batch them and send them to a _Kafka topic_.

# Kafka Consumer
* _Consumer_ reads _messages_ from a broker.

# Kafka Broker
* A single Kafka server is called a _Broker_. A _Broker_ can handle thousands of partitions & millions of messages/per second. Broker = bridge. 
* It receives messages from producers & handles fetch requests from consumers. A _broker_ is part of a _Kafka Cluster_

# Kafka Cluster
* A _Kafka Cluster_ consists of several _brokers_.
* One _broker_ is the cluster controller and is elected automatically.
* A _Kafka cluster_ lets you replicate messages in a given partition.
# Kafka Based APIs
* __Kafka-based APIs__ are suitable for software that requires real-time data streaming, processing, and monitoring.  They are also great at handling high volumes of data. Kafka architecture uses five APIs:
    1. __Producer API__: publishes streams of a record to Kafka topics.
    2. __Consumer API__: used to subscribe to topics and process their streams of records.
    3. __Streams API__: allows applications to act as stream processors by transforming an input stream into an output stream for different output topics.
    4. __Connector API__: allows users to automate adding another app or data system to current Kafka topics.
    5. __Admin API__: used for managing and monitoring topics and other Kafka objects.


# Definition Of Terms
1. __Kafka Streams__: Part of what makes Kafka so powerful is __Kafka Streams__. The __Streams API__, available as a Java library, is the easiest way to write real-time apps and microservices. But, what if you prefer not to use Java? Or you want to use a more familiar query language like SQL?

2. __Fault-tolerant__: In a 5-node Kafka cluster, you can have it continue working even if 2 of the nodes are down. It is worth noting that fault-tolerance is at a direct tradeoff with performance, as in the more fault-tolerant your system is, the less performant it is.

3. __Commit Log (transaction log)__: a persistent ordered data structure which only supports appends. You cannot modify nor delete records from it. It is read from left to right and guarantees item ordering.

# How Kafka Works
Applications (__producers__) send messages (__records__) to a Kafka node (__broker__) and said messages are processed by other applications called __consumers__. Said messages get stored in a __topic__ and __consumers__ subscribe to the topic to receive new messages. As topics can get quite big, they get split into __partitions__ of a smaller size for better performance and scalability.

__Kafka__ follows the principle of a __dumb broker__ and __smart consumer__. This means that Kafka does not keep track of what records are read by the consumer and delete them but rather stores them a set amount of time (e.g one day) or until some size threshold is met. Consumers themselves poll Kafka for new messages and say what records they want to read. This allows them to increment/decrement the offset they’re at as they wish, thus being able to replay and reprocess events.

__Kafka__ stores all of its records to disk and does not keep anything in RAM. 



# When not to use Apache Kafka?
* Kafka is NOT hard real-time. The definition of the term “real-time” is difficult. It is often a marketing term. Real-time programs must guarantee a response within specified time constraints.
* If your application requires sub-millisecond latency, Kafka is not the right technology. For instance, high-frequency trading is usually implemented with purpose-built proprietary commercial solutions.

# Main Use Cases for Kafka
1. _Website Activity Tracking_: 
  * This was the original use case for Kafka by LinkedIn. 
  * Events happening in the website like page views, conversions etc. are sent via a Gateway and piped to Kafka Topics.
  * Kafka is used as an initial buffer as the Data amounts are usually big and Kafka guarantees no message loss due to its replication mechanisms.

2. __Database Replication__: 
   * Database Commit log is piped to a Kafka topic.

3. __Stream Processing__: 
   * Instead of piping Data to a certain storage downstream we mount a Stream Processing Framework on top of Kafka Topics.
   * The Data is filtered, enriched and then piped to the downstream systems to be further used according to the use case.

4. __Mesaging__: 