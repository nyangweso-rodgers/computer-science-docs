# APIs

## Table Of Contents
- [API Lifecycle](#API-Lifecycle)
- [Attacks On APIs](#Attacks-On-APIs)

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