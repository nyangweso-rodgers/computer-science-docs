# Web Services

## Table of Contents
1. [Overview of Web Services](#Overview-of-Web-Services)
    - [Web Services vs APIs](#Web-Services-vs-APIs)
    - [Advantages of Web Services](#Advantages-of-Web-Services)
    - [Features of a Web Service](#Features-of-a-Web-Service)
    - [Types of Web Services](#Types-of-Web-Services)
    - [Considerations of a Web Services](#Considerations-of-a-Web-Services)
    - [Secure Web Services](#Secure-Web-Services)

# Overview of Web Services
* A __web service__ is an __XML-based__ application communication system that translates data via __HTTP__ over the internet. __Web services__ are language agnostic and can deliver services across multiple platforms and programming languages.

* Web services are often associated with SOA(Service Orientated Architecture), where a software’s features are split into different services and then made available on a network.

# Web Services vs APIs
* An __API__ is the gateway you pass through to access a __Web Service__. It is a central point of entry which routes your request to the correct, quite possibly multiple, __Web Service(s)__ in order to fulfil your request.

* Unlike __APIs__, Web Services are not Protocol agnostic and use SOAP as a primary protocol. They are also restricted to XML. Because of this, their architecture is much heavier, and APIs that primarily use JSON is lightweight in comparison.

* Due to the more rigid restrictions of SOAP, Web Services are more secure. They have stricter protocol requirements than APIs, which are more accessible and can easily expose data if security is not implemented thoroughly.

* APIs can work on or offline, and Web Services require a network.

* _Remark_: _It's important to remember that all web services are APIs, but not all APIs are web services. Both, however, enable the transfer of data between software apps._

# Advantages of Web Services
* __Reusability of code__: allow organisations to use web services provided by Third-parties
* __Language Transparency__: _ability for services to communicate back and forth_ i.e., the service provider can write the web service in one language like PHP or NodeJs then the service client can be written in a totaly different language like Python, Ruby e.t.c.,. And they can still communicate using a common lanuage like XML or JSON.
* __Usability__: ability to make the data more accessible to other services which can be used by a wide audiences and plarforms.
* __Deployability__: deployed via standard internet technologies making them easily available on a global level.

# Features of a Web Service
1. __XML based__: are __XML__ for data transportation. 
2. __Language Independent__: thanks to __XML__, web servces communicate effectively no matter  which programming language or operating systems are used.
3. __Complex Document Exchange__: __XML__ follows an element and tag-based format and can exchange large and complex entities such as charts, images, e.t.c.,
4. __Synchronous and synchronous__: Web services can work only by invoking the next task once the previous is complete or invoking and carrying out multiple tasks simulataneously.
5. __Loosely coupled__: a client's interface can change over time, but this doesn't affect the client's ability to interact with the web service, as they are independent of each other.

# Types of Web Services
There are two types of __Web Services__:
1. __Simple Object Access Protocol (SOAP)__: sends messages using __XML__. An __XML__ document is sent with the data in a certain format
2. __Representational State Transfer (RESTful)__: is based on __Representational State Transfer (REST)__ technology, which is an architectural style and approach to communication often used in web service development. __RESTful API__ is mostly used for HTTP web APIs where there is no need for any additional or package to be installed.
3. XML-RPC (Remote Procedure Call)
4. UDDI (Universal Description, Discovery, and Integration)

# Considerations of a Web Services
* __Latency__: time it takes for a request to return a response. __Latency__ increases when client and server runs in two different machines.
* __Partial Failure__: when a server or network fails to respond. Normally happens when the server is loaded with requests and cannot respond.

# Secure Web Services
1. __Authentication__: validates the identity of a client e.g., username and a password
2. __Authorization__: this is the next step after __authorization__. it determines the _level of client's access_ 