# Web Services and APIs
# Table of Contents
- [Introduction to HTTP](#Introduction-to-HTTP)
    - [HTTP Methods](#HTTP-Methods)
    - [HTTP Status Messages](#HTTP-Status-Messages)
    - [HTTP Headers](#HTTP-Headers)
    - [HTTP Response](#HTTP-Response)

- [Introduction to Web Services and API](#Introduction-to-Web-Services-and-API)

- [Web Services](#Web-Services)
    - [Advantages of Web Services](#Advantages-of-Web-Services)
    - [Types of Web Services](#Types-of-Web-Services)
    - [Considerations of a web services](#Considerations-of-a-Web-Services)
    - [Secure web services](#Secure-Web-Services)

- [APIs](#APIs)
    - [Characteristics of APIs](#Characteristics-of-APIs)
    - [Classification of APIs](#Classification-of-APIs)
    - [Definition of Terms used in APIs](#Definition-of-Terms-used-in-APIs)
    - [List of various APIs](#List-of-various-APIs)


- [REST Overview](#REST-Overview)
    - [API Priciples](#API-Principles)
    - [Advantages of REST](#Advantages-of-REST)
    - [When to Use REST APIs](#When-to-Use-REST-APIs)

- [SOAP Overview](#Soap-Overview)
    - [Working of SOAP](#Working-of-SOAP)
    - [History of SOAP](#History-of-SOAP)
    - [Characteristics of SOAP](#Characteristics-of-SOAP)
    - [When to Use SOAP API](#When-to-Use-SOAP-API)

- [GraphQL Overview](#GraphQL-Overview)
    - [GraphQL Query Document](#GraphQL-Query-Document)
    - [GraphQL Type System](#GraphQL-Type-System)

- [APIs vs Webhooks](#APIs-vs-Webhooks)
    - [How Webhooks Work](#How-Webhooks-Work)
    - [When to use Webhhoks](#When-to-use-Webhhoks)
    - [Webhook Maturity](#Webhook-Maturity)

- [API Testing](#API-Testing)
    - [Types of API Testing](#Types-of-API-Testing)

- [API Optimizations](#API-Optimizations)

- [References](#References)

# Introduction to HTTP
1. __Protocol__: system of rules that allows communication of information between different entities, like computers
2. __Hypertext__: text displayed on a computer screen that contains hyperlinks to other text.
3. __Hypertext Transfer Protocol (HTTP)__: set of rules, servers and browsers used to transfer web documents back and forth
4. __Browser__: application used to access and navigate between __HTML__ documents.
5. __User Agent__: application acting on behalf of the user - literally an agent  of the user-typically a browser.
6. __Transmission Control Protocol (TCP)__: one of the main internet protocols used by the World Wide Web, email, FTP (File Transfer Protocol), and remote administration
7. __Internet Protocol (IP) Address__: used to actually transfer data between computers over a network. Every device connected to the internet has an __IP address__.
8. __Uniform Resource Locator (URL)__: address pointing at a resource on the web.
9. __Domain Name Server (DNS)__: catalogs all domain name . __URLs__ and points them to the __IP addresses__ of servers.
10. __Resource__: the file  or files available on a server when following a __URL__.
11. __Server__: computer on the internet running some form of data storage  and sharing application, most commonly web server application.
12. __Proxy__: software or hardware service acting as a middle person between clients and servers.
13. __Request-Response Pairs__: Clients and servers communicate over __HTTP__ using request - response pairs. A __request__ is sent and a __response__ is returned.
14. __Header__: requests and response use __HTTP headers__ to pass information back and forth.
15. __Status Response Code__: numerical code in the 100 to 500 range describing what type of response the server sent back to the client.
16. __Cache__: method for storing data on the __client__ or the __server__ to speed up performance. A __cache__ is a high speed data store which stores a part or the complete dataset so that future requests to the data are served faster. The data in a __cache__ is stored on a fast access hardware like __RAM__. Caching allows us to _efficiently reuse previously retrieved data_.  __Caching__ is leveraged at different layers of technology like:
    * Operating systems
    * CDN(Content Delivery Network)
    * DNS(Domain Name Systems)
    * Web Applications(APIs)
    * Databases e.t.c.

    __Caching__ information includes:
    * database query results
    * computationally intensive calculations
    * API requests/responses
    * data files like HTML, images or
    * any application data in general e.t.c

    In __distributed applications__ there are various caching __strategies__:
    * write-through: _in this policy, data is written to both the cache and the underlying data source. The order in which it is written is not important. The main idea is that the I/O operation is considered complete when the data is written to both the cache and the DB._
    * write-around: _in this policy, data is directly written to the underlying data source without disturbing the cache._
    * write-back: _in this policy, data is written only to the cache and the I/O operation is considered complete. Typically, data is written  to the underlying data source as well, but it is done asynchronously using a worker process._

     # Benefits of caching
    * improves application performance
    * reduced load on servers
    * reduced load on databases
    * eliminates database hotspots
    * increases Read Throughput(IOPS)
    * reduces bandwidth consumption

17. __Stateless__: __HTTP__ is a __stateless__ protocol, meaning every request and response is unique, and no state is stored.
18. __Cookie__: string of data passed back and forth between the __client__ and __server__ to create a __stateful__ session. By example. __cookies__ are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_. 
    # Mechanism Behind Cookies
    * server asks the browser to store this using a _Set-Cookie_ header.
    * browser and server pass this info to and fro as part of request and response headers
    * stores a name value pair and attributes like Expires, Domain, Path.
    * Cookie in the header when communicating from Browser to server.
    * Set-Cookie in the header when communicating from server to browser.
    * These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
    * It is used by numerous websites to track your online activities.

     # Types of Cookies
    * Session Cookies
    * Persistent/Permanent Cookies
    * Third Party Cookies
19. __Session__: Clients and servers can share information about states by passing information back and forth, creating a __session__.  __Session__ is a period with all the parameters that suggest you are active on the website.

20. __Payload__: When data is sent over the Internet, each unit transmitted includes both _header information_ and the _actual data_ being sent. The __header__ identifies the _source_ and _destination_ of the packet, while the actual data is referred to as the __payload__. Because header information, or overhead data, is only used in the transmission process, it is stripped from the packet when it reaches its destination. Therefore, the __payload__ is the only data received by the destination system.

# HTTP Methods

# HTTP Status Messages
* 1xx - Information
* 2xx - success
    - 200 - Ok
    - 201 - Created
    - 204 - No content
* 3xx - Redirection
    - 301 - Moved permanently
    - 302/303 - Found at this other __URI__
    - 307 - Temporary redirect
    - 308 - Permanent Redirect
* 4xx - Client Error
    - 400 - Bad Request
    - 401 - Unauthorized
    - 403 - Forbidden
    - 404 - Not found
    - 405 - Method not allowed
* 5xx - Server Error
    - 500 - Internal Server Error
    - 502 - Bad gateway
    - 503 - Service Unavailable

# HTTP Headers

# HTTP Response
* __The version__ identifies the __HTTP__ version, which will typically be the same as the request’s version.
* __The status code__ indicates whether a request was completed successfully. There are quite a few status codes.
* __The status message__ provides a human-readable message that helps describe the status code.
* __The headers__ allow the server to respond with additional metadata about the request. These are the same concept as request headers.
* __The body__ carries the content. Technically, this is optional, but typically it contains a useful resource.

# Introduction to Web Services and APIs
An __API__ is the gateway you pass through to access a __Web Service__. It is a central point of entry which routes your request to the correct, quite possibly multiple, __Web Service(s)__ in order to fulfil your request.

# Advantages of Web Services
* __Reusability of code__: _allow organisations to use web services provided by Third-parties_
* __Language Transparency__: _ability for services to communicate back and forth_ i.e., the service provider can write the web service in one language like PHP or NodeJs then the service client can be written in a totaly different language like Python, Ruby e.t.c.,. And they can still communicate using a common lanuage like XML or JSON.
* __Usability__: _ability to make the data more accessible to other services which can be used by a wide audiences and plarforms_
* __Deployability__: _deployed via standard internet technologies making them easily available on a global level_

# Types of Web Services
There are two types of __Web Services__:
1. __Simple Object Access Protocol (SOAP)__: sends messages using __XML__. An __XML__ document is sent with the data in a certain format
2. __Representational State Transfer (RESTful)__: uses __HTTP__ web protocol to access resources like documents, pictures or videos

# Considerations of a Web Services
* __Latency__: time it takes for a request to return a response. __Latency__ increases when client and server runs in two different machines.
* __Partial Failure__: when a server or network fails to respond. Normally happens when the server is loaded with requests and cannot respond.

# Secure Web Services
1. __Authentication__: validates the identity of a client e.g., username and a password
2. __Authorization__: this is the next step after __authorization__. it determines the _level of client's access_ 

# APIs
An __application programming interface (API)__  is a _computing interface which defines interactions between multiple software intermediaries_. It defines:
- the kinds of calls or requests that can be made,
- how to make them,
- the data formats that should be used,
- the conventions to follow, etc.

__APIs__ can come in many forms or shapes. They can be _operating system APIs_, used for actions like turning on your camera and audio for joining a Zoom call. Or they can be _web APIs_, used for web-focused actions such as liking images on your Instagram or fetching the latest tweets. No matter the type, all APIs function mostly the same way. You usually make a __request__ for information or data, and the API returns a __response__ with what you requested.

# Characteristics of APIs
* _APIs form a bridge for interactions between services_ e.g., mainframe and databases and customer-facing services. __APIs__ enable organizations to share information with external developers, business associates, and other teams within the organization.
* _APIs allow you to expose some functions of a program_. __APIs__ providers can share positions of their code with developers but do not have to release everything for new applications and services to be developed. __APIs__ from different providers can be combined by developers to create new applications.
* _A high-quality API facilitates the development of applications by allowing different functionalites to be created independently while offering a complete set of capabilities for development._

# Classification of APIs
__APIs__ are classified as follows based on how they are consumed:

1.  __External API__: Present the API provider or business an opportunity to share certain data sets, services, and capabilities with developers. This capability enables the use of business's assets to develop innovative, new applications and allows  for existing applications and services to be modified.They help foster relationships between internal and external developers and drive the creation of new application and services that are not possible without the business publicly sharing some of it's data and service.

2. __Partner API__: These __APIs__ are open to select business partners of a company. They are specifically designed for partners to be able to access business functions in context to the business relationship e.g., online catalog, ordering, and recommendation. In this type of __API__, typically the companies want to control who has access to the data they are exposing and want to have a greater control over how the data is used.

3. __Internal API__: Organizations use API internally or privately to develop new ways of operating and managing their businesses. These internal __APIs__ can be developed to more efficiently process internal documents, manage process, share information, account for assests, and other business processes in order to drive increased productivity.

# List of various APIs
1. [Random User Generator API](https://randomuser.me/) - generate random user data for application testing
2. [TheDogAPI](https://thedogapi.com/): you can fetch the different dog breeds and some images, but if you register, you can also cast votes on your favorite dogs.
3. [PlaceGOAT API](https://placegoat.com/) This is a very silly API that returns _images of goats_ in different sizes that you can use as placeholder images in your website.
4. [api-football](https://www.api-football.com/documentation-v3#section/Sample-Scripts/Php)

# Definition of Terms used in APIs
1. __base URL__: The base URL structure is no different from the URLs you use for browsing Google, YouTube, or Facebook, though it usually contains the word api. This is not mandatory, just more of a rule of thumb. e.g.,
    - https://api.twitter.com
    - https://api.github.com
    - https://api.stripe.com

2. __Endpoint__: is a _part of the URL that specifies what resource you want to fetch_. Well-documented APIs usually contain an __API reference__, which is extremely useful for knowing the exact endpoints and resources an API has and how to use them.

3. __Request and Response__: 
    - __Requests__ contain relevant data regarding your __API request__ call, such as the _base URL_, the _endpoint_, the _method_ used, the _headers_, and so on.
    - __Responses__ contain relevant data returned by the server, including the _data_ or _content_, the _status code_, and the _headers_

4. __? Operator__: This operator is used to specify the parameters we want to send to the __API__ or our “online function.” 
5. __Rate limiting__: is a technique which restricts the number of requests that users can make in a given time frame. Some APIs may actually block your IP or API keys if you go over the defined rate limit too often. 

    __Remark__: _Be careful not to exceed the limits set by the API developers. Otherwise, you might have to wait a while before calling that API again._

6. __API Response Status Codes__: Status codes are one of the most important pieces of information to look for in any __API response__. They tell you if your request was successful, if it’s missing data, if it’s missing credentials, and so on.

    | Status code |Meaning| Description 
    |:-----------: |:-------:| :-----------:| 
    200 | OK |Your request was successful!
    201 | Created | Your request was accepted and the resource was created.
    400 | Bad Request|Your request is either wrong or missing some information.
    401 | Unauthorized|Your request requires some additional permissions.
    404 | Not Found|The requested resource does not exist.
    405 | Method Not Allowed|The endpoint does not allow for that specific HTTP method.
    500 | Internal Server Error|Your request wasn’t expected and probably broke something on the server side.

7. __HTTP Headers__: are used to define a few parameters governing __requests__ and __responses__:

    HTTP Header | Description
    ----------|-----------------
    Accept|What type of content the client can accept
    Content-Type|What type of content the server will respond with
    User-Agent|What software the client is using to communicate with the server
    Server|What software the server is using to communicate with the client
    Authentication|Who is calling the API and what credentials they have

8. __HTTP Methods__: When calling an __API__, there are a few different __methods__, also called verbs, that you can use to specify what action you want to execute. For example, if you wanted to fetch some data, you’d use the method __GET__, and if you wanted to create some data, then you’d use the method __POST__. When purely consuming data using __APIs__, you’ll typically stick to __GET requests__, but here’s a list of the most common methods and their typical use case:

    HTTP Header | Description | Requests Method
    ----------|----------------- | ---------
    POST | Create a new resource | requests.post()
    GET | Read an existing Resource | requests.get()
    PUT | Update an existing resource | requests.put()
    DELETE | Delete an exsting resource | requests.delete()

    These four methods are typically referred to as __CRUD__ operations as they allow you to __create__, __read__, __update__ and __delete__ resources.

9. __Query Parameters__: Sometimes when you call an __API__, you get a ton of data that you don’t need or want. But in some cases, you might want to extract only certain information. That’s where __query parameters__ come in!

    To add a query parameter to a given __URL__, you have to add a question mark (?) before the first query parameter. If you want to have multiple query parameters in your request, then you can split them with an ampersand (&).

    In the __API__ world, __query parameters__ are used as filters you can send with your __API request__ to further narrow down the responses. Using __query parameters__, you can start fetching more specific data from an __API__, making the whole experience a bit more tailored to your needs.

10. __Authentication__: Authentication approaches range from the simplistic and straightforward, like those using __API keys__ or __Basic Authentication__, to much more complex and safer techniques, like __OAuth__. Typically, calling an __API__ without credentials or with the wrong ones will return a 401 Unauthorized or 403 Forbidden status code.
    - __API Keys__: This is the most common level of authentication. These keys are used to identify you as an __API__ user or customer and to trace your use of the API. API keys are typically sent as a _request header_ or as a _query parameter_.
    - __OAuth__: Every time an app or platform has a Login With or Continue With option, that’s the starting point of an OAuth flow:

11. __Pagination__: Sending lots of data back and forth between clients and servers comes with a price: bandwidth. To make sure that servers can cope with a lot of requests, APIs typically use __pagination__. In very simple terms, pagination is the act of splitting large amounts of data into multiple smaller pieces.

12. __API Key__: unique code for every user which lets you call an API. __API keys__ are used for both _autorization_ and _authentification_. __Authentification__ is used to identify the caller requesting API access and __authorization__ checks whether the user making the call has permission to do so.



# REST Overview
__Representational State Transfer (REST)__ is an architectural style that has gained a lot of popularity in recent years due to its _simplicity_ and _scalability_. Before __REST__ gained popularity, __SOAP__ was the de-facto way of accessing resources and communicating over the web.

a __RESTful API (RESTful web service)__ is based on __Representational State Transfer (REST)__ technology, which is an architectural style and approach to communication often used in web service development. __RESTful API__ is mostly used for HTTP web APIs where there is no need for any additional or package to be installed.

__REST APIs__ operate on a simple request/response system. You can send a request using these __HTTP__ methods:
* GET
* POST
* PUT
* PATCH
* DELETE

# API Principles
1. __Uniform Resource Identifier (URI)__
2. __Operations__
    - __GET__: Retrieves a resource
    - __POST__: Creates a resource
    - __PUT__: Updates a resource
    - __DELETE__: removes a resource
3. __Format__: rources can be represented in several formats like:
    - HTML
    - XML
    - Plain Text
4. __Stateless__: communication between client and endpoint is __stateless__ meaning the servier will not remember and store any state the client made.

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

# SOAP Overview
__SOAP (Simple Object Access Protocol)__ is a standardized protocal that relies on __XML__ to make _requests_ and _receive_ responses. Even though __SOAP__ is based on __XML__, the __SOAP__ protocol is still in wide usage.

__SOAP APIs__ make data available as a service and are typically used when performing transactions involving multiple API calls or applications where security is the primary consideration.


# Working of SOAP
The "S" in __SOAP__ stands for __Simple__, and for a good reason - __SOAP__ can be used with less complexity as it requires less coding in the app layer for transactions, security, and other functions.

# History of SOAP
__SOAP__ was initially developed for __Microsoft__ in __1998__ to provide a standard mechanism for intergrating services on the internet regardless of the operating system, object model, or programming language.

# Characteristics of SOAP
* __Extensibility of SOAP API__: __SOAP__ allows for extensions that introduce more robust features, such as Windows Server Security, Addressing, and more.
* __Neutrality of SOAP API__: __SOAP__ is capable of operating over a wide range of protocols, like UDP, JMS, SMTP, TCP, and HTTP.can operate.
* __Independence of SOAP API__: __SOAP API__ responses are purely based on __XML__. Therefore __SOAP APIs__ are platform and language independent.

# When to Use SOAP API
* __SOAP APIs__ remain a top choice for corporate entities and government organizatins that prioritize security, even though __REST__ has largely dominated web applications.
* __SOAP__ is more secure than __REST__ as it uses __WS-Security__ for transmission along with Secure Socket Layer.
* __SOAP__ also has more excellent transactional reliability, which is another reason why __SOAP__ historically has been favored by the banking industry and other large entities.

# GraphQL Overview
__GraphQL__. Created by Facebook, __GraphQL__ is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send. A __query language__ allows you to query data from the data store. 

# GraphQL Query Document
In __GraphQL__ a __query document__ is a _string sent to a server to process and request data_. __Query Document__ are read-only operations, and cannot be manipulated. The query tells the server what it needs to do. The __fields__ are what the server used to identify what data to return.

# GraphQL Type System
__GraphQL__ used a type system to describe data and is organized around three main buiding blocks:
1. __Schema__: defines a set of types
2. __Queries__: obtain information about a specific fields from objects
3. __Resolvers__: retrieve data

# APIs vs Webhooks
__Webhooks__ provide similar functionality as __APIs__ do but they work differently. With a standard __REST API__, you send a __request__ and get a __response__. However, no __request__ is required for a __Webhook__. Instead, the __response__ is sent whenever a specified event occurs.

# How Webhooks Work
When a specified event occurs, a __webhook__ makes an __HTTP request__ to a designated __URL__. This allows you to push data to your application the moment a particular event happens.

# When to use Webhhoks
* __Webhooks__ are commonly used when real-time data is required, but the data changes relatively infrequently. Instead of sending repeated __API requests__ to get live data, a __webhook__ can be triggered every time there is an update. This will ensure you have accurate data without having to make frequent __API requests__, which can be costly or use a lot of bandwidth.
* __Webhooks__ are also used to created notifications that are triggered by specific  events, making them very common for e-commerce, communication, social media and other platforms.

# Webhook Maturity
__Webhooks__ are the second most commonly used technology, right behind __REST APIs__. __Webhooks__ are also used by many of today's leading software companies including Twilio, Square, and MailChimp. 

# API Testing
__API Testing__ is performed to test wheather a particular API meets pre-deined parametsrs or not. It includes testing APIs in isolation to ascertain if they meet the:
* functionality, 
* reliability, 
* latency, 
* performance, 
* security, and other essesbtial parameters.

__API testing__ commonly includes testing APIs with __JSON__ or __XML__ payload sent over HTTP, HTTPS, and MQ. These are widely used data formats and networking/messaging protocols.

# Types of API Testing
__API testing__ is not a process that is carried out right away. It is divided into several categories which aim to test the API effectively so that the API can work in isolation, with integration, and produce the desired results to edge cases.
1. __Unit Testing:__ involves testing the individual operations of the API by lopgically divisdig them into units. __Unit testing__ helps to identify imperfections in the early stages. It typically inclues testing each part of the code seperately.
2. __Functional Testing:__ includes testing of all the functions in the codebase. It is often uses unit tests as tyhe building blocks.
3. __Load Testing:__ generally validates the functionality and performance of API under load. __Load Testing__ ensures whether an API will work as expected if multiple users are accessing the API concurrently.
4. __Runtime Error Detection__: can be performed manually or through automated testing. This testing includes monitoring an API by actually running the API entirely. It helps us to detect errors and exceptions and also prevent resource leaks.
5. __Security Testing__: this testing handles all the security aspects of an API, including external threats, validation, access control, and data encryption.
6. __Penetration Testing:__ includes testing an API to find vulnerabilities in the system or codebase that attackers can exploit. It also includes testing functions that could be misused and test security assests that could be bypassed.
7. __Fuzz Testing:__ in this testing, we provide substantial random data as the input to test the reliability of an API. This random data is known as __fuzz__. Fuzz Testing ensures the API functionality in the worst-case scenario.

# API Optimizations
It's imperative to optimize your API to provide a better user experience. Here are five ways to optimize your API performance and make it standout:
1. __Use rate-limiting strategy:__ there might be a case where the user executes a loop, causing many API requests that can slow doen your API performance. In order to avioid such scenarios, use __rate-limitng__ factors and limit the specific number or requests in the given time period.
2. __Cache Requests:__ you can implement cache endpoints for the frequently used requests. This will reduce the number of round trips of client requets to the server and improve API performance and latency.
3. __Use PATCH over PUT:__ the __PATCH__ requests method only updates the necessary part of the resource whereas __PUT__ updates the entire resource.
4. __Compress Data:__ massive data transactions make the API slow. Consider using compression teschniques like __GZip__ to compress the data sent through the API. It will make the transfer faster and improve the overall performance of your API.
5. __Using Appropriate Hosting:__ if you expect your API to see high traffic surges, make sure you use a good hosting company that provides you with enough CPUs and databse instances to make your APIs fast. It will solve your network-related issues.
# References
1. [Learning Advanced API Concepts](https://realpython.com/python-api/#learning-advanced-api-concepts)
2. https://towardsdatascience.com/a-layman-guide-for-data-scientists-to-create-apis-in-minutes-31e6f451cd2f