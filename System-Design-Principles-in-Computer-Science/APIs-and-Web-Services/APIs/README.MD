# APIs

## Table Of Contents
- [Introduction to APIs](#Introduction-to-APIs)
    - [Characteristics of APIs](#Characteristics-of-APIs)
    - [Classification of APIs](#Classification-of-APIs)

- [APIs Concepts](#APIs-Concepts)
    - Base URL
    - Endpoint
    - Request & Response
    - ? Operator
    - Rate Limiting
    - Query Parameters
    - Authentication
    - Paginantion

- [APIs Response Status Codes](#APIs-Response-Status-Codes)

- [API Optimizations](#API-Optimizations)

- [API Lifecycle](#API-Lifecycle)

- [Attacks On APIs](#Attacks-On-APIs)

- [Further Reading]()
    - [A Guide to the Most Popular APIs: REST, SOAP, GraphQL, gRPC, and WebSockets](https://blog.postman.com/guide-to-apis-rest-soap-graphql-grpc-websockets/)

# Introduction to APIs
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

9. __Access Token__: used for __authentication__. Applications use an access token to authenticate themselves so that they can make an API call. Access tokens are just random strings.

10. __API Gateway__: type of software that provides a way for clients to interact with a set of back-end services. A typical API gateway will provide a set of APIs that clients can use to access the various back-end services.

    ### How does API Gateway work
    - API Gateway acts as a proxy, intercepting requests from the application and forwarding them to the appropriate backend service.

    ### Benefits of API Gateway
    - _Increased Security_: API gateways can provide an additional layer of security for your backend services by validating incoming requests and enforcing authentication and authorization policies.
    - _Improved performance_: API gateways can cache commonly requested data and distribute load across multiple backend servers to improve performance.
    - _Easier management_: API gateways can provide a single point of control for managing your backend services, making them easier to deploy.

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

# API Optimizations
It's imperative to optimize your API to provide a better user experience. Here are five ways to optimize your API performance and make it standout:
1. __Use rate-limiting strategy:__ there might be a case where the user executes a loop, causing many API requests that can slow doen your API performance. In order to avioid such scenarios, use __rate-limitng__ factors and limit the specific number or requests in the given time period.

2. __Cache Requests:__ you can implement cache endpoints for the frequently used requests. This will reduce the number of round trips of client requets to the server and improve API performance and latency.

3. __Use PATCH over PUT:__ the __PATCH__ requests method only updates the necessary part of the resource whereas __PUT__ updates the entire resource.

4. __Compress Data:__ massive data transactions make the API slow. Consider using compression teschniques like __GZip__ to compress the data sent through the API. It will make the transfer faster and improve the overall performance of your API.

5. __Using Appropriate Hosting:__ if you expect your API to see high traffic surges, make sure you use a good hosting company that provides you with enough CPUs and databse instances to make your APIs fast. It will solve your network-related issues.

# API Lifecycle
* __API Lifecycle__ provides a clear-cut plan for the entire lifecycle of an API. From a higher level, the __lifecycle of an API__ involves three key phases — __create__, __control__, and __consume__. The following are the 7 stages of an API Lifecycle:

    1. __Design__: An API’s lifecycle starts with planning and designing the API in question. API design includes choosing an _API architecture_, _target audience_, and _API type_ (public, private, or partner). Lastly, API requirements are laid out using an API specification file.

    2. __Develop__: A team of API developers works on implementing the API according to the decisions and specifications in the design plan. An organized development phase includes implementation using a language or framework of choice, debugging, testing and documentation.

    3. __Publish__: At the end of the development phase, it is time to deploy the finished API to development, staging, and production environments. Then, we can make it available to the end-users by publishing it.

    4. __Secure__: The secure phase includes authentication and access control to stop unauthorized access to the API. The API should also be protected against OWASP 10 API security vulnerabilities.

    5. __Discover__: In this phase, the aim is to expose your API to potential consumers to increase adoption. We can call it the monetize phase for cases when you want to sell your API as a product.

    6. __Monitor__: When the API is up and running, it will be connected to multiple consumer applications that rely on it for data. Now the API enters the monitoring phase, where all parameters are checked to ensure the API is working correctly.

    7. __Depreciate__: In the API industry, backward compatibility is a serious concern, which is why older versions must work long enough after newer versions are released. Therefore, after proper planning and monitoring, API enters the last stage, where the older version is retired.

# Attacks On APIs
1. __API Injection Attack__: Injection attacks are carried out by inserting malicious code into the API via a query or request to obtain unauthorized access to data. These are most commonly SQL injection attacks, which insert malicious SQL code as a parameter field.

2. __DDoS (Distributed Denial of Service) attack__: This aims to disrupt a server with a large amount of traffic. It essentially creates a traffic jam, with no traffic able to be transferred to and from the server. This can break the API by making its data inaccessible to users.

3. __Excessive data exposure__: This is where an API returns unneeded or sensitive data in its responses that could be valuable to hackers. This is commonly seen where APIs return complete datasets as they are on backend servers, and the client is relied on to filter the results.

4. __MITM (Man-in-the-middle attack)__: MITM attacks are when a hacker intercepts communication between two programs to obtain the information being transferred between them. This risk is much greater if the data in transit is not encrypted, which is why using HTTPS is standard.

5. __Parameter tampering__: Parameter tampering aims to manipulate parameters sent in __API__ requests, creating access to potentially sensitive information. Parameter tampering is done mainly through input forms submitted by clients on the web.