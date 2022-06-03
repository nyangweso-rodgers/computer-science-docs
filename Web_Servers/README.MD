# Web Servers
# Table of Contents
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
- [Web Server Implementations](##Web-server-implementations)
- [References](#References)


# What is a Web Service?
A __web service__ is an __XML-based__ application communication system that translates data via __HTTP__ over the internet.

# Features of a Web Service
1. __XML based__: are __XML__ for data transportation. 
2. __Language Independent__: thanks to __XML__, web servces communicate effectively no matter  which programming language or operating systems are used.
3. __Complex Document Exchange__: __XML__ follows an element and tag-based format and can exchange large and complex entities such as charts, images, e.t.c.,
4. __Synchronous and synchronous__: Web services can work only by invoking the next task once the previous is complete or invoking and carrying out multiple tasks simulataneously.
5. __Loosely coupled__: a client's interface can change over time, but this doesn't affect the client's ability to interact with the web service, as they are independent of each other.

# Types of Web Services
1. XML-RPC (Remote Procedure Call)
2. UDDI (Universal Description, Discovery, and Integration)
3. REST
4. SOAP


# DNS lookup
The __DNS__ is the Internet’s version of Google Maps. It routes you to your destination. Your computer or your router knows the address of the __DNS server__. When you type the URL in a browser for the first time, it sends a request to the __DNS server__, which responds back with the __IP address__ of the web server hosting. This value is usually then cached or gets added into the list of known hosts, so your browser doesn’t have to do this lookup every time.

__DNS__(Domain Name System) is a database that maintains the name of the website (URL) and the particular __IP address__ it links to. Every single URL on the internet has a unique __IP address__ assigned to it. The __IP address__ belongs to the computer which hosts the server of the website we are requesting to access. For example, _www.google.com_ has an __IP address__ of _209.85.227.104_. So if you’d like, you can reach _www.google.com_ by typing _http://209.85.227.104_ on your browser. __DNS__ is a list of URLs, and their IP addresses, like how a phone book is a list of names and their corresponding phone numbers.

The primary purpose of __DNS__ is human-friendly navigation. You can easily access a website by typing the correct IP address for it on your browser, but imagine having to remember different sets of numbers for all the sites we regularly access? Therefore, it is easier to remember the name of the website using a URL and let DNS do the work for us by mapping it to the correct IP.

To find the __DNS__ record, the browser checks four caches.
- _First_, it checks the _browser cache_. The browser maintains a repository of DNS records for a fixed duration for websites you have previously visited. So, it is the first place to run a DNS query.
- _Second_, the browser checks the _OS cache_. If it is not in the browser cache, the browser will make a system call to your underlying computer OS to fetch the record since the OS also maintains a cache of DNS records.
- _Third_, it checks the _router cache_. If it’s not on your computer, the browser will communicate with the router that maintains its’ own cache of DNS records.
- Fourth, it checks the [ISP](https://en.wikipedia.org/wiki/Internet_service_provider) cache. If all steps fail, the browser will move on to the ISP. Your ISP maintains its’ own DNS server, which includes a cache of DNS records, which the browser would check with the last hope of finding your requested URL.

__Remark__: _Although our information being cached somewhere doesn’t make us feel very comfortable when it comes to privacy, caches are essential for regulating network traffic and improving data transfer times._

# OSI model
Now that your browser knows the IP address of the server, it needs to find a way to pass this request all the way to the server. There’s something called an OSI (__Open System Interconnection__) model that standardizes communication between different computing machines. It describes the flow of information from one computer to another. It defines _seven layers_, and the interplay of these layers magically brings, for example, holbertonschool.com from server to your machine. At both ends (__client__ and __server__), these layers are followed, but there is a difference in the flow of which layer kicks in first. When your browser sends the request, communication starts at the application layer and goes down to the physical layer — whereas in the server, while receiving the request, it would start at the physical layer, going up. On the other hand, when a server is responding to your browser’s request, it would go from application layer to physical layer — and when your computer receives the response, it would first go to the physical layer all the way back to the application layer.

# 7. Application layer: 
consists of protocols that directly interact with the end user. A protocol defines how different applications across machines communicate with each other. If you are requesting a web page, __HTTP__ (Hyper Text Transfer Protocol) will handle it, and if you are sending an email, __SMTP__ (Simple Mail Transfer Protocol) will handle it. So in the case of holbertonschool.com, your browser generates a HTTP request. Don’t confuse the browser as part of the application layer. The role of application layers comes in when your browser creates a HTTP request. This HTTP request is part of the application layer.

# 6. Presentation layer: 
Depending on your request (image, video, text, GIF, etc.), this layer converts and presents the data in readable format. In the case of holbertonschool.com, when your machine received it, the presentation layer would kick in to render it as a HTML page.

# 5. Session layer: 
responsible for establishing, maintaining, and terminating the session between devices. For example, when you are doing video chat, the time you enter into the chat to the time you leave it is one complete session, given there were no interruptions during that interval. However, in the case of holbertonschool.com, HTTP uses lower layer protocol, instead of session layer protocols.

# 4. Transport layer: 
takes care of the reliability, safety and security of the path taken between the request and response. Here, the transportation, delivery and assembling of data takes place. When you are requesting holbertonschool.com, essentially, you are not sending any data, but the role of this layer is more evident when you receive the data. The data your machine receives comes divided into packets with a sequence number assigned to each packet, called __data payloads__. This layer makes sure that you have received all packets and reassembles them in order. As I mentioned above, HTTP uses the TCP(__Transfer Control Protocol__) transport layer protocol instead of session layer protocols for establishing and maintaining a connection from your machine to the server to ensure reliable delivery. For security, it uses SSL (__Secure Sockets Layer__), which encrypts all data passed between browser and the web server, making all communications private and integral. In HTTP requests, it’s the job of TCP protocols to ensure fast and efficient delivery.

# 3. Network layer: 
This organizes and routes the data. It also decides which transfer protocols to use. So in the case of holbertonschool.com, the best path to route the data between your machine and web server is determined by the IP (Internet Protocol).

# 2. Data link layer: 
In this layer, data is broken down into pieces. So when the server sends holbertonschool.com, it doesn’t send the entire page all at once; rather, the data link layer segments it, encapsulates it and transmits it as packets (data payloads) through the physical layer. It is not necessary that the packets be delivered directly to your machine. It may travel from network to network, passing through many machines before reaching you. So in this case, IP addresses with all of these hops are translated to hardware addresses, at the data link layer.

# 1. Physical layer: 
The physical layer deals with the actual connectivity between your machine and the server. The hardware and signaling and encoding mechanisms required to form the actual connection are defined at this layer, and the data received from the server is in the form of raw bits.


Once the browser receives the correct IP address, it will build a connection with the server that matches the IP address to transfer information. Browsers use internet protocols to build such connections. There are several different internet protocols that can be used, but TCP is the most common protocol used for many types of HTTP requests.

To transfer data packets between your __computer__(client) and the __server__, it is important to have a TCP connection established. This connection is established using a process called the __TCP/IP three-way handshake__. This is a three-step process where the client and the server exchange SYN(synchronize) and ACK(acknowledge) messages to establish a connection.

1. The client machine sends a SYN packet to the server over the internet, asking if it is open for new connections.
2. If the server has open ports that can accept and initiate new connections, it’ll respond with an ACKnowledgment of the SYN packet using a SYN/ACK packet.
3. The client will receive the SYN/ACK packet from the server and will acknowledge it by sending an ACK packet.

Then a TCP connection is established for data transmission!




# Firewall
Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that IP address to keep them from reaching the web server.

# Application Server
An application [server](https://techterms.com/definition/server) is a server specifically designed to run [applications](https://techterms.com/definition/application). The “server” includes both the hardware and software that provide an environment for programs to run.

A __web server__ is designed — and often optimized — to serve __webpages__. Therefore, it may not have the resources to run demanding web applications. An __application server__ provides the processing power and memory to run these applications in real-time. It also provides the environment to run specific applications. For example, a cloud service may need to process data on a Windows machine. A Linux-based server may provide the web interface for the cloud service, but it cannot run Windows applications. Therefore, it may send input data to a Windows-based application server. The application server can process the data, then return the result to the web server, which can output the result in a web browser.


# Web server implementations
* The [Apache HTTP Server](https://www.fullstackpython.com/apache-http-server.html) has been the most commonly deployed web server on the Internet
* [Nginx](https://www.fullstackpython.com/nginx.html) is the second mostly used server for the top 100,000 websites often deployed.
* [Caddy](https://www.fullstackpython.com/caddy.html) is a newcomer to the web server scene and is focused on serving the HTTP/2 protocol with HTTPS.
* [rwasa](https://2ton.com.au/rwasa/) is a newer web server written in Assembly with no external dependencies that tuned to be faster than Nginx. The benchmarks are worth taking a look at to see if this server could fit your needs if you need the fastest performance trading off for as of yet untested web server.


# References
1. https://www.fullstackpython.com/web-servers.html
2. https://codeburst.io/what-happens-when-you-type-a-url-in-your-browser-and-press-enter-17d22e9a0560