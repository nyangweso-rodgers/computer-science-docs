# Apache Kafka

## Table of Contents
- [Further Reading]()
  - [freeCodeCamp The Apache Kafka Handbook – How to Get Started Using Kafka](https://www.freecodecamp.org/news/apache-kafka-handbook/)


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

4. __Mesaging__: E.g.,
   - alerting passengers on the flight delays


# Core Concept: Kafka

# Concept 1: Event Messages
* When you write or read data to/from _Kafka_,, you do this in the form of _messages_.
* A _message_ consists of the following:
    1. key
    2. value
    3. timestamp
    4. compression type
    5. headers for metadata (optional)
    6. partition and offset id (once the message is written to a topic)

* Every _event_ in _Kafka_ is, at its simplest, a _key-value_ pair. These are serialized into binary, since _Kafka_ itself handles arrays of bytes rather than complex language-specific objects.

* __Keys__ are usually strings or integers and aren't unique for every message. Instead, they point to a particular entity in the system, such as a specific user, order, or device. Keys can be null, but when they are included they are used for dividing topics into partitions.
  
* The message __value__ contains details about the event that happened. This could be as simple as a string or as complex as an object with many nested properties. Values can be null, but usually aren't.

* By default, the __timestamp__ records when the message was created. You can overwrite this if your event actually occurred earlier and you want to record that time instead.

* __Messages__ are usually small (less than 1 MB) and sent in a standard data format, such as `JSON`, `Avro`, or `Protobuf`. Even so, they can be compressed to save on data. The compression type can be set to `gzip`, `lz4`, `snappy`, `zstd`, or `none`.

* Events can also optionally have __headers__, which are __key-value__ pairs of strings containing metadata, such as where the event originated from or where you want it routed to.

* Once a message is sent into a __Kafka topic__, it also receives a _partition number_ and _offset id_ 

# Concept 2: Topics in Kafka
* Kafka stores messages in a __topic__, an _ordered sequence of events_, also called an __event log__.


* Different __topics__ are identified by their names and will store different kinds of events. For example a social media application might have `posts`, `likes`, and `comments` __topics__ to record every time a user creates a post, likes a post, or leaves a comment.

* Multiple applications can write to and read from the same topic. An application might also read messages from one topic, filter or transform the data, and then write the result to another topic.

* One important feature of __topics__ is that they are _append-only_. When you write a message to a topic, it's added to the end of the log. Events in a topic are immutable. Once they're written to a topic, you can't change them.

* Unlike with __messaging queues__, reading an event from a __topic__ doesn't delete it. Events can be read as often as needed, perhaps several times by multiple different applications.

* __Topics__ are also durable, holding onto messages for a specific period (by default 7 days) by saving them to physical storage on disk.

* You can configure topics so that messages expire after a certain amount of time, or when a certain amount of storage is exceeded. You can even store messages indefinitely as long as you can pay for the storage costs.

# Concept 3: Partitions in Kafka
* In order to help Kafka to scale, topics can be divided into __partitions__. This breaks up the event log into multiple logs, each of which lives on a separate node in the Kafka cluster. This means that the work of writing and storing messages can be spread across multiple machines.

* When you create a topic, you specify the amount of __partitions__ it has. The __partitions__ are themselves numbered, starting at 0. When a new event is written to a topic, it's appended to one of the topic's __partitions__.

* If messages have no key, they will be evenly distributed among __partitions__ in a round robin manner: partition 0, then partition 1, then partition 2, and so on. This way, all partitions get an even share of the data but there's no guarantee about the ordering of messages.

* Messages that have the same key will always be sent to the same partition, and in the same order. The key is run through a hashing function which turns it into an integer. This output is then used to select a partition.

* Messages within each partition are guaranteed to be ordered. For example, all messages with the same `customer_id` as their key will be sent to the same partition in the order in which Kafka received them.

# Concept 4: Offsets in Kafka
* Each message in a partition gets an id that is an incrementing integer, called an __offset__. 
* __Offsets__ start at 0 and are incremented every time Kafka writes a message to a partition. This means that each message in a given partition has a unique offset.

* __Offsets__ are not reused, even when older messages get deleted. They continue to increment, giving each new message in the partition a unique id.

* When data is read from a partition, it is read in order from the lowest existing offset upwards.

# Concept 5: Brokers in Kafka
* A single "server" running Kafka is called a __broker__. In reality, this might be a Docker container running in a virtual machine. But it can be a helpful mental image to think of brokers as individual servers.

* Multiple brokers working together make up a Kafka cluster. There might be a handful of brokers in a cluster, or more than 100. When a client application connects to one broker, Kafka automatically connects it to every broker in the cluster.

* By running as a cluster, Kafka becomes more scalable and fault-tolerant. If one broker fails, the others will take over its work to ensure there is no downtime or data loss.

* Each broker manages a set of partitions and handles requests to write data to or read data from these partitions. Partitions for a given topic will be spread evenly across the brokers in a cluster to help with load balancing. Brokers also manage replicating partitions to keep their data backed up.

# Concept 6: Replication in Kafka
* To protect against data loss if a broker fails, Kafka writes the same data to copies of a partition on multiple brokers. This is called __replication__.
* The main copy of a partition is called the __leader__, while the replicas are called __followers__.

* When a topic is created, you set a replication factor for it. This controls how many replicas get written to. A replication factor of three is common, meaning data gets written to one leader and replicated to two followers. So even if two brokers failed, your data would still be safe.

* Whenever you write messages to a partition, you're writing to the leader partition. Kafka then automatically copies these messages to the followers. As such, the logs on the followers will have the same messages and offsets as on the leader.

* __Followers__ that are up to date with the __leader__ are called __In-Sync Replicas__ (ISRs). Kafka considers a message to be committed once a minimum number of replicas have saved it to their logs. You can configure this to get higher throughput at the expense of less certainty that a message has been backed up.

# Concept 7: Producers in Kafka
* __Producers__ are client applications that write events to Kafka topics. These apps aren't themselves part of Kafka – you write them.

* Usually you will use a library to help manage writing events to Kafka. There is an official client library for Java as well as dozens of community-supported libraries for languages such as Scala, JavaScript, Go, Rust, Python, C#, and C++.

# Concept 8: Consumers in Kafka
* __Consumers__ are client applications that read messages from topics in a Kafka cluster. Like with producers, you write these applications yourself and can make use of client libraries to support the programming language your application is built with.

* It's important to remember that reading a message does not delete it. The message is still available to be read by any other consumer that needs to access it. It's normal for multiple consumers to read from the same topic if they each have uses for the data in it.

* By default, when a consumer starts up it will read from the current offset in a partition. But consumers can also be configured to go back and read from the oldest existing offset.

* __Consumers__ deserialize messages, converting them from binary into a collection of key-value pairs that your application can then work with. The format of a message should not change during a topic's lifetime or your producers and consumers won't be able to serialize and deserialize it correctly.

* __NOTE__: _consumers request messages from Kafka, it doesn't push messages to them. This protects consumers from becoming overwhelmed if Kafka is handling a high volume of messages. If you want to scale consumers, you can run multiple instances of a consumer together in a __consumer group__._

# Concept 9: Consumer Groups in Kafka
* An application that reads from Kafka can create multiple instances of the same consumer to split up the work of reading from different partitions in a topic. These consumers work together as a __consumer group__.

* When you create a consumer, you can assign it a group id. All consumers in a group will have the same group id.

* You can create consumer instances in a group up to the number of partitions in a topic. So if you have a topic with 5 partitions, you can create up to 5 instances of the same consumer in a consumer group. If you ever have more consumers in a group than partitions, the extra consumer will remain idle.

* If you add another __consumer__ instance to a consumer group, Kafka will automatically redistribute the partitions among the consumers in a process called __rebalancing__.

* Each partition is only assigned to one consumer in a group, but a consumer can read from multiple partitions. Also, multiple different consumer groups (meaning different applications) can read from the same topic at the same time.

* Kafka brokers use an internal topic called `__consumer_offsets` to keep track of which messages a specific consumer group has successfully processed.

* As a consumer reads from a partition, it regularly saves the offset it has read up to and sends this data to the broker it is reading from. This is called the __consumer offset__ and is handled automatically by most client libraries.

* If a consumer crashes, the consumer offset helps the remaining consumers to know where to start from when they take over reading from the partition.

* The same thing happens if a new consumer is added to the group. The consumer group rebalances, the new consumer is assigned a partition, and it picks up reading from the consumer offset of that partition.

# Concept 10: Kafka Zookeeper
* [Zookeeper](https://zookeeper.apache.org/) is a service for managing and synchronizing distributed systems, like Kafka. Like Kafka, it's maintained by the Apache Foundation.  

* Kafka uses Zookeeper to manage the brokers in a cluster, and requires Zookeeper even if you're running a Kafka cluster with only one broker.

* Zookeeper keeps track of things like:
  * Which brokers are part of a Kafka cluster
  * Which broker is the leader for a given partition
  * How topics are configured, such as the number of partitions and the location of replicas
  * Consumer groups and their members
  * Access Control Lists – who is allowed to write to and read from each topic