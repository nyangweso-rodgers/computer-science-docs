# Servers

## Table Of Contents
- [Overview of Servers](#Overview-of-Servers)
- [Types of Servers](#Types-of-Servers)
    - [Web Servers](#Web-Severs)
        - [Web Server implementations](#Web-Server-Implementations)
    - [Application Servers](#Application-Server)

# Overview of Servers
* The __server__ can perform a wide range of functionalities including _data processing_, _storage_, and _serving it back to the client_. A __server__ can also _direct the client's request to the appropriate location_.

# Types of Servers
Based on _functionality_, servers are divided into different types:
1. __Origin__: actual __server__ that contains data and serves on client's request.
2. __Proxy__: have the ability to further pass your request to other servers. i.e., __intermediate servers__. The responsibility of a __proxy server__ is to contact actual (origin) sever on your behalf. Your __IP Address__ is hidden whenever your request goes through the __proxy server__.
3. __Web__: accepts requests via __HTTP__ and sends the World Wide Web information your browser.
4. __DNS (Domain Name System)__: As computer devices are interacted using __IP addresses__, the __DNS server__ provides the __IP address__ of the requested __URL__.
5. __Mail__: responsible for sending and receiving emails. When an email is sent, it first goes through the mail server. The mail server then sends it to the other mail server or the specific user.

# Web Severs
* __Web servers__ respond to __HTTP requests__ from __clients__ and send back a __response__ containing a __status code__ and often content such as _HTML_, _XML_ or _JSON_ as well. At the _hardware level_, a __web server__ is a machine (or collection of machines) that stores a website’s component files (e.g. HTML documents, images, videos, stylesheets, and JavaScript files) and delivers them to you. This is called __hosting__. At the _software level_, a __web server__, known as the __HTTP server__, controls how users access these hosted files. It processes and answers incoming requests. 

* The server __response__ contains the following information
    1. _web page_ 
    2.  __status code__, 
    3. __compression type__ (Content-Encoding), 
    4. how to __cache__ the page (Cache-Control), 
    5. any __cookies__ to set, 
    6. privacy information, etc.

# Web Server Implementations
* The [Apache HTTP Server](https://www.fullstackpython.com/apache-http-server.html) has been the most commonly deployed web server on the Internet
* [Nginx](https://www.fullstackpython.com/nginx.html) is the second mostly used server for the top 100,000 websites often deployed.
* [Caddy](https://www.fullstackpython.com/caddy.html) is a newcomer to the web server scene and is focused on serving the HTTP/2 protocol with HTTPS.
* [rwasa](https://2ton.com.au/rwasa/) is a newer web server written in Assembly with no external dependencies that tuned to be faster than Nginx. The benchmarks are worth taking a look at to see if this server could fit your needs if you need the fastest performance trading off for as of yet untested web server.

# Application Server
An application [server](https://techterms.com/definition/server) is a server specifically designed to run [applications](https://techterms.com/definition/application). The “server” includes both the hardware and software that provide an environment for programs to run.

A __web server__ is designed — and often optimized — to serve __webpages__. Therefore, it may not have the resources to run demanding web applications. An __application server__ provides the processing power and memory to run these applications in real-time. It also provides the environment to run specific applications. For example, a cloud service may need to process data on a Windows machine. A Linux-based server may provide the web interface for the cloud service, but it cannot run Windows applications. Therefore, it may send input data to a Windows-based application server. The application server can process the data, then return the result to the web server, which can output the result in a web browser.