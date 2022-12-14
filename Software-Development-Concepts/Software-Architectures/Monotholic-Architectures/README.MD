# Monotholic Architectures

## Table of Contents
- [Introduction to Monolithic Architectures](#Introduction-to-Monolithic-Architectures)

- [Situations to Use Monotholic Architectures](#Situations-to-Use-Monotholic-Architectures)

- [Problems in monolithic application](#Problems-in-monolithic-application)

# Introduction to Monolithic Architectures
* The opposite of a __microservices__ approach would be a “__monolithic__” application where all functionality is part of a single program running in a single environment. 

* A __monolithic architecture__ is one in which all the components of an application are built as a single unit. This means all the code for an application is stored in a single codebase. __Monolithic software applications__ consist of a _user interface_, a _business logic layer_, and a _data storage layer_. All of these components are tightly coupled, which means changes to one component can affect the other components.

# Situations to Use Monotholic Architectures
* __You want to build a simple application__: If you’re building a simple application with few dependencies, a monolithic architecture may be the best choice. You can quickly build and deploy a monolithic application without having to worry about managing multiple services.

* __Your application doesn’t need to be highly scalable__: Microservices are great for applications that may need to scale quickly. If this doesn’t seem likely to be the case for your application, a monolithic architecture may be the simpler choice.

* __Your team is small__: While microservices have many advantages, they can also be quite complex to manage. If your team is small and you want to avoid this complexity, a monolithic architecture may be the best choice.

* __You don’t have experience with microservices__: If your team doesn’t have experience with microservices and you want to avoid the learning curve, then it may be best to stick to what they know until they have the necessary skill set.

# Problems in monolithic application
- There is a team of developers working on the application : Modules dependency & every developer needs to understand each & every modules.
- We need that new team members must quickly become productive
- The application must be easy to understand and modify
- We want to practice continuous deployment of the application
- We must run multiple instances of the application on multiple machines in order to satisfy scalability and availability requirements
- We not able to take advantage of emerging technologies (frameworks, programming languages, etc)
