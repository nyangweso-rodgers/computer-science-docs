# Messaging Broker Services

## Table Of Contents
- [Overview Of Broker Service](#Overview-Of-Broker-Service)

- [Microservice Communication: Synchronous and Asynchronous](#Microservice-Communication:-Synchronous-and-Asynchronous)
    - [Advantages Of Asynchronous Communication](#Advantages-Of-Asynchronous-Communication)

- [Choosing the Right Message Broker](#Choosing-the-Right-Message-Broker)
    - [Comparing Different Message Brokers](#Comparing-Different-Message-Brokers)
    - [Message Brokers per Use Case](#Message-Brokers-per-Use-Case)

- [References]()
    - [Redis vs Kafka vs ReabbitMQ](https://medium.com/@codeeverywhere/redis-vs-kafka-vs-rabbitmq-43eeec82bafb)

# Overview Of Broker Service
__Broker Service__: When using asynchronous communication for Microservices, it is common to use a message broker. A __broker__ ensures communication between different microservices is reliable and stable, that the messages are managed and monitored within the system and that messages don’t get lost. There are a few message brokers you can choose from, varying in scale and data capabilities. e.g., 
    - RabbitMQ
    - Kafka
    - Redis

# Microservice Communication: Synchronous and Asynchronous
In a __Synchronous communication__, the caller waits for a response before sending the next message, and it operates as a __REST protocol__ on top of __HTTP__. On the contrary, in __Asynchronous communication__, the messages are sent without waiting for a response. This is suited for distributed systems and usually requires a __message broker__ to manage the messages.

The type of communication you choose should consider different parameters, such as how you structure your Microservices, what infrastructure you have in place, latency, scale, dependencies and the purpose of the communication. Asynchronous communication may be more complicated to establish and requires adding more components to the stack, but the advantages of using Asynchronous communication for Microservices outweigh the cons.

# Advantages Of Asynchronous Communication
* asynchronous communication is non-blocking by definition. It also supports better scaling than Synchronous operations. 
* in the event of Microservice crashes, Asynchronous communication mechanisms provide various recovery techniques and are generally better at handling errors pertaining to the crash
* In addition, when using brokers instead of a REST protocol, the services receiving communication don’t really need to know each other. A new service can even be introduced after an old one has been running for a long time, i.e better decoupling services.
*  when choosing Asynchronous operations, you increase your capability of creating a central discovery, monitoring, load balancing, or even policy enforcer in the future. This will provide you with abilities for flexibility, scalability and more capabilities in your code and system building.

# Choosing the Right Message Broker
* __Asynchronous communication__ is usually managed through a message broker. There are other ways as well, such as aysncio, but they’re more scarce and limited.
* When choosing a broker for executing your asynchronous operations, you should consider a few things:
    - __Broker Scale__:  number of messages sent per second in the system.
    - __Data Persitency__: ability to recover messages.
    - __Consumer Capability__: Whether the broker is capable of managing one-to-one and/or one-to-many consumers.

# Comparing Different Message Brokers
Consideration | RabbitMQ (AMQP) | Kafka | Redis
|------------- | ----------------- | ---------------- | -------------- |
Scale | based on configuration and resources, the ballpark here is around 50K msg per second. | can send up to a million messages per second. | can send up to a million messages per second.
Persistency | both persistent and transient messages are supported. | yes | basically, no — it’s an in-memory datastore.
One-to-one vs one-to-many consumers | both | only one-to-many (seems strange at first glance, right?!). | both

# Message Brokers per Use Case
1. __Short-lived Messages: Redis__: Redis’s in-memory database is an almost perfect fit for use-cases with short-lived messages where persistence isn’t required. Because it provides extremely fast service and in-memory capabilities, Redis is the perfect candidate for short retention messages where persistence isn’t so important and you can tolerate some loss. With the release of Redis streams in 5.0, it’s also a candidate for one-to-many use cases, which was definitely needed due to limitations and old pub-sub capabilities.

2. __Large Amounts of Data: Kafka__: Kafka is a high throughput distributed queue that’s built for storing a large amount of data for long periods of time. Kafka is ideal for one to many use cases where persistency is required.

3. __Complex Routing: RabbitMQ__: RabbitMQ is an older, yet mature broker with a lot of features and capabilities that support complex routing. It will even support complex routing communication when the required rate is not high (more than a few tens of thousands msg/sec).
