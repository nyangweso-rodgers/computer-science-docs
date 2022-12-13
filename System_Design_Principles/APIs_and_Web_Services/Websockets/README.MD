# Websockets

## Table Of Contents
- [Introduction to Websockets](#Introduction-to-Websockets)
- [Features Of Websockets](#Features-Of-Websockets)
- [Use Cases Of Websockets](#Use-Cases-Of-Websockets)

# Introduction to Websockets
* A __WebSocket__ is a persistent bi-directional communication channel between _client_ and _server_. Unlike __HTTP connections__, __WebSockets__ can communicate to and fro simultaneously. 

* Although distinct from __HTTP__, __WebSocket__ connections are initiated by an HTTP request (The HTTP ‘handshake’). After this, communication runs over the __TCP__ layer (__Transmission Control Protocol__). Once a __WebSocket__ connection is established, it remains open until one of either the client or server terminates it.

# Features Of Websockets
* Because of the bi-directional connection, __WebSockets__ allow users to send and receive data in real-time, removing the need to refresh pages manually. 
* __Wbsockets__ are low-latency and provide high-speed connections. 
* __Websockets__ are secure because they use the __WSS protocol__ (WebSocket Secure), which uses standard SSL/TLS encryption, and is the equivalent of HTTPS.

# Use Cases Of Websockets
* They are commonly used in chat apps, gaming apps, and any others that benefit from real-time updates. 

# Cons Of Websockets
* __WebSockets__ have one distinct major failing — while it might have support for HTTP-like functionality, it is not HTTP whatsoever. This has implications, especially when considering optimizing in HTTP such as caching, proxying, etc., that haven’t quite become apparent.