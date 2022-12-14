# Simple Object Access Protocol (SOAP)

## Table of Contents
1. [SOAP Overview](#Soap-Overview)
2. [Working of SOAP](#Working-of-SOAP)
3. [Characteristics of SOAP](#Characteristics-of-SOAP)
4. [Pros of SOAP](#Pros-of-SOAP)
5. [Cons of SOAP](#Cons-of-SOAP)
6. [When to Use SOAP API](#When-to-Use-SOAP-API)

# SOAP Overview
* __SOAP__ is a standardized protocal that relies on __XML__ to make _requests_ and _receive_ responses. Even though __SOAP__ is based on __XML__, the __SOAP__ protocol is still in wide usage. 

* __SOAP APIs__ make data available as a service and are typically used when performing transactions involving multiple __API calls__ or applications where security is the primary consideration.

* __SOAP__ was initially developed for __Microsoft__ in __1998__ to provide a standard mechanism for intergrating services on the internet regardless of the operating system, object model, or programming language.

# Working of SOAP
* The "S" in __SOAP__ stands for __Simple__, and for a good reason - __SOAP__ can be used with less complexity as it requires less coding in the app layer for transactions, security, and other functions.

# Characteristics of SOAP
* __Extensibility of SOAP API__: __SOAP__ allows for extensions that introduce more robust features, such as Windows Server Security, Addressing, and more.
* __Neutrality of SOAP API__: __SOAP__ is capable of operating over a wide range of protocols, like UDP, JMS, SMTP, TCP, and HTTP.can operate.
* __Independence of SOAP API__: __SOAP API__ responses are purely based on __XML__. Therefore __SOAP APIs__ are platform and language independent.

# Pros of SOAP
* The major advantage of SOAP is the fact that it is completely agnostic when it comes to the programming language and processing platform. The standardized format ensures that no matter what is receiving the message on the other end, the request can be executed.

*  this type of API comes with native error handling already built-in, helping developers to be proactive and solve issues before they snowball.

* Perhaps the strongest SOAP use case is with high-security data transmissions in situations where two parties have agreed to a specific legal contract. Here SOAP’s standardization works wonders because it allows for the contract’s terms to be formally codified and enforced throughout all of the API’s processing. You’ll see plenty of this in high-stakes industries like financial services, where the data being passed back and forth is highly sensitive.

# Cons of SOAP
* SOAP’s standardization makes requests incredibly accessible to applications, but as a side effect, the format can become very formal and verbose. Every message must include an envelope tag at the start and the end, a body that includes the actual request, a header for specific information and additional requirements, as well as any faults that occur throughout processing.

* SOAP has become less popular in recent years because of the sheer volume of information it requires. The XML files are large and are often unnecessarily clunky – especially for simple systems. The number of people who specialize in SOAP servers is rapidly declining, and that makes it a difficult thing to maintain if you don’t already have the right talent on board. It feels like the format is lagging behind newer, more flexible communication methods that offer more robust, sustainable results.

# When to Use SOAP API
* __SOAP APIs__ remain a top choice for corporate entities and government organizatins that prioritize security, even though __REST__ has largely dominated web applications.

* __SOAP__ is more secure than __REST__ as it uses __WS-Security__ for transmission along with Secure Socket Layer.

* __SOAP__ also has more excellent transactional reliability, which is another reason why __SOAP__ historically has been favored by the banking industry and other large entities.