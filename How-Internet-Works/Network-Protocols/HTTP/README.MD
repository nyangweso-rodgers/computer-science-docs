# HTTP (S)

## Table Of Contents
- [Flow Of HTTP Session](#Flow-Of-HTTP-Session)
- [Further Reading]()


# Introduction to HTTP(s)
* __HTTP__ is a system for transmitting and receiving information on the __World Wide Web__. It was created in the early 1990s. __HTTP__ defines how messages are formatted and transmitted and what actions Web servers and browsers should take in response to various commands.

* __HTTP__ is a __stateless protocol__ i.e., the connection is terminated once the request has been fulfilled.

* Here is the structure of the sample HTTP GET request:
    1. Request line (URL)
    2. Request headers
    3. Request data (query string)

* Struccture of a sample HTTP GET Response:
    1. Status line
    2. Response headers
    3. Response data (page HTML code in this case)


# Flow Of HTTP Session
* In __HTTP protocol__, a typical session has three phases:
    - _Establishes a TCP connection_: The client establishes the connection with the server using the _TCP_ layer. Default HTTP port with TCP layer is 80 but other ports might be used as well. As the 80 port number is the default for the HTTP protocol, so adding it with the domain is not mandatory.

    - _Client sends an HTTP request_: After a successful connection, the client can ask for data from the server. User-agent (mostly web browsers) can send HTTP requests and ask for the necessary data. A typical HTTP request contains three things:
        - Request methods
        - HTTP headers
        - Method body (optional)

    - _Server sends an HTTP response_: After the client sent the request, the server process it and sends the response accordingly. Server always returns a response doesn't matter request is successful or not. The structure of the HTTP response looks like this:\
        - Status line
        - Response header
        - Message body (optional)