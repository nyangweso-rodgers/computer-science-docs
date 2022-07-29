# REST (Representational State Transfer)
## Table of Contents
1. [REST Overview](#REST-Overview)
2. [Advantages of REST](#Advantages-of-REST)
3. [Cons of REST](#Cons-of-REST)
4. [5 Principles of REST APIs](#API-Principles)
- [When to Use REST APIs](#When-to-Use-REST-APIs)
- [References]()
    - [How not to blow your REST interview](https://medium.com/future-vision/the-principles-of-rest-6b00deac91b3)

# REST Overview
* __REST__ is an architectural style that has gained a lot of popularity in recent years due to its _simplicity_ and _scalability_. Before __REST__ gained popularity, __SOAP__ was the de-facto way of accessing resources and communicating over the web.

* a __RESTful API (RESTful web service)__ is based on __Representational State Transfer (REST)__ technology, which is an architectural style and approach to communication often used in web service development. __RESTful API__ is mostly used for HTTP web APIs where there is no need for any additional or package to be installed.

*__REST APIs__ operate on a simple request/response system. You can send a request using these __HTTP__ methods:
    * GET
    * POST
    * PUT
    * PATCH
    * DELETE

# Advantages of REST
* _REST is Easy to Understand and Implement:_ __REST__ is meant to work over __HTTP__ (actually HTTP was influenced by REST). Therefore it makes use of HTTP verbs such as GET, POST, and PUT.
* _REST Makes your Application More Scalable:_ There are 2 main reasons why __REST__ can help make your application more scalable:
    - _No State:_ one of the core principles of __REST__ is that it's __stateless__ on the __server-side__. Therefore each request will be processed independently from the previous ones. In applications with a server-side state or sessions, a session is stored for possibly every logged-in user. This session data can easily get bloated and start to occupy a lot of resources on the server. On the other hand, __stateless__ servers only keep resources (memory) occupied when they are handling a request and they free it as soon as the request is processed. Since the current trend in scalability is horizontal scaling (typically on the cloud), storing server-side sessions can also make it hard to scale your application because it creates some difficult problems.

    - _Faster Data Interchange Format:_ __RESTful APIs__ typically use __JSON__ as the data interchange format. __JSON__ is much more compact and smaller in size compared to __XML__. It can also be parsed faster than __XML__.

* _Caching is Easier with REST:_ Caching is a critical factor for the scalability and performance of a modern web application. A well-established cache mechanism (with the best hit-rates possible) can drastically decrease the average response time of your server. __REST__ aims to make caching easier. Since the server is stateless and each request can be processed individually, __GET requests__ should usually return the same response regardless of previous ones and the session. This makes the GET requests easily cacheable and browsers usually treat them as such. We can also make our __POST requests__ cacheable using __Cache-Control__ and __Expires headers__.

* _REST is Flexibile:_ i.e., it's easy to modify and it's also able to answer many clients who can ask for different data types (XML, JSON, and so on). The client can specify the type using the Accept header and the __REST API__ can return different responses depending on that. __REST__ has the ability to handle multiple types of requests and return different types of data (such as JSON and XML)

# Cons of REST
* Where REST APIs fall short is that their rich metadata creates big payloads that can sometimes cause more trouble than they’re worth. You can get over- and under-fetching problems that require further API requests, bogging down the process.
# The 5 Principles of REST
1. __Contract first approach / Uniform Resource Identifiers (URI/URL)__: i.e., __uniform interface__: The specification of the API is a contract between the app and the server. the app needs to know that it can hit the same URI to get a particular piece of data, every-time! It also needs to know that it’ll get the data in the format that it expects, and that format will not change. This is the Contract and the URI.
2. __Statelessness__: The server should have no knowledge of prior requests. The client needs to provide all the information necessary for the server to provide a response.
3. __Client-Server model__: The app doesn’t need to bother about how the server stores data, the particular database used, the tech stack, etc. The point of intersection between the server and the app is the database schema. The database schema contains a description of the data stored and the layout in which it is stored. The schema should be hosted on the developer portal as part of the API documentation.
4. __Caching__: Caching is the temporary storage of information outside of the server. In between the client and the server, there are many points of presence where the cache can be stored:
    *  The cache can be stored near the server like an __API gateway cache__ on AWS. 
    * The cache can be stored somewhere in the middle between the client and the server using a 3rd party solution or using a hierarchy of proxy servers that just holds cache data, and are called __caching proxy servers__. This is usually a shared cache so this cache can be shared by many clients. 
    * Lastly, the cache can be stored on the client/in the app/on the device. It is not shared and is only available to the client. This is called a __private cache__.
5. __Layered architecture__: The app calls the API gateway which hosts the endpoint. The gateway routes the request to a compute node (EC2 in case of AWS) or a serverless function (Lambda in AWS). This is layered architecture. Each layer only knows about the layer next to it, and no more. This promotes separation-of-concerns. Each layer is responsible for a specific role. It knows how to do its job, and passes information to and from its immediate neighboring layer to get the job done. 
# When to Use REST APIs
__REST APIs__ are a good fit for projects that need to be
* Flexible
* Scalable
* Fast