# How Internet Works

## Table Of Contents

# Introduction to Computer Networks

- **Protocols** are the building blocks of communication between network applications. Some of the popular **protocols** include:

  1. HTTP,
  2. TCP,
  3. IP,
  4. SMTP.

- Like how a human language (such as English) enables diverse people to communicate meaningfully, **Protocols** fill a similar gap in network communication.
- Generally, **protocols** define the rules of communication between two entities such as:

  - Types of messages, for example, request and response messages
  - Syntax of various message types such as fields in the messages
  - The semantics of fields, that is the meaning of information in fields
  - Rules for determining when and how messages are sent and responded to

# 5 Protocol Stack Layers

- The **protocal Stack** include:

  1. Application layer
  2. Transport layer
  3. Network layer
  4. Link layer
  5. Physical layer

- Each layer has specific functions and protocols associated with it

## 1. Application Layer

- **Purpose**: This is the layer where users interact directly with the network. It provides network services to applications.
- **Functions**:
  - Enables end-user processes to communicate over the network.
  - Manages protocols that facilitate specific types of communication, like email, web browsing, or file transfers.
- **Examples of Protocols**:
  1. HTTP/HTTPS: HyperText Transfer Protocol (Secure) for web browsing.
  2. SMTP: Simple Mail Transfer Protocol for email.
  3. FTP: File Transfer Protocol for file sharing.
  4. DNS: Domain Name System for translating domain names to IP addresses.
- Business applications use the **Application Layer** to communicate over a network. For example, placing an order on your online pizza store is done using the **Application Layer**. `HTTP` is one option to post the information on your backend server.
- **Application Layer Protocols** define how applications running on different end systems pass messages to each other. In addition to the rules of communication (protocol), the applications also need a way to find each other, that is, to address each other. The address of an application is defined by:
  1. **IP Address**: numerical label assigned to an end system
  2. **Port Number**: an identifier that specifies the receiving process in the destination host. Port numbers are essential to account for multiple network applications running on a host. For example, two tabs in a web browser act as two different processes.
- The address of an application defines its identity on the network, and the **protocol** defines the rules for communication. Together, these form the **Socket address** (**protocol type**, **IP address**, **port number**).
- A **socket** is an interface between the **application layer** and the **transport layer**. It acts as an entry point into the network, that is an application sends messages into and receives network messages through its **Socket**.
- Remarks:
  - Applications talk to each other using **Application Layer protocols**. The **Application Layer** relies on the services provided by the **Transport Layer** to pass data between end systems. Pair of **IP address** and **port number** identifies an application. The information flows from an application into the network through its **Socket**.

## 2. Transport Layer

- The **transport layer** provides logical communication between applications running on different hosts: from an applications' perspective, it's as if the two hosts are directly connected. Note that the communication provided by the **transport layer** is logical and not physical: there's no direct link or wire between the end hosts.
- The **transport layer** converts the application messages into smaller chunks, encapsulates each piece in a transport message containing headers, and passes the chunk to the network layer.
- The reason behind breaking down information into pieces is efficient network utilization. The Internet is so vast that several parallel paths transmit data between two end hosts.
- The Internet makes available two **transport layer protocols**:

  1. **User Datagram Protocol** (**UDP**)

     - Unreliable data transfer
     - No mechanisms to recover lost or corrupted data
     - Lower latency at the cost of unreliable communication

  2. **Transmission Control Protocol** (**TCP**)
     - Reliable data transfer
     - Lost or corrupted information is recovered by retransmission
     - Higher latency at the cost of reliable communication

- The two protocols vary slightly in the transport services they provide to the application layer.
- The service requirements of an application govern what protocol you choose. For example, a payment system will need reliable communication (TCP), whereas a video streaming service might be okay with losing some information for faster streaming (UDP).

- **Remarks**:
  - In summary, the **transport layer** splits the application messages into chunks and encapsulates them in messages containing transport layer-specific information. The pieces are put back in the correct order on the receiving system to recreate the message and passed to the appropriate application using the port number.

