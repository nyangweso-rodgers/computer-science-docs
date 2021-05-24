# Understanding Web Servers
# Table of Contents
- [Web Browser](###What-is-a-browser?)
- [DNS](###DNS-lookup)
- [OSI model](###OSI-model)
    - [application layer](####7.-Application-layer:)
    - [presentation layer](####6.-Presentation-layer:)
    - [session layer](####5.-Session-layer:)
    - [transport layer](####4.-Transport-layer:)
    - [network layer](####3.-Network-layer:)
    - [Data Link Layer](####2.-Data-link-layer:)
    - [Physical Layer](####1.-Physical-layer:)
- [Web Servers](##Web-Servers)
    - [Load Balancing](##Load-balancing)
    - [Firewall](##Firewall)
- [Application Servers](##Application-Server)
- [Databases](##Database)
- [Web Server Implementations](##Web-server-implementations)
- [References](##References)



## How Web Works
### What is a browser?
the browser is the medium that allows you to make a request and lets a server serve you. It’s software installed and running on your computer that lets you search the Internet. It takes your input, creates and sends a request, gets the response and serves you.

_How does your browser know which server to send the request to?_: it needs to find its address. So, it queries the __DNS__ (Domain Name Server) to find the __IP__.

### DNS lookup
The __DNS__ is the Internet’s version of Google Maps. It routes you to your destination. Your computer or your router knows the address of the DNS server. When you type the URL in a browser for the first time, it sends a request to the __DNS server__, which responds back with the __IP address__ of the web server hosting, for example, holbertonschool.com. This value is usually then cached or gets added into the list of known hosts, so your browser doesn’t have to do this lookup every time.

__DNS__(Domain Name System) is a database that maintains the name of the website (URL) and the particular IP address it links to. Every single URL on the internet has a unique IP address assigned to it. The IP address belongs to the computer which hosts the server of the website we are requesting to access. For example, www.google.com has an IP address of 209.85.227.104. So if you’d like, you can reach www.google.com by typing http://209.85.227.104 on your browser. DNS is a list of URLs, and their IP addresses, like how a phone book is a list of names and their corresponding phone numbers.

The primary purpose of DNS is human-friendly navigation. You can easily access a website by typing the correct IP address for it on your browser, but imagine having to remember different sets of numbers for all the sites we regularly access? Therefore, it is easier to remember the name of the website using a URL and let DNS do the work for us by mapping it to the correct IP.

To find the DNS record, the browser checks four caches.
- _First_, it checks the _browser cache_. The browser maintains a repository of DNS records for a fixed duration for websites you have previously visited. So, it is the first place to run a DNS query.
- _Second_, the browser checks the _OS cache_. If it is not in the browser cache, the browser will make a system call to your underlying computer OS to fetch the record since the OS also maintains a cache of DNS records.
- _Third_, it checks the _router cache_. If it’s not on your computer, the browser will communicate with the router that maintains its’ own cache of DNS records.
- Fourth, it checks the [ISP](https://en.wikipedia.org/wiki/Internet_service_provider) cache. If all steps fail, the browser will move on to the ISP. Your ISP maintains its’ own DNS server, which includes a cache of DNS records, which the browser would check with the last hope of finding your requested URL.

__Remark__: _Although our information being cached somewhere doesn’t make us feel very comfortable when it comes to privacy, caches are essential for regulating network traffic and improving data transfer times._

### OSI model
Now that your browser knows the IP address of the server, it needs to find a way to pass this request all the way to the server. There’s something called an OSI (__Open System Interconnection__) model that standardizes communication between different computing machines. It describes the flow of information from one computer to another. It defines _seven layers_, and the interplay of these layers magically brings, for example, holbertonschool.com from server to your machine. At both ends (__client__ and __server__), these layers are followed, but there is a difference in the flow of which layer kicks in first. When your browser sends the request, communication starts at the application layer and goes down to the physical layer — whereas in the server, while receiving the request, it would start at the physical layer, going up. On the other hand, when a server is responding to your browser’s request, it would go from application layer to physical layer — and when your computer receives the response, it would first go to the physical layer all the way back to the application layer.

#### 7. Application layer: 
consists of protocols that directly interact with the end user. A protocol defines how different applications across machines communicate with each other. If you are requesting a web page, __HTTP__ (Hyper Text Transfer Protocol) will handle it, and if you are sending an email, __SMTP__ (Simple Mail Transfer Protocol) will handle it. So in the case of holbertonschool.com, your browser generates a HTTP request. Don’t confuse the browser as part of the application layer. The role of application layers comes in when your browser creates a HTTP request. This HTTP request is part of the application layer.

#### 6. Presentation layer: 
Depending on your request (image, video, text, GIF, etc.), this layer converts and presents the data in readable format. In the case of holbertonschool.com, when your machine received it, the presentation layer would kick in to render it as a HTML page.

#### 5. Session layer: 
responsible for establishing, maintaining, and terminating the session between devices. For example, when you are doing video chat, the time you enter into the chat to the time you leave it is one complete session, given there were no interruptions during that interval. However, in the case of holbertonschool.com, HTTP uses lower layer protocol, instead of session layer protocols.

#### 4. Transport layer: 
takes care of the reliability, safety and security of the path taken between the request and response. Here, the transportation, delivery and assembling of data takes place. When you are requesting holbertonschool.com, essentially, you are not sending any data, but the role of this layer is more evident when you receive the data. The data your machine receives comes divided into packets with a sequence number assigned to each packet, called __data payloads__. This layer makes sure that you have received all packets and reassembles them in order. As I mentioned above, HTTP uses the TCP(__Transfer Control Protocol__) transport layer protocol instead of session layer protocols for establishing and maintaining a connection from your machine to the server to ensure reliable delivery. For security, it uses SSL (__Secure Sockets Layer__), which encrypts all data passed between browser and the web server, making all communications private and integral. In HTTP requests, it’s the job of TCP protocols to ensure fast and efficient delivery.

#### 3. Network layer: 
This organizes and routes the data. It also decides which transfer protocols to use. So in the case of holbertonschool.com, the best path to route the data between your machine and web server is determined by the IP (Internet Protocol).

#### 2. Data link layer: 
In this layer, data is broken down into pieces. So when the server sends holbertonschool.com, it doesn’t send the entire page all at once; rather, the data link layer segments it, encapsulates it and transmits it as packets (data payloads) through the physical layer. It is not necessary that the packets be delivered directly to your machine. It may travel from network to network, passing through many machines before reaching you. So in this case, IP addresses with all of these hops are translated to hardware addresses, at the data link layer.

#### 1. Physical layer: 
The physical layer deals with the actual connectivity between your machine and the server. The hardware and signaling and encoding mechanisms required to form the actual connection are defined at this layer, and the data received from the server is in the form of raw bits.


Once the browser receives the correct IP address, it will build a connection with the server that matches the IP address to transfer information. Browsers use internet protocols to build such connections. There are several different internet protocols that can be used, but TCP is the most common protocol used for many types of HTTP requests.

To transfer data packets between your __computer__(client) and the __server__, it is important to have a TCP connection established. This connection is established using a process called the __TCP/IP three-way handshake__. This is a three-step process where the client and the server exchange SYN(synchronize) and ACK(acknowledge) messages to establish a connection.

1. The client machine sends a SYN packet to the server over the internet, asking if it is open for new connections.
2. If the server has open ports that can accept and initiate new connections, it’ll respond with an ACKnowledgment of the SYN packet using a SYN/ACK packet.
3. The client will receive the SYN/ACK packet from the server and will acknowledge it by sending an ACK packet.

Then a TCP connection is established for data transmission!

## Web Servers
__Web servers__ respond to __Hypertext Transfer Protocol__ (HTTP) __requests__ from __clients__ and send back a __response__ containing a __status code__ and often content such as _HTML_, _XML_ or _JSON_ as well.

This might mean a physical machine or software. In the case of holbertonschool.com, both work together to make sure that the website is accessible (up and running). At the hardware level, a web server is a machine (or collection of machines) that stores a website’s component files (e.g. HTML documents, images, videos, stylesheets, and JavaScript files) and delivers them to you. This is called hosting. At the software level, a web server, known as the HTTP server, controls how users access these hosted files. It processes and answers incoming requests. When you request holbertonschool.com, the HTTP server checks whether the requested URL matches any existing files, and if found, sends the files’ content back to the browser, or sends a “404 Not Found” error.

The server response contains the web page you requested as well as the status code, compression type (Content-Encoding), how to cache the page (Cache-Control), any cookies to set, privacy information, etc.

There are five types of statuses detailed using a numerical code.
- 1xx indicates an informational message only
- 2xx indicates success of some kind
- 3xx redirects the client to another URL
- 4xx indicates an error on the client’s part
- 5xx indicates an error on the server’s part

So, if you encountered an error, you can take a look at the HTTP response to check what type of status code you have received.

## Load balancing
Popular websites have to serve several thousands of concurrent requests and return correct text, image and video responses to them. To serve a large number of requests, the content is usually distributed across multiple servers. A load balancer sits in front of these servers and acts as a traffic cop to direct traffic to the right server. It makes sure that no server is overloaded, and provides high availability and reliability by ensuring all requests are served. If a server goes down, it starts redirecting the requests to different servers that are online.

## Firewall
Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that IP address to keep them from reaching the web server.

## Application Server
An application [server](https://techterms.com/definition/server) is a server specifically designed to run [applications](https://techterms.com/definition/application). The “server” includes both the hardware and software that provide an environment for programs to run.

A __web server__ is designed — and often optimized — to serve __webpages__. Therefore, it may not have the resources to run demanding web applications. An __application server__ provides the processing power and memory to run these applications in real-time. It also provides the environment to run specific applications. For example, a cloud service may need to process data on a Windows machine. A Linux-based server may provide the web interface for the cloud service, but it cannot run Windows applications. Therefore, it may send input data to a Windows-based application server. The application server can process the data, then return the result to the web server, which can output the result in a web browser.

## Database
A database is an organized collection of structured information, or data, typically stored electronically in a computer system. A database is usually controlled by a database management system (DBMS). Together, the data and the DBMS, along with the applications that are associated with them, are referred to as a database system, often shortened to just database.


## Web server implementations
* The [Apache HTTP Server](https://www.fullstackpython.com/apache-http-server.html) has been the most commonly deployed web server on the Internet
* [Nginx](https://www.fullstackpython.com/nginx.html) is the second mostly used server for the top 100,000 websites often deployed.
* [Caddy](https://www.fullstackpython.com/caddy.html) is a newcomer to the web server scene and is focused on serving the HTTP/2 protocol with HTTPS.
* [rwasa](https://2ton.com.au/rwasa/) is a newer web server written in Assembly with no external dependencies that tuned to be faster than Nginx. The benchmarks are worth taking a look at to see if this server could fit your needs if you need the fastest performance trading off for as of yet untested web server.


## References
1. https://www.fullstackpython.com/web-servers.html
2. https://codeburst.io/what-happens-when-you-type-a-url-in-your-browser-and-press-enter-17d22e9a0560