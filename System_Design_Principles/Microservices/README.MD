#  Microservices
## Table of Contents
- [Introduction to Microservices](#Introduction-to-Microservices)
- [Characteristics of Microservices](#Characteristics-of-Microservices)
- [Benefits of a Microservices Architecture](#Benefits-of-a-Microservices-Architecture)

# Introduction to Microservices
__Microservices__: generally meant to describe an approach to __software development__ that involves de-composing application functionality into individual components that can be deployed separately from each other, and typically communicate via __application programming interfaces__ or __APIs__. 

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
- Easier migration since services can be re-architected or re-built with different technologies while supporting the same API definition to minimize disruption

The opposite of a __microservices__ approach would be a “__monolithic__” application where all functionality is part of a single program running in a single environment. __Problem in monolithic application__:
- There is a team of developers working on the application : Modules dependency & every developer needs to understand each & every modules.
- We need that new team members must quickly become productive
- The application must be easy to understand and modify
- We want to practice continuous deployment of the application
- We must run multiple instances of the application on multiple machines in order to satisfy scalability and availability requirements
- We not able to take advantage of emerging technologies (frameworks, programming languages, etc)