## 3. The Network Layer

- In contrast to the **transport layer**, the **network layer** provides logical communication between two end hosts. Note the subtle difference between the **transport** and **network layer services**.
- The **network layer** takes a **transport packet** from the **transport layer** and encapsulates it in a **network packet**. The encapsulation is helpful to add information specific to the functioning of network layer protocol.
- The **network layer** is responsible for moving packets from a sending host to a receiving host. In addition to the end hosts, the **network layer protocols** also run on **Routers**, part of the network core. **Routers** are packet switching devices that are responsible for forwarding packets.

- **Remarks**:
  - In summary, the **network layer** provides logical communication between two end hosts. **Network layer protocols** run on end hosts and network core devices such as **routers**. **Routers** forward network packets, which help form the logical communication between two end hosts.

## 4. The Link Layer

- Compared to the layers we have seen so far, the **link layer** has a narrower scope: it provides services to move packets over the individual links in the end-to-end path.
- The **link-layer** enables the node-to-node movement of network layer packets over a single link in the path.
- A link-layer protocol defines:
  - format of packets exchanged between nodes at ends of the link
  - actions taken on packets by those nodes

# Defining Parts Of The Web

## 1. Client

- **Client**: application that runs on a computer and is connected to the internet. Its primary role is to take user interactions and translate them into requests to another computer called a **web server**. Although we typically use a browser to access the web, you can think of your whole computer as the “Client” piece of the **client-server model**. Every client computer has a **unique address** called an **IP address** that other computers can use to identify it.

## 2. Server

- **Server**: A machine that is connected to the internet and also has an **IP address**. A **server** waits for requests from other machines (e.g. a **client**) and responds to them. The primary function of a **web server** is to store, process and deliver web pages to **clients**. There are many types of servers, including:
  1. web servers
  2. database servers
  3. file servers
  4. application servers, and more

## 3. ISP (Internet Service Provider)

- **ISP** is the middle man between the **client** and **servers**. For the typical homeowner, the **ISP** is usually a “cable company.” When your browser gets a request from you to go to www.github.com, it doesn’t know where to look for www.github.com. So it’s the ISP’s job to do a **DNS** (**Domain Name System**) lookup to ask what **IP address** the site you’re trying to visit is configured to.

## 4. DNS (Domain Name System)

- **DNS** is a **distributed database** which keeps track of computer’s **domain names** and their corresponding **IP addresses** on the Internet. **DNS** exists so users can enter www.github.com instead of an **IP address.** i.e., **DNS** is a protocol used for translating domain names into IP Addresses. i.e, from human-readable website names into **IP addresses**.

- The **DNS protocol** allows getting the website's address in **5 steps**:

  1. Step 1: The browser checks its **local cache** to see if it already has the corresponding **IP address**. If the **IP address** isn't cached, it sends a **DNS request** to the **DNS resolver**. An **Internet Service Provider** (**ISP**) usually hosts this dedicated server.
  2. Step 2: The **DNS resolver** checks its local cache. If the corresponding **IP address** isn't cached, it tries to solve the request iteratively. Iteratively means it tries to contact different servers until it doesn't get the IP address.
  3. Step 3: First, the **DNS resolver** sends a request to a **root name server**. This is a server mapping the top-level domain ".com" to the address of the name server responsible for that domain. The address of the ".com" name server is sent back to the DNS resolver.
  4. Step 45: The **DNS resolver** sends a resolution request for "mywebsite .com" to the ".com" name server. The ".com" name server maps "mywebsite.com" to the address of the authoritative name server responsible for it. This address is sent back to the **DNS resolver**.
  5. Step 5: The **DNS resolver** sends a resolution request for "www. mywebsite .com" to the **authoritative name server**. The authoritative name server then returns the destination IP address.

