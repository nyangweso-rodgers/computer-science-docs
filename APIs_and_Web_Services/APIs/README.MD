# APIs

## Table of Contents
1. [Overview of APIs](#Overview-of-APIs)
    - [Characteristics of APIs](#Characteristics-of-APIs)
    - [Classification of APIs](#Classification-of-APIs)
    - [APIs vs Webhooks](#APIs-vs-Webhooks)

2. [APIs Concepts](#APIs-Concepts)
    - Base URL
    - Endpoint
    - Request & Response
    - ? Operator
    - Rate Limiting
    - Query Parameters
    - Authentication
    - Paginantion

3. [APIs Response Status Codes](#APIs-Response-Status-Codes)

4. [APIs Testing](#APIs-Testing)
    - [Types of API Testing](#Types-of-API-Testing)

5. [API Optimizations](#API-Optimizations)

6. [Lists of Popular APIs]()

7. [References]()
    - [A Guide to the Most Popular APIs: REST, SOAP, GraphQL, gRPC, and WebSockets](https://blog.postman.com/guide-to-apis-rest-soap-graphql-grpc-websockets/)

# Overview of APIs
* An __API__  is a _computing interface which defines interactions between multiple software intermediaries_. It defines:
    - the kinds of calls or requests that can be made,
    - how to make them,
    - the data formats that should be used,
    - the conventions to follow, etc.

* __APIs__ can come in many forms or shapes. They can be _operating system APIs_, used for actions like turning on your camera and audio for joining a Zoom call. Or they can be _web APIs_, used for web-focused actions such as liking images on your Instagram or fetching the latest tweets. No matter the type, all APIs function mostly the same way. You usually make a __request__ for information or data, and the API returns a __response__ with what you requested.

# Characteristics of APIs
* _APIs form a bridge for interactions between services_ e.g., mainframe and databases and customer-facing services. __APIs__ enable organizations to share information with external developers, business associates, and other teams within the organization.
* _APIs allow you to expose some functions of a program_. __APIs__ providers can share positions of their code with developers but do not have to release everything for new applications and services to be developed. __APIs__ from different providers can be combined by developers to create new applications.
* _A high-quality API facilitates the development of applications by allowing different functionalites to be created independently while offering a complete set of capabilities for development._

# Classification of APIs
__APIs__ are classified as follows based on how they are consumed:
1.  __External API__: Present the API provider or business an opportunity to share certain data sets, services, and capabilities with developers. This capability enables the use of business's assets to develop innovative, new applications and allows  for existing applications and services to be modified.They help foster relationships between internal and external developers and drive the creation of new application and services that are not possible without the business publicly sharing some of it's data and service.

2. __Partner API__: These __APIs__ are open to select business partners of a company. They are specifically designed for partners to be able to access business functions in context to the business relationship e.g., online catalog, ordering, and recommendation. In this type of __API__, typically the companies want to control who has access to the data they are exposing and want to have a greater control over how the data is used.

3. __Internal API__: Organizations use API internally or privately to develop new ways of operating and managing their businesses. These internal __APIs__ can be developed to more efficiently process internal documents, manage process, share information, account for assests, and other business processes in order to drive increased productivity.

# APIs vs Webhooks
__Webhooks__ provide similar functionality as __APIs__ do but they work differently. With a standard __REST API__, you send a __request__ and get a __response__. However, no __request__ is required for a __Webhook__. Instead, the __response__ is sent whenever a specified event occurs.

# APIs Concepts
1. __Base URL__: The base URL structure is no different from the URLs you use for browsing Google, YouTube, or Facebook, though it usually contains the word api. This is not mandatory, just more of a rule of thumb. e.g.,
    - https://api.twitter.com
    - https://api.github.com
    - https://api.stripe.com

2. __Endpoint__: is a _part of the URL that specifies what resource you want to fetch_. Well-documented APIs usually contain an __API reference__, which is extremely useful for knowing the exact endpoints and resources an API has and how to use them.

3. __Request and Response__: 
    - __Requests__ contain relevant data regarding your __API request__ call, such as the _base URL_, the _endpoint_, the _method_ used, the _headers_, and so on.
    - __Responses__ contain relevant data returned by the server, including the _data_ or _content_, the _status code_, and the _headers_

4. __? Operator__: This operator is used to specify the parameters we want to send to the __API__ or our “online function.” 

5. __Rate limiting__: is a technique which restricts the number of requests that users can make in a given time frame. Some APIs may actually block your IP or API keys if you go over the defined rate limit too often. 

6. __Query Parameters__: 
    * Sometimes when you call an __API__, you get a ton of data that you don’t need or want. But in some cases, you might want to extract only certain information. That’s where __query parameters__ come in!
    * To add a query parameter to a given __URL__, you have to add a question mark (?) before the first query parameter. If you want to have multiple query parameters in your request, then you can split them with an ampersand (&).
    * In the __API__ world, __query parameters__ are used as filters you can send with your __API request__ to further narrow down the responses. Using __query parameters__, you can start fetching more specific data from an __API__, making the whole experience a bit more tailored to your needs.

7. __Authentication__: Authentication approaches range from the simplistic and straightforward, like those using __API keys__ or __Basic Authentication__, to much more complex and safer techniques, like __OAuth__. Typically, calling an __API__ without credentials or with the wrong ones will return a 401 Unauthorized or 403 Forbidden status code.
    - __API Keys__: This is the most common level of authentication. These keys are used to identify you as an __API__ user or customer and to trace your use of the API. API keys are typically sent as a _request header_ or as a _query parameter_.
    - __OAuth__: Every time an app or platform has a Login With or Continue With option, that’s the starting point of an OAuth flow

8. __Pagination__: Sending lots of data back and forth between clients and servers comes with a price: bandwidth. To make sure that servers can cope with a lot of requests, APIs typically use __pagination__. In very simple terms, pagination is the act of splitting large amounts of data into multiple smaller pieces.

# APIs Response Status Codes
| Status code |Meaning| Description 
|:-----------: |:-------:| :-----------:| 
200 | OK |Your request was successful!
201 | Created | Your request was accepted and the resource was created.
400 | Bad Request|Your request is either wrong or missing some information.
401 | Unauthorized|Your request requires some additional permissions.
404 | Not Found|The requested resource does not exist.
405 | Method Not Allowed|The endpoint does not allow for that specific HTTP method.
500 | Internal Server Error|Your request wasn’t expected and probably broke something on the server side.

# APIs Testing
* __API Testing__ is performed to test wheather a particular API meets pre-deined parametsrs or not. It includes testing APIs in isolation to ascertain if they meet the:
    * functionality, 
    * reliability, 
    * latency, 
    * performance, 
    * security, and other essesbtial parameters.

* __API testing__ commonly includes testing APIs with __JSON__ or __XML__ payload sent over HTTP, HTTPS, and MQ. These are widely used data formats and networking/messaging protocols.

# Types of API Testing
__API testing__ is not a process that is carried out right away. It is divided into several categories which aim to test the API effectively so that the API can work in isolation, with integration, and produce the desired results to edge cases.
1. __Unit Testing:__ involves testing the individual operations of the API by logically dividig them into units. __Unit testing__ helps to identify imperfections in the early stages. It typically inclues testing each part of the code seperately.
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

# Lists of Popular APIs
| Index |Name| Description | Documentation |
|:-----------: |:-------:| :-----------:| :---------:|
1 | [GitHub’s REST API](https://docs.github.com/en/rest)
2 | [Random User Generator API](https://randomuser.me/) | generate random user data for application testing
3 | [TheDogAPI](https://thedogapi.com/) | you can fetch the different dog breeds and some images, but if you register, you can also cast votes on your favorite dogs.
4 | [PlaceGOAT API](https://placegoat.com/) | This is a very silly API that returns _images of goats_ in different sizes that you can use as placeholder images in your website.
5 | [api-football](https://www.api-football.com/documentation-v3#section/Sample-Scripts/Php)
6 | https://www.api-football.com/documentation-v3
7 | [Spotify Web API](https://developer.spotify.com/documentation/web-api/)