# ksqlDB

## Table of Contents

# Introduction to ksqlDB
__ksqlDB__ is a database that's purpose-built for stream processing applications. 

__KsqlDb__ performs continuous transformations (aggregations and joins) of the data entering __Kafka__. The result of a query will therefore theoretically have no end. This is an evolution of __KSQL__, _an SQL engine for abstracting the consumption of streaming data from Kafka stream_. It provides an interactive, easy to use and powerful SQL interface for processing Kafka data streams. It is also elastic and fault tolerant. __KSQL__ allows the following actions:
* __Aggregation__ 👉 Returns the average value for a given column
* __Join__ 👉 A ksql join is similar to a database join in that they both combine tables from two or more sources based on common values
* __Push Queries__ 👉 Sending a continuous stream of updates to the Ksql table. The result of this instruction is not sent by default to a Kafka topic but directly to standard output.
* __Windowing__ 👉 In Ksql, a record is an immutable representation of an event over time. Each recording has a timestamp that determines its position in time.

__KSQLDB__ also provides support for:
* __Pull Queries__ 👉 Unlike the Push query which consumes the results indefinitely, the Pull query retrieves a finished result as with a traditional database. This feature contains some limitations in terms of throughput, consistency, performance and SLA.
* __Kafka Connect__ 👉 Scalably and reliably connects other data sources to Kafka, databases for example

# References
1. [ksqldb.io](https://ksqldb.io/)
2. [ksqldb, which benefits and risks](https://medium.com/@david.alvares.62/confluent-ksqldb-wich-benefits-and-risks-ae9ef819f216)