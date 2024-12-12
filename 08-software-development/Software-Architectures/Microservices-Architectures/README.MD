#  Microservices Architecture

## Table of Contents
- [Introduction to Microservices](#Introduction-to-Microservices)

- [Characteristics of Microservices](#Characteristics-of-Microservices)

- [Benefits of a Microservices Architecture](#Benefits-of-a-Microservices-Architecture)

- [How Microservices Work](#How-Microservices-Work)

- [Common Patterns and Technologies Used for Microservices Design](#Common-Patterns-and-Technologies-Used-for-Microservices-Design)

# Introduction to Microservices Architecture
* __Microservices__: generally meant to describe an approach to __software development__ that involves de-composing application functionality into individual components that can be deployed separately from each other, and typically communicate via __APIs__. 

# Characteristics of Microservices
- Support HTTP/REST protocols
- Implement JSON or XML format for data exchange
- Deployed via a __containerization__ framework, such as __Docker__
- Dynamically scaled on public or private cloud infrastructure
- Often use noSQL or microSQL or key value stores to persist data

# Benefits of a Microservices Architecture
- Improved resilience and fault tolerance due to service function isolation
- Improved scalability with the ability to individually scale services as needed
- Extreme reusability with standardized interface definitions
- Easier polyglot support since separate services can be built in different programming languages
- Easier migration since services can be re-architected or re-built with different technologies while supporting the same API definition to minimize disruption.

# How Microservices Work
* __Microservices architecture__ is based on the principle of separation of concerns. This means that each __microservice__ should have a single responsibility and be self-contained. This allows each service to be developed, deployed, and scaled independently from the others.

* These __microservices__ are built on the concept of “dumb pipes” and “smart endpoints”. This means each microservice should expose a simple interface that can be called by other services. The microservice should then process the request and return the response. This allows each microservice to be developed independently and makes it easier to scale and deploy services. 

* Since __microservices application development__ is a concept rather than a specific technology, there is no one right way to build microservices. However, there are a few common patterns and technologies that are often used as shown below.

# Common Patterns and Technologies Used for Microservices Design
* __Service discovery__: Microservices can find and communicate with each other using service discovery. This allows services to be registered and located dynamically.

* __API gateway__: An API gateway is a single point of entry for all requests to a microservices architecture. The API gateway routes send a request to the appropriate service and can also perform tasks such as authentication and rate-limiting.

* __Event sourcing__: Event sourcing is a pattern in which events are used to store and retrieve data. This allows for a complete history of all events to be stored, which can be used to recreate the state of an application at any given point in time.