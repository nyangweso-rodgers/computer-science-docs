# System Design Concepts

## Table of Contents

- [System Design Concepts](#system-design-concepts)
  - [Table of Contents](#table-of-contents)
- [System Design Concepts](#system-design-concepts-1)
- [Strategies For Scalable Systems](#strategies-for-scalable-systems)
  - [1. Stateless Services](#1-stateless-services)
  - [2. Horizontal Scaling](#2-horizontal-scaling)
  - [3. Load Balancing](#3-load-balancing)
  - [4. Caching](#4-caching)
  - [5. Database Replication](#5-database-replication)
  - [6. Database Sharding](#6-database-sharding)
  - [7. Async Processing](#7-async-processing)
- [Software- Architecture Pattersn](#software--architecture-pattersn)
  - [1. Backend for Frontend (BFF) Architecture](#1-backend-for-frontend-bff-architecture)
- [Repository Organization](#repository-organization)
  - [1. Monolith](#1-monolith)
  - [1. Mongorepo](#1-mongorepo)
  - [Cookies](#cookies)
  - [Distributed Sys](#distributed-sys)
  - [](#)
- [Resources and Further Reading](#resources-and-further-reading)

# System Design Concepts

# Strategies For Scalable Systems

## 1. Stateless Services

- A **stateless service** is one that doesn’t retain information about **client sessions** between requests. Each request contains all the information necessary for the server to process it.
- **Stateless architecture** makes scaling much easier because it allows servers to be interchangeable and reduces the complexity of managing the state.

- Benefits:

  - **Ease of Scaling**: Stateless services can easily be duplicated across multiple servers
  - **Fault Tolerance**: If a server fails, requests can be redirected to another server without losing session data.

- Implementation Tips:
  - Use tokens like **JSON Web Tokens** (**JWT**) to store session data on the client side instead of the server.
  - For operations requiring state (e.g., shopping cart sessions), consider externalizing state management to a database or caching layer like **Redis**.

## 2. Horizontal Scaling

- **Vertical scaling** involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (**CPU**, **RAM**, **SSD**) on the server.
- **Disadvantages to Vertical Scaling**

  1. There are limits defined by the hardware. You cannot scale upwards indefinitely.
  2. It usually requires downtime, something which big corporations cannot afford.

- **Horizontal scalability** is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.
- **Horizontal scaling**, or "scale-out," involves adding more servers to share the load. Unlike **vertical scaling**, which involves upgrading hardware, **horizontal scaling** is more cost-effective and provides better fault tolerance.

- Why It Matters:

  1. **Redundancy**: Multiple servers reduce the impact of single points of failure.
  2. **Scalability**: You can handle larger workloads by simply adding more servers.

- Implementation Tips:
  1. Ensure your system supports distributed workloads. Tools like **Kubernetes** can help manage containerized applications across multiple nodes.
  2. Use **stateless services** to simplify horizontal scaling, as each server can independently handle requests.

## 3. Load Balancing

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

- **Implementation Tips**:
  1. Use hardware or software load balancers like **NGINX**, **HAProxy**, or AWS **Elastic Load Balancer**.
  2. Implement health checks to ensure that the load balancer only sends requests to functioning servers.
  3. Configure sticky sessions cautiously, as they can introduce statefulness and reduce flexibility.

## 4. Caching

- **Caching** is the temporary storage of information outside of the **server**.
- In between the **client** and the **server**, there are many points of presence where the cache can be stored:

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

- **Implementation Tips**:
  1. Use caching tools like Redis, Memcached, or Varnish.
  2. Implement different caching layers:
     1. **Database Caching**: Cache query results to avoid recalculating them.
     2. **Application Caching**: Store data in memory for quick access.
     3. **Content Delivery Networks** (**CDNs**): Cache static assets like images and scripts close to the user.
  3. Set appropriate expiration times to ensure cached data remains up-to-date.

## 5. Database Replication

- **Database replication** involves creating multiple copies of your database across different nodes. These replicas can handle read requests, improving both performance and redundancy.

## 6. Database Sharding

- **Sharding** is the process of dividing your database into smaller, more manageable pieces called **shards**. Each **shard** contains a subset of the data and operates independently.

## 7. Async Processing

- **Asynchronous processing** moves resource-intensive tasks, such as sending emails or generating reports, to background workers. This allows the system to handle new requests without waiting for the completion of these tasks.
- **Implementation Tips**:
  1. Use message queues like **RabbitMQ**, **Kafka**, or **AWS SQS** to manage task queues.
  2. Implement retry mechanisms to handle failures in background tasks.
  3. Prioritize idempotency for tasks to ensure they can be retried safely without duplication.

# Software- Architecture Pattersn

## 1. Backend for Frontend (BFF) Architecture

- As applications become more distributed, the need to tailor backend services to individual client needs has become critical for delivering fast, maintainable, and secure user experiences.
- At its core, **Backend for Frontend** is a architecture pattern that provides a dedicated backend layer for each frontend interface. Each frontend (e.g., mobile app, web app, smart device, etc.) may have different performance, data, and interaction needs. Instead of relying on a single monolithic or generalized API, a BFF tailors the backend to the specific needs of a given frontend.
- In essence, for every client or group of clients (such as mobile or web), you build a separate backend that:
  1. Consolidates or orchestrates calls to various services.
  2. Prepares data in a client-friendly format.
  3. Handles specific logic tied to the frontend.
- This allows for a separation of concerns, making it easier to optimize each backend for the client’s specific use case.

- **How BFF Works**:

  1. **Client Requests**: The client (mobile, web, etc.) makes a request to its corresponding BFF.
  2. **BFF Layer**: The BFF consolidates data from multiple microservices, performs any transformations or optimizations, and responds with a tailored response.
  3. **Microservices**: The BFF interacts with underlying services (e.g., user service, order service, etc.).

- **Traditional Architectures vs BFF**:

  - In **traditional architectures**, a single **API gateway** often handles requests from different clients (e.g., web, mobile, IoT). While an API gateway is great for routing requests, adding authentication, and rate limiting, it lacks the flexibility to handle frontend-specific needs, such as:
    - Tailored data models for different client apps.
    - Specialized performance optimizations for slower mobile networks.
    - Managing complex orchestration between services for specific frontends.
  - The **monolithic API** approach often leads to over-fetching (too much data) or under-fetching (too little data), forcing clients to make multiple round trips to collect the necessary information. BFF solves this by separating backends, ensuring each client gets precisely what it needs.

- **Why Use BFF**:

  - **Tailored User Experiences**: Each frontend — whether it’s a mobile app, desktop, or wearable device — gets exactly the data it needs, without extra clutter. Like having a perfectly sized suit for every occasion.
  - **Reduced Complexity**: The BFF simplifies things by customizing each backend, ensuring seamless experiences across platforms.
  - **Improved Performance**: BFFs are turbochargers for your app. By reducing unnecessary API calls, they ensure faster responses and happier users.
  - **Faster Development**: When teams work on different BFFs for each frontend, they can move faster without stepping on each other’s toes. It’s like having multiple chefs in the kitchen, each mastering their own dish.
  - **Enhanced Security**: Since the BFF controls all interaction with the backend, it can enforce strict security measures, such as token validation, input validation, and rate limiting, making the system more secure.

- **When to use BFF?**

  - **Multi-Platform Applications** — For companies building multi-platform apps (web, mobile, smart devices), BFF allows each platform to get a tailored experience.
  - **Microservice Orchestration** — In a microservices architecture, clients may need to fetch data from multiple services (e.g., user service, order service, inventory service). BFF can act as the orchestrator that pulls together the necessary data from various services and presents it as a cohesive response to the client.
  - **Optimizing Legacy APIs** — When migrating to microservices or using legacy systems, a BFF can help mask the complexities of the underlying architecture. It provides a modern interface to the frontend while still interacting with older systems.

- **Challenges of BFF**:

  1. **Increased Maintenance Overhead**: Having multiple backends to maintain (one per frontend) can increase complexity. This necessitates additional monitoring, scaling, and security measures.
  2. **Consistency Issues**: If not designed carefully, having separate backends can lead to inconsistencies in data returned across different clients.
  3. **Performance Bottlenecks**: The BFF layer could become a performance bottleneck if it’s not optimized for handling numerous requests or if it performs heavy computation.

- **Best Practices for BFF**:
  1. **Limit Business Logic in BFF**: The BFF should primarily focus on orchestrating and formatting data for the frontend, not implementing complex business logic.
  2. **Use Caching**: To improve performance, especially for mobile clients, you can cache common responses in the BFF layer.
  3. **Error Handling**: Centralize error handling and logging in the BFF to prevent client-facing issues.
  4. **Security**: Secure the BFF by enforcing authentication, authorization, and rate limiting at the BFF level to protect your backend services.

# Repository Organization

## 1. Monolith

## 1. Mongorepo

- A **monorepo** (**mono repository**) is a version management configuration that stores many projects in one repository. The projects can be unrelated and can be completely distinct.

- **Benefits of Using a Monorepo**

  - Provides a single source of truth
  - Makes it easy to share code.
  - Makes it easier to refactor code.

- Difference Between **Monorepo** and **Monolith**:

  - A **monorepo** is a massive codebase containing independent projects, whereas a **monolith** (or **monolithic application**) is a service or set of services dedicated to a single dataset (or project). The dataset, however, can have many sub-projects. But, typically, we think of a **monolith** and a single entity with related data.
  - A **monolith** can be managed in a **monorepo**. But a **monolith** could also be split into multiple repositories. Conversely, a **monorepo** cannot be stored in a **monolithic application**; instead, monorepos can be used with microservices instead.

- **Monolith vs. Microservices** — Which Is Best for Your Team?

  - Monorepo vs. Multi-Repo: Whereas a **monorepo** contains all the needed code in one repository, a **multi-repo** (also known as a **polyrepo**) typically has one repository for each project.
  - **Use Cases for Mongorepo** (Monorepo Is Usually Best For…)

    1. Visibility: With a monorepo, there is more accountability since many projects are visible to many people and monorepos lend themselves to security features.
    2. Collaboration: A single repository makes it easier to collaborate. That’s because everyone can access the code, files, and assets. So, developers can share and reuse assets.
    3. Speed: Using a single repository can help you accelerate development. For instance, you can make atomic changes (one action to make a change across multiple projects).

  - **Use Cases for Multi-repo**:
    - A **multi-repo** configuration can complicate matters if data from multiple repos is required. The orchestration of gathering accurate data from many different servers would be very challenging. A multi-repo solution would require multiple connections to the multiple repositories to get access to the correct data. It is a little like merging onto a 10 lane highway at rush hour. Coordination is key to merge safely.
    - Git Projects: Managing a **monorepo** at scale in Git would never work. As the repository gets bigger, a monorepo in Git becomes a huge problem. So if you have teams using Git, it’s best to have multiple repositories.

- **Reasons why you should consider using a mono repository**:
  - You want a single source of truth.
  - You want to share and reuse code easily.
  - You want visibility to manage dependencies (e.g., If you make a change, what else will be impacted?).
  - You want to make atomic changes (e.g., one operation to make a change across multiple projects).
  - You want teams to collaborate more.
  - You want to make large-scale changes (e.g., code refactoring).

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

# Resources and Further Reading

1. [daily.dev - What Is a Monorepo?](https://www.perforce.com/blog/vcs/what-monorepo?ref=dailydev)
2. [Medium - Backend for Frontend (BFF) Architecture](https://levelup.gitconnected.com/backend-for-frontend-bff-architecture-64fa9f316a5a)
