# REST
## Table of Contents
- [REST Overview](#REST-Overview)
- [API Priciples](#API-Principles)
- [Advantages of REST](#Advantages-of-REST)
- [When to Use REST APIs](#When-to-Use-REST-APIs)

# REST Overview
__Representational State Transfer (REST)__ is an architectural style that has gained a lot of popularity in recent years due to its _simplicity_ and _scalability_. Before __REST__ gained popularity, __SOAP__ was the de-facto way of accessing resources and communicating over the web.

a __RESTful API (RESTful web service)__ is based on __Representational State Transfer (REST)__ technology, which is an architectural style and approach to communication often used in web service development. __RESTful API__ is mostly used for HTTP web APIs where there is no need for any additional or package to be installed.

__REST APIs__ operate on a simple request/response system. You can send a request using these __HTTP__ methods:
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

# When to Use REST APIs
__REST APIs__ are a good fit for projects that need to be
* Flexible
* Scalable
* Fast