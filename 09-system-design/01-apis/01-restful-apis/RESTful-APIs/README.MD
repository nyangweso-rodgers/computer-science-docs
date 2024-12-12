# REST(Representational State Transfer) APIs

## Table of Contents
1. [Overview of REST](#Overview-of-REST)
    - [Advantages of REST](#Advantages-of-REST)
    - [Cons of REST](#Cons-of-REST)

[References]()
    - [Fundamentals of REST API](https://dev.to/cassiocappellari/fundamentals-of-rest-api-2nag)

# Overview of REST
* __REST__ is an architecture style to develop web services, which uses the __HTTP protocol__ as a communication interface in order to transfer data through __HTTP methods__. 
* __REST__ has gained a lot of popularity in recent years due to its 
    - _simplicity_, and 
    - _scalability_.

# Advantages of REST
* _REST is Easy to Understand and Implement:_ __REST__ is meant to work over __HTTP__ (actually HTTP was influenced by REST). Therefore it makes use of HTTP verbs such as GET, POST, and PUT.

* _REST Makes your Application More Scalable:_ There are 2 main reasons why __REST__ can help make your application more scalable:
    - _No State:_ one of the core principles of __REST__ is that it's __stateless__ on the __server-side__. Therefore each request will be processed independently from the previous ones. In applications with a server-side state or sessions, a session is stored for possibly every logged-in user. This session data can easily get bloated and start to occupy a lot of resources on the server. On the other hand, __stateless__ servers only keep resources (memory) occupied when they are handling a request and they free it as soon as the request is processed. Since the current trend in scalability is horizontal scaling (typically on the cloud), storing server-side sessions can also make it hard to scale your application because it creates some difficult problems.

    - _Faster Data Interchange Format:_ __RESTful APIs__ typically use __JSON__ as the data interchange format. __JSON__ is much more compact and smaller in size compared to __XML__. It can also be parsed faster than __XML__.

* _Caching is Easier with REST:_ Caching is a critical factor for the scalability and performance of a modern web application. A well-established cache mechanism (with the best hit-rates possible) can drastically decrease the average response time of your server. __REST__ aims to make caching easier. Since the server is stateless and each request can be processed individually, __GET requests__ should usually return the same response regardless of previous ones and the session. This makes the GET requests easily cacheable and browsers usually treat them as such. We can also make our __POST requests__ cacheable using __Cache-Control__ and __Expires headers__.

* _REST is Flexibile:_ i.e., it's easy to modify and it's also able to answer many clients who can ask for different data types (XML, JSON, and so on). The client can specify the type using the Accept header and the __REST API__ can return different responses depending on that. __REST__ has the ability to handle multiple types of requests and return different types of data (such as JSON and XML)

# Cons of REST
* Where __REST APIs__ fall short is that their rich metadata creates big payloads that can sometimes cause more trouble than they’re worth. You can get over- and under-fetching problems that require further API requests, bogging down the process.

# 5 Principles of RESTful APIs
1. __Client-Server Model__: Separation of Concerns, i.e., the __Client__ that sends the request it’s completely independent from the __Server__ that returns the response.

2. __Cache__: _Cache_ is a computational storage structure focused on keeping stored data that is frequently accessed, improving performance and network efficiency. Therefore, through caching, it’s possible to reduce or even eliminate the need for the Client to send requests to the Server

3. __Uniform Interface__: Means how __Client__ and __Server__ will share information by defining an interface that must be followed in every request. i.e.,, it’s a contract between the Client and the Server that determines the standards for their communication. the app needs to know that it can hit the same URI to get a particular piece of data, every-time! It also needs to know that it’ll get the data in the format that it expects, and that format will not change. This is the Contract and the URI.

4. __Layered System/Architecture__: this relates to the fact that there can be more components and subsystems between a __Client__ and a __Server__. i.e., the client can’t assume that it is communicating directly to the Server, and don’t know about the complexity to process the request and return the response. Each layer only knows about the layer next to it, and no more. This promotes separation-of-concerns. Each layer is responsible for a specific role. It knows how to do its job, and passes information to and from its immediate neighboring layer to get the job done

5. __Statelessness__: The server should have no knowledge of prior requests. The client needs to provide all the information necessary for the server to provide a response.