- Here are the 8 most commonly used **DNS Record Types**:
  1. **A** (**Address**) **Record**: Maps a domain name to an **IPv4 address**. It is one of the most essential records for translating human-readable domain names into **IP addresses**.
  2. **CNAME** (**Canonical Name**) **Record**: Used to alias one domain name to another. Often used for subdomains, pointing them to the main domain while keeping the actual domain name hidden.
  3. **AAAA Record**: Similar to an **A record** but maps a domain name to an **IPv6 address**. They are used for websites and services that support the **IPv6 protocol**.
  4. **PTR Record**: Provides reverse DNS lookup, mapping an IP address back to a domain name. It is commonly used in verifying the authenticity of a server.
  5. **MX Record**: Directs email traffic to the correct mail server.
  6. **NS (Name Server) Record**: Specifies the authoritative DNS servers for the domain. These records help direct queries to the correct DNS servers for further lookups.
  7. **SRV (Service) Record**: SRV record specifies a host and port for specific services such as VoIP. They are used in conjunction with **A records**.
  8. **TXT (Text) Record**: Allows the administrator to add human-readable text to the DNS records. It is used to include verification records, like SPF, for email security.

## 5. Domain Name

- **Domain Name**: Used to identify one or more **IP addresses**. Users use the **domain name** (e.g. www.github.com) to get to a website on the internet. When you type the domain name into your browser, the **DNS** uses it to look up the corresponding IP address for that given website.

## 6. TCP (Transmission Control Protocol)/IP

- **TCP** is a protocol used for establishing and maintaining network connections.
- **TCP/IP**: The most widely used communications protocol. A **“protocol”** is simply a standard set of rules for doing something. **TCP/IP** is used as a standard for transmitting data over networks.

## 7. Port Number

- **Port Number**: A 16-bit integer that identifies a specific **port** on a server and is always associated with an **IP address**. It serves as a way to identify a specific process on a server that network requests could be forwarded to.
- Some common **port** include:

  - **Port 25**: **SMTP** (e-mail routing)
  - **Port 80**: **HTTP** (web requests)
  - **Port 143**: **IMAP** (email management)

## 8. Host

- **Host**: A computer connected to a network — it can be a **client**, **server** or any other type of device. Each **host** has a unique **IP address**. For a website like www.google.com, a host could be the web server that serves the pages for the website.
- **Remarks**:
  - There’s often some mix up between a **host** and **server** but note they are two different things.
  - **Servers** are a type of **host** — they are a specific machine.
  - On the other hand, a **host** could refer to an entire organization that provides a hosting service to maintain multiple web servers. You can run a server from a host in that sense.

### 8.1. Localhost

- **localhost** is the computer or hostname currently making a request to itself. In this case, the computer is also the virtual server. Just like **HTTP** and **HTTPS**, the **localhost** is a protocol.
- if you type **localhost** to your browser’s address bar, it transforms to the IP address **127.0.0.1**. This **127.0.0.1** IP address is reserved for local servers on computers, so you will never find another IP address that starts with 127

## 9. URL (Uniform Resource Locators)

- **URLs** identify a particular web resource. A simple example is https://github.com/someone. The **URL** specifies the **protocol** (`“https”`), **host name** (`github.com`) and **file name** (someone’s profile page).
- A user can obtained the web resource identified by this URL via `HTTP` from a network host whose domain name is github.com. (tongue twister much?!)

# 10. HTTP

- In **HTTP protocol**, a typical session has three phases:

  1. **Establishes a TCP connection**: The client establishes the connection with the server using the _TCP_ layer. Default HTTP port with TCP layer is `80` but other ports might be used as well. As the `80` port number is the default for the HTTP protocol, so adding it with the domain is not mandatory.
  2. **Client sends an HTTP request**: After a successful connection, the client can ask for data from the `server`. User-agent (mostly web browsers) can send HTTP requests and ask for the necessary data. A typical HTTP request contains three things:
     - Request methods
     - HTTP headers
     - Method body (optional)
  3. **Server sends an HTTP response**: After the client sent the request, the server process it and sends the response accordingly. Server always returns a response doesn't matter request is successful or not. The structure of the HTTP response looks like this:
     - Status line
     - Response header
     - Message body (optional)

## 11. Cookies

