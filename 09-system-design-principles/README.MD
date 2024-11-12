# System Design Concepts

## Table of Contents
- [System Design Concepts](#System-Design-Concepts)
    - Protocol
    - Payload
    - SSL/TLS
    - DNS
    - Firewall
    - Transfer Control Protocol (TCP)
    
- [Vertical vs. Horizontal Scaling](#Vertical-vs.-Horizontal-Scaling)
    - [Disadvantages to Vertical Scaling](#Disadvantages-to-Vertical-Scaling)
# System Design Concepts
1. __Protocol__: system of rules that allows communication of information between different entities, like computers.

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


7. __Firewall__: Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that __IP address__ to keep them from reaching the web server.

9. __TCP (Transfer Control Protocol)__: HTTP uses the TCP transport layer protocol for establishing and maintaining a connection from your machine to the server to ensure reliable delivery. In HTTP requests, it’s the job of TCP protocols to ensure fast and efficient delivery.

# Vertical vs. Horizontal Scaling
* __Vertical scaling__ involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (CPU, RAM, SSD) on the server.

* __Horizontal scalability__ is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.

# Disadvantages to Vertical Scaling
* There are limits defined by the hardware. You cannot scale upwards indefinitely.
* It usually requires downtime, something which big corporations cannot afford.