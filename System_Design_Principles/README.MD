# System Design

## Table of Contents
- [Introduction to System Design](#Introduction-to-System-Design)

- [Overview of Servers](#Overview-of-Servers)
    - [Types of Servers](#Types-of-Servers)
    - [Web Servers](#Web-Severs)
        - [Web Server implementations](#Web-Server-Implementations)
    - [Application Servers](#Application-Server)

- [System Design Concepts](#System-Design-Concepts)
    - Protocol
    - IP Addresss
    - Payload
    - SSL/TLS
    - DNS
    - Load Balancer
    - Firewall
    - Caching
    - Transfer Control Protocol (TCP)
    - Cookies
    - Websocket
    
- [Vertical vs. Horizontal Scaling](#Vertical-vs.-Horizontal-Scaling)
    - [Disadvantages to Vertical Scaling](#Disadvantages-to-Vertical-Scaling)
- [References]()
    - 

# Introduction to System Design

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
__Web servers__ respond to __HTTP requests__ from __clients__ and send back a __response__ containing a __status code__ and often content such as _HTML_, _XML_ or _JSON_ as well. At the _hardware level_, a __web server__ is a machine (or collection of machines) that stores a website’s component files (e.g. HTML documents, images, videos, stylesheets, and JavaScript files) and delivers them to you. This is called __hosting__. At the _software level_, a __web server__, known as the __HTTP server__, controls how users access these hosted files. It processes and answers incoming requests. 

The server __response__ contains the following information
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

# System Design Concepts
1. __Protocol__: system of rules that allows communication of information between different entities, like computers.

2. __Internet Protocol (IP) Address__: used to actually transfer data between computers over a network. Every device connected to the internet has an __IP address__.

3. __Payload__: When data is sent over the Internet, each unit transmitted includes both _header information_ and the _actual data_ being sent. The __header__ identifies the _source_ and _destination_ of the packet, while the actual data is referred to as the __payload__. Because header information, or overhead data, is only used in the transmission process, it is stripped from the packet when it reaches its destination. Therefore, the __payload__ is the only data received by the destination system.

4. __SSL/TLS__: (__Secure Socket Layer / Transport Layer Security__): are cryptographic protocols that ensure an encrypted connection between client and server. Websites that work over the basic HTTP protocol have an unencrypted and insecure connection. __HTTPS__ connection is the norm on today’s internet, and the added ‘S’ indicates the website has an SSL/TLS certificate. When a browser connects to a server, it checks for an SSL certificate in a process called ‘the SSL handshake.’ After the browser verifies the certificate, the encrypted connection begins. Without __SSL/TLS certificates__, data transferred from your site to the server is at risk of interception attacks, usually known as MITM attacks (man in the middle).

5. __Domain Name System (DNS)__: It is called the phonebook of the internet because using __DNS__ we can know the __IP address__ of any website. __DNS__ is the translator that translates domain names (that we use) into __IP addresses__ (that browsers use). _Steps include_:
    * _User types a domain name in the browser and presses enter. (Ex- google . com)_
    * _This is a request for the files of the homepage of google and is called a query._
    * _The browser queries this from a DNS server._
    * _The DNS server finds the IP address of the requested domain and returns it to the web browser._
    * _The browser makes an HTTP request to the received IP address._
    * _The server of that address returns the files (HTML, CSS, Javascript files) to the browser._
    * _The browser uses these files to render a page and displays it to the user._

    __Five__ DNS steps invovled in loading a webpage:
    * __DNS Cache__: _When you search for a website, it will be stored on your system's DNS cache and retrieved from there if you have visited it before. If cached, the rest of the DNS search ends here._
    * __Resolver Server__: _If not cached, a query is sent to a DNS Resolver server, which will check its own cache for the requested website._
    * __Root Server__: _Root servers are at the top of the DNS hierarchy. They redirect Resolver Servers to another type of server called TLD servers._
    * __TLD (Top Level Domain) Server__: _servers store information about domains ending with .com, .net, .org, and other ‘top level’ domains. The TLD sends a response to the resolver that redirects to another type of server to find information about the searched domain._
    * __Authoritative Name Server__: _The final stage is an Authoritative Name Server, which is responsible for knowing everything about the domain, including the IP address. It sends the IP address information back to the resolver, then the client._

    __Types of DNS Records__ include:
    * An __"A" DNS record__ is a type of DNS record that allows a computer to find the IP address of another computer. This is the most common type of DNS record and is used to map a domain name to an IP address.
    * A __CNAME__ record is a type of DNS record that allows you to specify a canonical name for an alias. A __canonical name__ is the official name of a domain or subdomain. You can use __CNAME__ only if the API and the primary domain run under the same IP address.

6. __Load Balancer__: A __load balancer__ sits in front of various servers and acts as a traffic cop to direct traffic to the right server. It makes sure that no server is overloaded, and provides high availability and reliability by ensuring all requests are served. If a server goes down, it starts redirecting the requests to different servers that are online.

    __Benefits of a load balancer__ include:
    * Faster user experience
    * Less downtime and high thorughput. If a particular server is down, LB takes care of routing the traffic to the ones which are up.
    * Reduces individual server load and prevents any one application server from becoming a single point of failure.
    * Improves response time
    * Improves overall system availability.

    __How Do Load Balancer Works?__: A __load balancer__ can use any of the below __algorithms__ to decide where to route the next incoming request. The __algorithms__ used depend on the use case:
    * __Least Connection Method__: Route traffic to the server with the fewest active connections.
    * __Least Response Time Method__: Route traffic to the server with the fewest active connections and the lowest average response time.
    * __Least Bandwidth Method__: Route traffic to the server that is currently serving the least amount of traffic measured in megabits per second (Mbps)
    * __Round Robin__: Routes through a list of servers and sends each new requst to the next server. When it reaches the end of the list, it starts over at the beginning.
    * __Weighted Rounded Robin Method__: The weighted round robin scheduling is designed to better handle servers with different processing capacities. Each server is assigned a weight (an integer that indicates the processing capacity). Servers with higher weights receive new connections before those with less weight and servers with higher weights get more connections than those with less weights.
    * __IP Hash__: Under this method, a hash of the IP address of the client is calculated to redirect the request.

7. __Firewall__: Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that __IP address__ to keep them from reaching the web server.

8. __Caching__: is the temporary storage of information outside of the server. In between the __client__ and the __server__, there are many points of presence where the cache can be stored:
    *  The cache can be stored near the server like an __API gateway cache__ on AWS. 
    * The cache can be stored somewhere in the middle between the client and the server using a 3rd party solution or using a hierarchy of proxy servers that just holds cache data, and are called __caching proxy servers__. This is usually a shared cache so this cache can be shared by many clients. 
    * Lastly, the cache can be stored on the client/in the app/on the device. It is not shared and is only available to the client. This is called a __private cache__.

    __Caching__ information includes:
    * database query results
    * computationally intensive calculations
    * API requests/responses
    * data files like HTML, images or
    * any application data in general e.t.c

    __Benefits of caching__ include:
    * improves application performance
    * reduced load on servers
    * reduced load on databases
    * eliminates database hotspots
    * increases Read Throughput(IOPS)
    * reduces bandwidth consumption

9. __TCP (Transfer Control Protocol)__: HTTP uses the TCP transport layer protocol for establishing and maintaining a connection from your machine to the server to ensure reliable delivery. In HTTP requests, it’s the job of TCP protocols to ensure fast and efficient delivery.

10. __Cookie__: string of data passed back and forth between the __client__ and __server__ to create a __stateful__ session. By example. __cookies__ are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_. 
    __Mechanism Behind Cookies__ include:
    * server asks the browser to store this using a _Set-Cookie_ header.
    * browser and server pass this info to and fro as part of request and response headers
    * stores a name value pair and attributes like Expires, Domain, Path.
    * Cookie in the header when communicating from Browser to server.
    * Set-Cookie in the header when communicating from server to browser.
    * These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
    * It is used by numerous websites to track your online activities.

    __Types of Cookies__ include:
    * Session Cookies
    * Persistent/Permanent Cookies
    * Third Party Cookies

    __Remarks__:
    * Cookies can be attacked. It's crucial to secure cookies as they contain personal information about a user's interests, login information, overall web browsing habits, and much more.
    * Here are a few points that can help us to minimize cookie attacks
        - _Use httpOnly attribute_: The `httpOnly` attribute prevents accessing cookies by the client-side script.
        - _Use SameSite attribute_: Use `SameSite=Strict` to prevent from cookies being sent with cross-site requests.
        - _Use only HTTPS_: It is important to use HTTPS on login pages and the entire website. Use SSL/TLS encryption to hide all data transfers, including cookie session IDs.
        - _Use anti-malware_: Using anti-malware solutions or reliable security plugins will protect your system from cookie stealing software
        - _Digital hygiene_: Digital hygiene refers to general tips that keep online connections secure. These include logging out of accounts to end the session once you are done, avoiding public wifi connections when possible, and regularly clearing out your browser's cookie data.

11. __Websocket__: is a communications protocol that provides dynamic communication over a single __TCP connection__. __WebSockets__ acts as a thin transport layer that sits on top of your TCP/IP technology stack. With the API, you can send messages to a server and receive event-driven responses without needing to poll the server for a reply.
# Vertical vs. Horizontal Scaling
* __Vertical scaling__ involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (CPU, RAM, SSD) on the server.

* __Horizontal scalability__ is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.

# Disadvantages to Vertical Scaling
* There are limits defined by the hardware. You cannot scale upwards indefinitely.
* It usually requires downtime, something which big corporations cannot afford.