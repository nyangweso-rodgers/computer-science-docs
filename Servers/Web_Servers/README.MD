# Web Servers

## Table of Contents
- [Introduction to Web Severs](#Introduction-to-Web-Severs)
- [Status Codes](#Status-Codes)
- [Load balancing](#Load-balancing)
- [References](#References)

# Introduction to Web Severs
__Web servers__ respond to __Hypertext Transfer Protocol__ (HTTP) __requests__ from __clients__ and send back a __response__ containing a __status code__ and often content such as _HTML_, _XML_ or _JSON_ as well. At the _hardware level_, a __web server__ is a machine (or collection of machines) that stores a website’s component files (e.g. HTML documents, images, videos, stylesheets, and JavaScript files) and delivers them to you. This is called __hosting__. At the _software level_, a __web server__, known as the __HTTP server__, controls how users access these hosted files. It processes and answers incoming requests. 

The server __response__ contains the following information
1. _web page_ 
2.  __status code__, 
3. __compression type__ (Content-Encoding), 
4. how to __cache__ the page (Cache-Control), 
5. any __cookies__ to set, 
6. privacy information, etc.

# Status Codes
There are five types of statuses detailed using a numerical code.
1. __1xx__ indicates an informational message only
2. __2xx__: indicates success of some kind
3. __3xx__: redirects the client to another __URL__
4. __4xx__: indicates an error on the client’s part
5. __5xx__: indicates an error on the server’s part

# Load balancing
Popular websites have to serve several thousands of concurrent requests and return correct text, image and video responses to them. To serve a large number of requests, the content is usually distributed across multiple servers. A __load balancer__ sits in front of these servers and acts as a traffic cop to direct traffic to the right server. It makes sure that no server is overloaded, and provides high availability and reliability by ensuring all requests are served. If a server goes down, it starts redirecting the requests to different servers that are online.

# References