- **HTTP** is inherently "stateless" by default, but **servers** normally want some way to correlate a specific client's identity between multiple requests. For example, if I log into a forum site, the **server** should remember that I'm logged in as I browse through different pages.
- The HTTP spec allows servers to include `Set-Cookie` headers in responses with specific keys and values:
  ```http
      HTTP/2.0 200 OK
      Content-Type: text/html
      Set-Cookie: yummy_cookie=choco
      Set-Cookie: tasty_cookie=strawberry
  ```
- Whenever a **client** makes future requests to that server, the **cookie** values will be automatically included in the request:
  ```http
      GET /sample_page.html HTTP/2.0
      Host: www.example.org
      Cookie: yummy_cookie=choco; tasty_cookie=strawberry
  ```
- Typically, a **server** will set a "session cookie" that contains some unique ID value, and map that unique ID internally to additional data (such as "session ID 12345 is actually user `mark`"). That way, each time a request is made, the server can look up the additional data needed to handle that specific user ("Request is for `/messages`, and the session data says the user is `mark` - query the database for all messages sent to user `mark`").

## 12. Servers

- The word "**server**" has multiple related meanings depending on the context:
  1. The application that opened up a **socket** to listen for incoming requests
  2. An application that is specifically able to handle HTTP requests and send back responses
  3. The physical or virtual machine that is running that server application

## 1. HTTP Server

- Every **HTTP** server application starts handling a request by accepting an incoming socket connection, and parsing the request contents into some internal data structure. The server then inspects the HTTP request path and the method to determine the intent of the request.
- Depending on how the server has been written and configured, it will then handle the request by doing some combination of:
  1. Reading files from disk
  2. Connecting to a database and loading / updating data
  3. Updating session tracking information internally
  4. Running developer-specified logic
  5. Ultimately, the server application will fill out an HTTP response message based on all of the processing, write it to the socket, and close the connection.

## 2. Web Servers

- The purpose of these servers is to host web pages and web applications. They respond to HTTP requests from clients (such as web browsers) with the corresponding web pages or data. **Examples of Web servers**:
  1. Apache
  2. Nginx, and
  3. Microsoft IIS.
- **Web servers** respond to **HTTP requests** from **clients** and send back a **response** containing a **status code** and often content such as _HTML_, _XML_ or _JSON_ as well. At the _hardware level_, a **web server** is a machine (or collection of machines) that stores a website’s component files (e.g. HTML documents, images, videos, stylesheets, and JavaScript files) and delivers them to you. This is called **hosting**. At the _software level_, a **web server**, known as the **HTTP server**, controls how users access these hosted files. It processes and answers incoming requests.

## 2. Application Servers

- An **application server** is a **server** specifically designed to run **applications**. The “server” includes both the hardware and software that provide an environment for programs to run.

## 3. Database Servers

- Data is stored, managed, and retrieved using these **servers**. They offer an interface via which other programs can communicate with the server-stored data.

- **Examples**:
  - Microsoft SQL Server,
  - PostgreSQL, and
  - MySQL.

## 4. Proxy Servers

- These servers facilitate communication between clients and other servers. They can serve many purposes, including caching, load balancing, and anonymous browsing.

- **Proxy**: have the ability to further pass your request to other servers. i.e., **intermediate servers**. The responsibility of a **proxy server** is to contact actual (origin) sever on your behalf. Your **IP Address** is hidden whenever your request goes through the **proxy server**.

- **Examples**:
  - Squid,
  - HAProxy, and
  - Microsoft Forefront.

## 5. Mail Servers

- These servers are used for email transmission and reception. They manage the delivery and routing of email communications.

- **Examples**:
  - Microsoft Exchange,
  - Postfix, and
  - Dovecot

## 6. DNS Servers

- These servers are used to convert **domain names** to **IP addresses**. **DNS servers** are a critical component of the domain name system (DNS). **Examples** include:

  - BIND and
  - Microsoft DNS Server

