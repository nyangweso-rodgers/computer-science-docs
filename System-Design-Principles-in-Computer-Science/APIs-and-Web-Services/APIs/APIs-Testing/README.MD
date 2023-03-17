# API Testing

## Table Of Contents
- [API Testing](#api-testing)
  - [Table Of Contents](#table-of-contents)
- [APIs Testing](#apis-testing)
- [Types of API Testing](#types-of-api-testing)

# APIs Testing
* __API Testing__ is performed to test wheather a particular API meets pre-deined parametsrs or not. It includes testing APIs in isolation to ascertain if they meet the:
    * functionality, 
    * reliability, 
    * latency, 
    * performance, 
    * security, and other essesbtial parameters.

* __API testing__ commonly includes testing APIs with __JSON__ or __XML__ payload sent over HTTP, HTTPS, and MQ. These are widely used data formats and networking/messaging protocols.

# Types of API Testing
* __API testing__ is not a process that is carried out right away. It is divided into several categories which aim to test the API effectively so that the API can work in isolation, with integration, and produce the desired results to edge cases.
    1. __Unit Testing:__ involves testing the individual operations of the API by logically dividig them into units. __Unit testing__ helps to identify imperfections in the early stages. It typically inclues testing each part of the code seperately.

    2. __Functional Testing:__ includes testing of all the functions in the codebase. It is often uses unit tests as tyhe building blocks.

    3. __Load Testing:__ generally validates the functionality and performance of API under load. __Load Testing__ ensures whether an API will work as expected if multiple users are accessing the API concurrently.

    4. __Runtime Error Detection__: can be performed manually or through automated testing. This testing includes monitoring an API by actually running the API entirely. It helps us to detect errors and exceptions and also prevent resource leaks.

    5. __Security Testing__: this testing handles all the security aspects of an API, including external threats, validation, access control, and data encryption.

    6. __Penetration Testing:__ includes testing an API to find vulnerabilities in the system or codebase that attackers can exploit. It also includes testing functions that could be misused and test security assests that could be bypassed.

    7. __Fuzz Testing:__ in this testing, we provide substantial random data as the input to test the reliability of an API. This random data is known as __fuzz__. Fuzz Testing ensures the API functionality in the worst-case scenario.