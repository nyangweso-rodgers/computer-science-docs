# Exploring HTTPS (HyperText Transfer Protocol)

## HTTP Request? 
HTTP requests contain the following elements:
* The __method__ describes what action the client wants to perform. The method for static content is typically __GET__, though there are others available, like __POST__, __HEAD__, and __DELETE__.
* The __path__ indicates to the server what web page you would like to request. For example, the path of this page is /python-https.
* __The version__ is one of several HTTP versions, like 1.0, 1.1, or 2.0. The most common is probably 1.1.
* __The headers__ help describe additional information for the server.
* __The body__ provides the server with information from the client. Though this field is not required, it’s typical for some methods to have a body, like a POST.

These are the tools your browser uses to communicate with a server. The server responds with an HTTP response. The HTTP response contains the following elements:

## HTTP Response
* __The version__ identifies the HTTP version, which will typically be the same as the request’s version.
* __The status code__ indicates whether a request was completed successfully. There are quite a few status codes.
* __The status message__ provides a human-readable message that helps describe the status code.
* __The headers__ allow the server to respond with additional metadata about the request. These are the same concept as request headers.
* __The body__ carries the content. Technically, this is optional, but typically it contains a useful resource.

### What Is HTTPS? (HyperText Transfer Protocol Secure)
Fundamentally, HTTPS is the same protocol as HTTP but with the added implication that the communications are secure.

HTTPS doesn’t rewrite any of the HTTP fundamentals on which it’s built. Instead, HTTPS consists of regular HTTP sent over an encrypted connection. Typically, this encrypted connection is provided by either TLS or SSL, which are cryptographic protocols that encrypt the information before it’s sent over a network.

_Note:_ _TLS and SSL are extremely similar protocols, though SSL is on its way out, with TLS to take its place. It’s enough to know that TLS is the newer, better version of SSL._

Again, HTTPS is just HTTP over TLS or SSL. TLS is designed to provide privacy from eavesdroppers. It can also provide authentication of both the client and the server.

### References
1. https://realpython.com/python-https/