- How DNS servers Work
  - We use **IP addresses** to visit websites on the internet. Since humans cannot easily remember IP addresses to visit a website, a global phone book was created. The phone book maintains mappings of all **domain names** to **IP addresses**.
  - A **client** forwards a request with the **domain name** to the **DNS server**. And **DNS servers** reply with the actual **IP address** associated with that domain name.

# The journey from code to webpage

- Let’s walk through that Github search to see how we go from a URL typed into an address bar to a running web page:

  1. You type a URL into your browser

     ```sh
      https://github.com/
     ```

  2. The browser parses the information contained in the URL.

     - This includes the **protocol** (`“https”`), the **domain name** (“`github.com`”) and the **resource** (“`/`”)
     - In this case, there isn’t anything after the “.com” to indicate a specific resource, so the browser knows to retrieve just the main (index) page

  3. The browser communicates with your **ISP** to do a **DNS** lookup of the **IP address** for the web server that hosts www.github.com.

     - The **DNS service** will first contact a **Root Name Server**, which looks at https://www.github.com and replies with the **IP address** of a name server for the “.com” top-level domain. This address is sent back to your **DNS service**. The DNS service does another outreach to the “.com” name server and asks it for the address of https://www.github.com.

  4. Once the ISP receives the IP address of the destination server, it sends it to your web browser

     ```sh
      https://192.30.253.45:443
     ```

  - Where:
    - `https` is the **protocal**
    - `192.30.253.45` is the **IP Address**
    - `443` is the **port number**

  5. Your browser takes the **IP address** and the given **port** number from the **URL** (the HTTP protocol defaults to port `80` and HTTPS defaults to port `443`) and opens a **TCP socket connection**. At this point, your web browser and web server are finally connected.

  6. Your web browser sends an **HTTP request** to the **web server** for the main HTML web page of www.github.com.

  7. The web server receives the request and looks for that HTML page. If the page exists, the web server prepares the response and sends it back to your browser. If the server cannot find the requested page, it will send an HTTP 404 error message, which stands for “Page Not Found”.

  8. Your web browser takes the HTML page it receives and then parses through it doing a full head to toe scan looking for other assets that are listed, such as images, CSS files, JavaScript files, etc.

  9. For each asset listed, the browser repeats the entire process above, making additional HTTP requests to the server for each resource.

  10. Once the browser has finished loading all other assets that were listed in the HTML page, the page will finally be loaded in the browser window and the connection will be closed

- **Remarks**:
  - One thing worth noting is how information gets transmitted when you make a request for information.
    - When you make a request, that information is broken up into many tiny chunks called **packets**.
    - Each **packet** is tagged with a **TCP header**, which include the source and destination port numbers, and an **IP header** which includes the source and destination IP addresses to give it its identity.
    - The **packet** is then transmitted through ethernet, WiFi or Cellular network and is allowed to travel on any route and take as many hops as it needs to get to the final destination.
    - (We don’t actually care how the packets get there — all that matters is that they get to the destination safe and sound!) Once the packets reach the destination, they are reassembled again and delivered as one piece.
    - So how do all the packets know how to get to their destination without getting lost? The answer is TCP/IP.
      - **TCP/IP** is a two-part system, functioning as the Internet’s fundamental “control system”. IP stands for Internet Protocol; its job is to send and route packets to other computers using the IP headers (i.e. the IP addresses) on each packet. The second part, Transmission Control Protocol (TCP), is responsible for breaking the message or file into smaller packets, routing packets to the correct application on the destination computer using the TCP headers, resending the packets if they get lost on the way, and reassembling the packets in the correct order once they’ve reached the other end.

# Resource and Further Reading

1. [freecodecamp - How the Web Works: A Primer for Newcomers to Web Development (or anyone, really)](https://www.freecodecamp.org/news/how-the-web-works-a-primer-for-newcomers-to-web-development-or-anyone-really-b4584e63585c/)
2. [https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev](https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev)
3. [freecodecamp - Computer Networking Tutorial – How Network Applications Talk Over the Internet](https://www.freecodecamp.org/news/computer-networking-how-applications-talk-over-the-internet/?ref=dailydev)
