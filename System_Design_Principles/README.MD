# System Design

## Table of Contents
- [Introduction to System Design](#Introduction-to-System-Design)

- [Overview of Servers](#Overview-of-Servers)
    - [Types of Servers](#Types-of-Servers)

- [System Design Concepts](#System-Design-Concepts)
    - SSL/TLS
    - DNS
    - Load Balancer
    - Firewall
    - Caching
    
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

# System Design Concepts
1. __SSL/TLS__: (__Secure Socket Layer / Transport Layer Security__): are cryptographic protocols that ensure an encrypted connection between client and server. Websites that work over the basic HTTP protocol have an unencrypted and insecure connection. __HTTPS__ connection is the norm on today’s internet, and the added ‘S’ indicates the website has an SSL/TLS certificate. When a browser connects to a server, it checks for an SSL certificate in a process called ‘the SSL handshake.’ After the browser verifies the certificate, the encrypted connection begins. Without __SSL/TLS certificates__, data transferred from your site to the server is at risk of interception attacks, usually known as MITM attacks (man in the middle).

2. __Domain Name System (DNS)__: It is called the phonebook of the internet because using __DNS__ we can know the __IP address__ of any website. __DNS__ is the translator that translates domain names (that we use) into __IP addresses__ (that browsers use). _Steps include_:
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

3. __Load Balancer__: A __load balancer__ sits in front of various servers and acts as a traffic cop to direct traffic to the right server. It makes sure that no server is overloaded, and provides high availability and reliability by ensuring all requests are served. If a server goes down, it starts redirecting the requests to different servers that are online.

4. ___Firewall__: Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that __IP address__ to keep them from reaching the web server.

5. __Caching__: is the temporary storage of information outside of the server. In between the __client__ and the __server__, there are many points of presence where the cache can be stored:
    *  The cache can be stored near the server like an __API gateway cache__ on AWS. 
    * The cache can be stored somewhere in the middle between the client and the server using a 3rd party solution or using a hierarchy of proxy servers that just holds cache data, and are called __caching proxy servers__. This is usually a shared cache so this cache can be shared by many clients. 
    * Lastly, the cache can be stored on the client/in the app/on the device. It is not shared and is only available to the client. This is called a __private cache__.

6. Network Protocols
4. CDNs 

# Vertical vs. Horizontal Scaling
* __Vertical scaling__ involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (CPU, RAM, SSD) on the server.

* __Horizontal scalability__ is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.

# Disadvantages to Vertical Scaling
* There are limits defined by the hardware. You cannot scale upwards indefinitely.
* It usually requires downtime, something which big corporations cannot afford.