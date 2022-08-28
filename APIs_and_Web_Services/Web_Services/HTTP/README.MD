# Hypertext Transfer Protocol  - HTTP(S)
## Table of Contents
1. [Introduction to HTTP](#Introduction-to-HTTP)
2. [Definition of Terms](#Definition-of-Terms)
    - Server
    - Uniform Resource Locator (url)
    - Stateless
    - Session
    - Cache

3. [HTTP Response](#HTTP-Response)
    - [HTTP Headers](#HTTP-Headers)
    - [HTTP Status Messages](#HTTP-Status-Messages)
4. [HTTP Methods](#HTTP-Methods)
    - GET
    - POST
    - PUT
    - DELETE

# Introduction to HTTP
__HTTP__: communication protocol that establishes the connection between __web browsers__ and __web servers__, HTTP is entirely based on the client-server model, where the client initiates the __requests__ then waits until it recives a __response__ from the server. The client can initiate the request using __HTTP request methods__.

i.e., __HTTP__ is an application layer __protocol__ that runs over __TCP (Transmission Control Protocol)__. TCP connections ensure that exchaged data packets are received in the same order that they are sent. __HTTP__ cna also run over an encrypted TCP connection, making it an __HTTPS__ connection, the standard secure connection on the internet. 

__HTTP-based__ systems have three components:
* __Client__:
* __Proxies__: - sists between client and server. Consists of routers, modems, e.t.c., and act as a gateway, cache, authentication, and more. They are not important to the typical functioning of HTTP
* __Servers__: computer on the internet running some form of data storage  and sharing application, most commonly web server application.
# Definition of Terms
7. __Uniform Resource Locator (URL)__: address pointing at a resource on the web.
12. __Stateless__: __HTTP__ is a __stateless__ protocol, meaning every request and response is unique, and no state is stored.
15. __Session__: Clients and servers can share information about states by passing information back and forth, creating a __session__.  __Session__ is a period with all the parameters that suggest you are active on the website.

# HTTP Response
* __The version__ identifies the __HTTP__ version, which will typically be the same as the request’s version.
* __The status code__ indicates whether a request was completed successfully. There are quite a few status codes.
* __The status message__ provides a human-readable message that helps describe the status code.
* __The headers__ allow the server to respond with additional metadata about the request. These are the same concept as request headers.
* __The body__ carries the content. Technically, this is optional, but typically it contains a useful resource.

# HTTP Headers
__HTTP Headers__: are used to define a few parameters governing __requests__ and __responses__: The __HTTP headers__ are divided into four categories:
1. __Request headers__: client to server
2. __Response headers__: Server to Client
3. __Representation headers__: information about the body of the resource
4. __Payload headers__: information about the payload data

HTTP Header | Description | Example
----------|----------------- | ----------
__Accept__ | What type of content the client can accept i.e., `Accept` header is used when the client wants to inform the server about the data type the client can understand.| Accept: image/png
__Accept-Encoding__ | The `Accept-Encoding` header is usually attached with a request to the server, indicating which encoding method is understandable by the client. | Accept-Encoding: gzip
__Authorization__ | the `Authorization` request header is used to pass the credentials so the server can authenticate the client. | Authorization: Basic dgfhWUytzgdfhgSYG
__Accept-Language__ | The `Accept-Language` request header is used to describe the language the client understands. | Accept-Language: en-US
__Content-Type__ | `Content-Type` representational header specifies the media type of the resource. This header indicates the content type of the returned data when the client didn't mention any content encoding. | Content-Type: text/html; charset=UTF-8
__Content-Location__ | `Content-Location` header indicates the alternate location for the response. It is used when an API can return data in different formats depending on the `Accept` header. | Content-Location: /examples/foo.json , Content-Location: /examples/foo.xml
__Content-Encoding__ | The `Content-Encoding` header compresses the message data or payload. | Content-Encoding: gzip
__Content-Length__ | As the header name suggests, it indicates the resource or message body size in bytes. It can be used with both requests and responses. | Content-Length: 148
__Content-Language__ | `Content-Language` indicates the human logical language of the response. This header is used to deliver resources in multiple languages so that users can choose their preferred language. | Content-Language: en-US 
__Cache-Control__ | `Cache-Control` header is used as a caching mechanism for both the request and response.We can pass several directives(values) with this header. | Cache-Control: max-age
__User-Agent__ | What software the client is using to communicate with the server |
__Server__ | What software the server is using to communicate with the client |
__Authentication__ | Who is calling the API and what credentials they have |

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


# HTTP Requests Methods
__HTTP Methods__: When calling an __API__, there are a few different __methods__, that you can use to specify what action you want to execute. For example, if you wanted to fetch some data, you’d use the method __GET__, and if you wanted to create some data, then you’d use the method __POST__. When purely consuming data using __APIs__, you’ll typically stick to __GET requests__, but here’s a list of the most common methods and their typical use case:

HTTP Header | Description | Requests Method
----------|----------------- | ---------
POST | Create a new resource | requests.post()
GET | Read an existing Resource | requests.get()
PATCH | Update an existing resource | requests.put()
DELETE | Delete an exsting resource | requests.delete()