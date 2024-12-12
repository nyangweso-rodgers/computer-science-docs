# System Design Concepts

## Table of Contents

- [System Design Concepts](#system-design-concepts)
  - [Table of Contents](#table-of-contents)
- [System Design Concepts](#system-design-concepts-1)
  - [Cookies](#cookies)
  - [Caches](#caches)
  - [1. Load Balancing](#1-load-balancing)
  - [Distributed Sys](#distributed-sys)
  - [](#)
- [Vertical vs. Horizontal Scaling](#vertical-vs-horizontal-scaling)
- [Disadvantages to Vertical Scaling](#disadvantages-to-vertical-scaling)
- [Resources and Further Reading](#resources-and-further-reading)

# System Design Concepts

## Cookies

- **Cookie** is a string of data passed back and forth between the **client** and **server** to create a **stateful** session. By example. **cookies** are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_.

- Mechanism Behind **Cookies** include:

  - server asks the browser to store this using a **Set-Cookie** header.
  - browser and server pass this info to and fro as part of request and response headers
  - stores a name value pair and attributes like **Expires**, **Domain**, **Path**.
  - **Cookie** in the header when communicating from Browser to server.
  - **Set-Cookie** in the header when communicating from server to browser.
  - These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
  - It is used by numerous websites to track your online activities.

- **Types of Cookies** include:

  1. Session Cookies
  2. Persistent/Permanent Cookies
  3. Third Party Cookies

- **Remarks**:
  - **Cookies** can be attacked. It's crucial to secure cookies as they contain personal information about a user's interests, login information, overall web browsing habits, and much more.
  - Here are a few points that can help us to minimize cookie attacks
    - **Use httpOnly attribute**: The `httpOnly` attribute prevents accessing cookies by the client-side script.
    - **Use SameSite attribute**: Use `SameSite=Strict` to prevent from cookies being sent with cross-site requests.
    - **Use only HTTPS**: It is important to use HTTPS on login pages and the entire website. Use SSL/TLS encryption to hide all data transfers, including cookie session IDs.
    - **Use anti-malware**: Using anti-malware solutions or reliable security plugins will protect your system from cookie stealing software
    - **Digital hygiene**: Digital hygiene refers to general tips that keep online connections secure. These include logging out of accounts to end the session once you are done, avoiding public wifi connections when possible, and regularly clearing out your browser's cookie data.

## Caches

- **Caching** is the temporary storage of information outside of the **server**.

* In between the **client** and the **server**, there are many points of presence where the cache can be stored:

  - The cache can be stored near the server like an **API gateway cache** on AWS.
  - The cache can be stored somewhere in the middle between the **client** and the **server** using a 3rd party solution or using a hierarchy of **proxy servers** that just holds cache data, and are called **caching proxy servers**. This is usually a shared cache so this cache can be shared by many clients.
  - Lastly, the cache can be stored on the client/in the app/on the device. It is not shared and is only available to the client. This is called a **private cache**.

* **Caching** information includes:
  - database query results
  - computationally intensive calculations
  - API requests/responses
  - data files like HTML, images or
  - any application data in general e.t.c

- **Benefits of caching** include:
  - improves application performance
  - reduced load on servers
  - reduced load on databases
  - eliminates database hotspots
  - increases Read Throughput(IOPS)
  - reduces bandwidth consumption

## 1. Load Balancing

- A **load balancer** sits in front of various servers and acts as a traffic cop to direct traffic to the right server. It makes sure that no server is overloaded, and provides high availability and reliability by ensuring all requests are served. If a server goes down, it starts redirecting the requests to different servers that are online.

- **Benefits** of a **load balancer**:

  - Faster user experience
  - Less downtime and high thorughput. If a particular server is down, LB takes care of routing the traffic to the ones which are up.
  - Reduces individual server load and prevents any one application server from becoming a single point of failure.
  - Improves response time
  - Improves overall system availability.

- **How Do Load Balancer Works**? A **load balancer** can use any of the below **algorithms** to decide where to route the next incoming request. The **algorithms** used depend on the use case:
  - **Least Connection Method**: Route traffic to the server with the fewest active connections.
  - **Least Response Time Method**: Route traffic to the server with the fewest active connections and the lowest average response time.
  - **Least Bandwidth Method**: Route traffic to the server that is currently serving the least amount of traffic measured in megabits per second (Mbps)
  - **Round Robin**: Routes through a list of servers and sends each new requst to the next server. When it reaches the end of the list, it starts over at the beginning.
  - **Weighted Rounded Robin Method**: The weighted round robin scheduling is designed to better handle servers with different processing capacities. Each server is assigned a weight (an integer that indicates the processing capacity). Servers with higher weights receive new connections before those with less weight and servers with higher weights get more connections than those with less weights.
  - **IP Hash**: Under this method, a hash of the IP address of the client is calculated to redirect the request.

## Distributed Sys

- A **distributed** system is one which is split into multiple running machines, all of which work together in a cluster to appear as one single node to the end user. **Kafka** is distributed in the sense that it stores, receives and sends messages on different nodes (called **brokers**).

##

1. **Protocol**: system of rules that allows communication of information between different entities, like computers.

2. **Payload**: When data is sent over the Internet, each unit transmitted includes both _header information_ and the _actual data_ being sent. The **header** identifies the _source_ and _destination_ of the packet, while the actual data is referred to as the **payload**. Because header information, or overhead data, is only used in the transmission process, it is stripped from the packet when it reaches its destination. Therefore, the **payload** is the only data received by the destination system.

3. **SSL/TLS**: (**Secure Socket Layer / Transport Layer Security**): are cryptographic protocols that ensure an encrypted connection between client and server. Websites that work over the basic HTTP protocol have an unencrypted and insecure connection. **HTTPS** connection is the norm on today’s internet, and the added ‘S’ indicates the website has an SSL/TLS certificate. When a browser connects to a server, it checks for an SSL certificate in a process called ‘the SSL handshake.’ After the browser verifies the certificate, the encrypted connection begins. Without **SSL/TLS certificates**, data transferred from your site to the server is at risk of interception attacks, usually known as MITM attacks (man in the middle).

4. **Domain Name System (DNS)**: It is called the phonebook of the internet because using **DNS** we can know the **IP address** of any website. **DNS** is the translator that translates domain names (that we use) into **IP addresses** (that browsers use). _Steps include_:

   - _User types a domain name in the browser and presses enter. (Ex- google . com)_
   - _This is a request for the files of the homepage of google and is called a query._
   - _The browser queries this from a DNS server._
   - _The DNS server finds the IP address of the requested domain and returns it to the web browser._
   - _The browser makes an HTTP request to the received IP address._
   - _The server of that address returns the files (HTML, CSS, Javascript files) to the browser._
   - _The browser uses these files to render a page and displays it to the user._

   **Five** DNS steps invovled in loading a webpage:

   - **DNS Cache**: _When you search for a website, it will be stored on your system's DNS cache and retrieved from there if you have visited it before. If cached, the rest of the DNS search ends here._
   - **Resolver Server**: _If not cached, a query is sent to a DNS Resolver server, which will check its own cache for the requested website._
   - **Root Server**: _Root servers are at the top of the DNS hierarchy. They redirect Resolver Servers to another type of server called TLD servers._
   - **TLD (Top Level Domain) Server**: _servers store information about domains ending with .com, .net, .org, and other ‘top level’ domains. The TLD sends a response to the resolver that redirects to another type of server to find information about the searched domain._
   - **Authoritative Name Server**: _The final stage is an Authoritative Name Server, which is responsible for knowing everything about the domain, including the IP address. It sends the IP address information back to the resolver, then the client._

   **Types of DNS Records** include:

   - An **"A" DNS record** is a type of DNS record that allows a computer to find the IP address of another computer. This is the most common type of DNS record and is used to map a domain name to an IP address.
   - A **CNAME** record is a type of DNS record that allows you to specify a canonical name for an alias. A **canonical name** is the official name of a domain or subdomain. You can use **CNAME** only if the API and the primary domain run under the same IP address.

5. **Firewall**: Web servers use a firewall to protect the system against breaches and attacks. For example , if a bad source starts flooding the web server with a large number of concurrent requests, the firewall will detect the problem and block requests from that **IP address** to keep them from reaching the web server.

6. **TCP (Transfer Control Protocol)**: HTTP uses the TCP transport layer protocol for establishing and maintaining a connection from your machine to the server to ensure reliable delivery. In HTTP requests, it’s the job of TCP protocols to ensure fast and efficient delivery.

# Vertical vs. Horizontal Scaling

- **Vertical scaling** involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (CPU, RAM, SSD) on the server.

- **Horizontal scalability** is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.

# Disadvantages to Vertical Scaling

- There are limits defined by the hardware. You cannot scale upwards indefinitely.
- It usually requires downtime, something which big corporations cannot afford.

# Resources and Further Reading
