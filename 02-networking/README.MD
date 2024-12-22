# How Internet Works

## Table Of Contents

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

- **DNS** is a **distributed database** which keeps track of computer’s **domain names** and their corresponding **IP addresses** on the Internet. **DNS** exists so users can enter www.github.com instead of an **IP address.**

## 5. Domain Name

- **Domain Name**: Used to identify one or more **IP addresses**. Users use the **domain name** (e.g. www.github.com) to get to a website on the internet. When you type the domain name into your browser, the **DNS** uses it to look up the corresponding IP address for that given website.

## 6. TCP (Transmission Control Protocol)/IP

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
