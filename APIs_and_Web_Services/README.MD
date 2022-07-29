# Web Services and APIs
# Table of Contents
- [Servers](#Servers)
    - [Types of Servers](#Types-of-Servers)

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
- [Most Popular APIs]()
    - [REST](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/REST)
    - [SOAP](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/SOAP)
    - [GraphQL](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/GraphQL)
    - [gRPC](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/gRPC)
    - [Websockets](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/Websockets)
    - [Webhooks](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/APIs_and_Web_Services/Webhooks)

    
- [API Testing](#API-Testing)
    - [Types of API Testing](#Types-of-API-Testing)

- [API Optimizations](#API-Optimizations)
- [References](#References)
    - [A Guide to the Most Popular APIs: REST, SOAP, GraphQL, gRPC, and WebSockets](https://blog.postman.com/guide-to-apis-rest-soap-graphql-grpc-websockets/)

# Servers
The __server__ can perform a wide range of functionalities including _data processing_, _storage_, and _serving it back to the client_. A __server__ can also _direct the client's request to the appropriate location_.
# Types of Servers
Based on _functionality_, servers are divided into different types:
1. __Origin__: actual __server__ that contains data and serves on client's request.
2. __Proxy__: have the ability to further pass your request to other servers. i.e., __intermediate servers__. The responsibility of a __proxy server__ is to contact actual (origin) sever on your behalf. Your __IP Address__ is hidden whenever your request goes through the __proxy server__.
3. __Web__: accepts requests via __HTTP__ and sends the World Wide Web information your browser.
4. __DNS (Domain Name System)__: As computer devices are interacted using __IP addresses__, the __DNS server__ provides the __IP address__ of the requested __URL__.
5. __Mail__: responsible for sending and receiving emails. When an email is sent, it first goes through the mail server. The mail server then sends it to the other mail server or the specific user.
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

7. __Query Parameters__: Sometimes when you call an __API__, you get a ton of data that you don’t need or want. But in some cases, you might want to extract only certain information. That’s where __query parameters__ come in!

    To add a query parameter to a given __URL__, you have to add a question mark (?) before the first query parameter. If you want to have multiple query parameters in your request, then you can split them with an ampersand (&).

    In the __API__ world, __query parameters__ are used as filters you can send with your __API request__ to further narrow down the responses. Using __query parameters__, you can start fetching more specific data from an __API__, making the whole experience a bit more tailored to your needs.

8. __Authentication__: Authentication approaches range from the simplistic and straightforward, like those using __API keys__ or __Basic Authentication__, to much more complex and safer techniques, like __OAuth__. Typically, calling an __API__ without credentials or with the wrong ones will return a 401 Unauthorized or 403 Forbidden status code.
    - __API Keys__: This is the most common level of authentication. These keys are used to identify you as an __API__ user or customer and to trace your use of the API. API keys are typically sent as a _request header_ or as a _query parameter_.
    - __OAuth__: Every time an app or platform has a Login With or Continue With option, that’s the starting point of an OAuth flow:

10. __Pagination__: Sending lots of data back and forth between clients and servers comes with a price: bandwidth. To make sure that servers can cope with a lot of requests, APIs typically use __pagination__. In very simple terms, pagination is the act of splitting large amounts of data into multiple smaller pieces.

11. __API Key__: unique code for every user which lets you call an API. __API keys__ are used for both _autorization_ and _authentification_. __Authentification__ is used to identify the caller requesting API access and __authorization__ checks whether the user making the call has permission to do so.

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

# APIs vs Webhooks
__Webhooks__ provide similar functionality as __APIs__ do but they work differently. With a standard __REST API__, you send a __request__ and get a __response__. However, no __request__ is required for a __Webhook__. Instead, the __response__ is sent whenever a specified event occurs.
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