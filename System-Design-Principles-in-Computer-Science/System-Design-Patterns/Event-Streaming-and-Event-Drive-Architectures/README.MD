# Event Streaming and Event-Driven Architectures

# Overview of Event Streaming and Event-Driven Architectures
* As applications become more complex, there has been a need to break them into different microservices distributed across different data centers. This concept is referred to as __Event Driven Architecture__. i.e., instead of parts of an application directly asking each other for update, they publish _events_ to _events streams_. Other parts of the application continuously subscribe to these streams and only act when they receive an event that they are interested in.

* __Kafka__ has become one of the most popular ways to implement _event streaming and event-driven architectures_