# Pub-Sub (Publish/Subscribe)

## Table Of Contents
- [Introduction to Publish/Subscribe Pattern Based APIs](#Introduction-to-Publish/Subscribe-Pattern-Based-APIs)
- [How Pub/Sub Pattern Based APIs Work](#How-Pub/Sub-Pattern-Based-APIs-Work)
- [When to Use Pub/Sub Pattern Based APIs](#When-to-Use-Pub/Sub-Pattern-Based-APIs)

# Introduction to Pub-Sub
* __Pub/Sub__ is an asynchronous messaging style used in __serverless__ and __microservices__ architectures. With this model, messages are not sent to a specific subscriber but are instead categorized to be available to all subscribers of the category.

# How Pub/Sub Pattern Based APIs Work
* The main characteristic of __Pub/Sub APIs__ is the existence of __publishers__ and __subscribers__, as the name implies. __Publishers__ categorize messages and those that are __subscribed__ to a specified category receive that message.

* __Kafka APIs__ are considered to be a type of __Pub/Sub__ based APIs. Other types of APIs and microservices can also be built around a Pub/Sub system, including REST APIs.

# When to Use Pub/Sub Pattern Based APIs
* __Pub/Sub__ based APIs are a great addition to architecture systems that involve many independent or decoupled components.

* __Pub/Sub based APIs__ can be used to provide event-driven notifications as a result of specific events that occur within the system. This style of system is also highly scalable compared to more traditional client-server infrastructure.