# Application Programming Interface (API)

## API Concepts
- [API Definition](#API-Definition)
- [Characterics of APIs](#Characteristics-of-APIs)
- [Classification of APIs](#Classification-of-APIs)

- [Definition of Terms](#Definition-of-Terms)
    - Endpoint
    - API Access Key
    - Rate Limiting
- [Examples of Free Public APIs](#List-of-various-APIs)
- [SOAP vs REST vs GraphQL](#SOAP-vs-REST-vs-GraphQL)
- [REST API](#REST-API)
    - [Advantages of REST](#Advantages-of-REST)

# API Definition
An **application programming interface** (API) is a _computing interface which defines interactions between multiple software intermediaries_. It defines:
- the kinds of calls or requests that can be made,
- how to make them,
- the data formats that should be used,
- the conventions to follow, etc.

APIs can come in many forms or shapes. They can be _operating system APIs_, used for actions like turning on your camera and audio for joining a Zoom call. Or they can be _web APIs_, used for web-focused actions such as liking images on your Instagram or fetching the latest tweets. No matter the type, all APIs function mostly the same way. You usually make a __request__ for information or data, and the API returns a __response__ with what you requested.

_Example_: I can have a movie API, which returns me names of drama movies when I pass the “animation” genre as input. **The advantage of using such a sort of mechanism is that the API user doesn’t get access to the whole dataset or source code and yet they can get all the information they need**. This is how many services on the internet like **Amazon Rekognition**, which is an image and video API, or **Google Natural Language** API, which is an NLP API works. They _provide us access to some great functions without letting us have the source code, which is often valuable and kept hidden_. For example, I can send an image to Amazon Rekognition API, and it can provide me with Face detection and Analysis.

# Characteristics of APIs
1. __APIs__ form a bridge for interactions between services e.g., mainframe and databases and customer-facing services. __APIs__ enable organizations to share information with external developers, business associates, and other teams within the organization.

2. __APIs__ allow you to expose some functions of a program. __APIs__ providers can share positions of their code with developers but do not have to release everything for new applications and services to be developed. __APIs__ from different providers can be combined by developers to create new applications.

3. A high-quality __API__ facilitates the development of applications by allowing different functionalites to be created independently while offering a complete set of capabilities for development.

# Classification of APIs

__APIs__ are classified as follows based on how they are consumed:

 - __External API__: Present the API provider or business an opportunity to share certain data sets, services, and capabilities with developers. This capability enables the use of business's assets to develop innovative, new applications and allows  for existing applications and services to be modified.They help foster relationships between internal and external developers and drive the creation of new application and services that are not possible without the business publicly sharing some of it's data and service.

- __Partner API__: These __APIs__ are open to select business partners of a company. They are specifically designed for partners to be able to access business functions in context to the business relationship e.g., online catalog, ordering, and recommendation. In this type of __API__, typically the companies want to control who has access to the data they are exposing and want to have a greater control over how the data is used.

- __Internal API__: Organizations use API internally or privately to develop new ways of operating and managing their businesses. These internal __APIs__ can be developed to more efficiently process internal documents, manage process, share information, account for assests, and other business processes in order to drive increased productivity.

# Definition of Terms
1. __base URL__: The base URL structure is no different from the URLs you use for browsing Google, YouTube, or Facebook, though it usually contains the word api. This is not mandatory, just more of a rule of thumb. e.g.,
    - https://api.twitter.com
    - https://api.github.com
    - https://api.stripe.com

2. __Endpoint__: is a part of the URL that specifies what resource you want to fetch. Well-documented APIs usually contain an API reference, which is extremely useful for knowing the exact endpoints and resources an API has and how to use them.

3. __Request and Response__: 
    - __Requests__ contain relevant data regarding your API request call, such as the _base URL_, the _endpoint_, the _method_ used, the _headers_, and so on.
    - __Responses__ contain relevant data returned by the server, including the _data_ or _content_, the _status code_, and the _headers_


4. **? Operator**: This operator is used to specify the parameters we want to send to the __API__ or our “online function.” 
5. __Rate limiting__: is a technique which restricts the number of requests that users can make in a given time frame. Some APIs may actually block your IP or API keys if you go over the defined rate limit too often. 

 __Remark__: _Be careful not to exceed the limits set by the API developers. Otherwise, you might have to wait a while before calling that API again._

6. __API Response Status Codes__: Status codes are one of the most important pieces of information to look for in any __API response__. They tell you if your request was successful, if it’s missing data, if it’s missing credentials, and so on.

    | Status code | Description 
    ----------- | ----------- 
    200 OK |Your request was successful!
    201 Created | Your request was accepted and the resource was created.
    400 Bad Request|Your request is either wrong or missing some information.
    401 Unauthorized|Your request requires some additional permissions.
    404 Not Found|The requested resource does not exist.
    405 Method Not Allowed|The endpoint does not allow for that specific HTTP method.
    500 Internal Server Error|Your request wasn’t expected and probably broke something on the server side.


7. __HTTP Headers__: HTTP headers are used to define a few parameters governing __requests__ and __responses__:

    HTTP Header | Description
    ----------|-----------------
    Accept|What type of content the client can accept
    Content-Type|What type of content the server will respond with
    User-Agent|What software the client is using to communicate with the server
    Server|What software the server is using to communicate with the client
    Authentication|Who is calling the API and what credentials they have

8. __HTTP Methods__: When calling an API, there are a few different methods, also called verbs, that you can use to specify what action you want to execute. For example, if you wanted to fetch some data, you’d use the method GET, and if you wanted to create some data, then you’d use the method POST. When purely consuming data using APIs, you’ll typically stick to GET requests, but here’s a list of the most common methods and their typical use case:

    HTTP Header | Description | Requests Method
    ----------|----------------- | ---------
    POST | Create a new resource | requests.post()
    GET | Read an existing Resource | requests.get()
    PUT | Update an existing resource | requests.put()
    DELETE | Delete an exsting resource | requests.delete()

These four methods are typically referred to as __CRUD__ operations as they allow you to __create__, __read__, __update__ and __delete__ resources.

9. __Query Parameters__: Sometimes when you call an API, you get a ton of data that you don’t need or want. But in some cases, you might want to extract only certain information. That’s where query parameters come in!

    To add a query parameter to a given URL, you have to add a question mark (?) before the first query parameter. If you want to have multiple query parameters in your request, then you can split them with an ampersand (&).

    In the API world, query parameters are used as filters you can send with your API request to further narrow down the responses. Using query parameters, you can start fetching more specific data from an API, making the whole experience a bit more tailored to your needs.

    With the help of query parameters, you’re able to further narrow your requests and specify exactly what you’re looking for. Most APIs you’ll find online will have some sort of query parameters that you can use to filter data.

10. __Authentication__: Authentication approaches range from the simplistic and straightforward, like those using API keys or Basic Authentication, to much more complex and safer techniques, like OAuth. Typically, calling an API without credentials or with the wrong ones will return a 401 Unauthorized or 403 Forbidden status code.
    - __API Keys__: This is the most common level of authentication. These keys are used to identify you as an API user or customer and to trace your use of the API. API keys are typically sent as a _request header_ or as a _query parameter_.
    - __OAuth__: Every time an app or platform has a Login With or Continue With option, that’s the starting point of an OAuth flow:

11. __Pagination__: Sending lots of data back and forth between clients and servers comes with a price: bandwidth. To make sure that servers can cope with a lot of requests, APIs typically use __pagination__. In very simple terms, pagination is the act of splitting large amounts of data into multiple smaller pieces

# List of various APIs
1. [Random User Generator API](https://randomuser.me/) - generate random user data for application testing
2. [TheDogAPI](https://thedogapi.com/): you can fetch the different dog breeds and some images, but if you register, you can also cast votes on your favorite dogs


1. [PlaceGOAT API](https://placegoat.com/) This is a very silly API that returns _images of goats_ in different sizes that you can use as placeholder images in your website.
2. [api-football](https://www.api-football.com/documentation-v3#section/Sample-Scripts/Php)

# SOAP vs REST vs GraphQL
In the late 1990s and early 2000s, two different design models became the norm in exposing data publicly:
1. __SOAP__ (__Simple Object Access Protocol__) is typically associated with the enterprise world, has a stricter contract-based usage, and is mostly designed around actions.
2. __REST__ (__Representational State Transfer__) is typically used for public APIs and is ideal for fetching data from the web. It’s much lighter and closer to the HTTP specification than SOAP.
3. __GraphQL__. Created by Facebook, __GraphQL__ is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send.
# REST API
__Representational State Transfer__ (__REST__) is an architectural style that has gained a lot of popularity in recent years due to its _simplicity_ and _scalability_. Before __REST__ gained popularity, __SOAP__ was the de-facto way of accessing resources and communicating over the web.

a __RESTful API__ (__RESTful web service__) is based on **Representational State Transfer** (__REST__) technology, which is an architectural style and approach to communication often used in web service development. **RESTful API** is mostly used for HTTP web APIs where there is no need for any additional or package to be installed.

# Advantages of REST
1. _REST is Easy to Understand and Implement:_ **REST** is meant to work over HTTP (actually HTTP was influenced by REST). Therefore it makes use of HTTP verbs such as GET, POST, and PUT.
2. _REST Makes your Application More Scalable:_ There are 2 main reasons why REST can help make your application more scalable:
    - _No State:_ one of the core principles of REST is that it's __stateless__ on the server-side. Therefore each request will be processed independently from the previous ones. In applications with a server-side state or sessions, a session is stored for possibly every logged-in user. This session data can easily get bloated and start to occupy a lot of resources on the server. On the other hand, stateless servers only keep resources (memory) occupied when they are handling a request and they free it as soon as the request is processed. Since the current trend in scalability is horizontal scaling (typically on the cloud), storing server-side sessions can also make it hard to scale your application because it creates some difficult problems.

    - _Faster Data Interchange Format:_ **RESTful APIs** typically use **JSON** as the data interchange format. JSON is much more compact and smaller in size compared to **XML\_**. It can also be parsed faster than XML.

3. _Caching is Easier with REST:_ Caching is a critical factor for the scalability and performance of a modern web application. A well-established cache mechanism (with the best hit-rates possible) can drastically decrease the average response time of your server. **REST** aims to make caching easier. Since the server is stateless and each request can be processed individually, GET requests should usually return the same response regardless of previous ones and the session. This makes the GET requests easily cacheable and browsers usually treat them as such. We can also make our **POST** requests cacheable using **Cache-Control** and **Expires headers**.

4. _REST is Flexibile:_ i.e., it's easy to modify and it's also able to answer many clients who can ask for different data types (XML, JSON, and so on). The client can specify the type using the Accept header and the REST API can return different responses depending on that. **REST** has the ability to handle multiple types of requests and return different types of data (such as JSON and XML)

## References
1. https://realpython.com/python-api/#learning-advanced-api-concepts
2. https://towardsdatascience.com/a-layman-guide-for-data-scientists-to-create-apis-in-minutes-31e6f451cd2f
3. https://www.freecodecamp.org/news/benefits-of-rest/