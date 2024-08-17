# How Internet Works

## Table Of Contents

- [Further Reading]()
  - [How the Web Works: A Primer for Newcomers to Web Development (or anyone, really)](https://www.freecodecamp.org/news/how-the-web-works-a-primer-for-newcomers-to-web-development-or-anyone-really-b4584e63585c/)

# Defining parts of the web

1. **Client**: application that runs on a computer and is connected to the internet. Its primary role is to take user interactions and translate them into requests to another computer called a web server. Although we typically use a browser to access the web, you can think of your whole computer as the “Client” piece of the client-server model. Every client computer has a _unique address_ called an **IP address** that other computers can use to identify it.

2. **Server**: A machine that is connected to the internet and also has an IP address. A server waits for requests from other machines (e.g. a client) and responds to them. The primary function of a web server is to store, process and deliver web pages to clients. There are many types of servers, including web servers, database servers, file servers, application servers, and more. (In this post, we’re talking about web servers.)

3. **ISP**: (_Internet Service Provider_). ISP is the middle man between the client and servers. For the typical homeowner, the ISP is usually a “cable company.” When your browser gets a request from you to go to www.github.com, it doesn’t know where to look for www.github.com. So it’s the ISP’s job to do a DNS (Domain Name System) lookup to ask what IP address the site you’re trying to visit is configured to.

4. **DNS**: (_Domain Name System_). A distributed database which keeps track of computer’s domain names and their corresponding IP addresses on the Internet. DNS exists so users can enter www.github.com instead of an IP address.

5. **Domain Name**: Used to identify one or more IP addresses. Users use the domain name (e.g. www.github.com) to get to a website on the internet. When you type the domain name into your browser, the DNS uses it to look up the corresponding IP address for that given website.

6. **TCP/IP**: Transmission Control Protocol/Internet Protocol. The most widely used communications protocol. A “protocol” is simply a standard set of rules for doing something. TCP/IP is used as a standard for transmitting data over networks.

7. **Port Number**: A 16-bit integer that identifies a specific port on a server and is always associated with an IP address. It serves as a way to identify a specific process on a server that network requests could be forwarded to. Some common **port** examples include:

   - **Port 25**: SMTP (e-mail routing)
   - **Port 80**: HTTP (web requests)
   - **Port 143**: IMAP (email management)

8. **Host**: A computer connected to a network — it can be a client, server or any other type of device. Each host has a unique IP address. For a website like www.google.com, a host could be the web server that serves the pages for the website. There’s often some mix up between a host and server but note they are two different things. Servers are a type of host — they are a specific machine. On the other hand, a host could refer to an entire organization that provides a hosting service to maintain multiple web servers. You can run a server from a host in that sense.

9. **URL**: Uniform Resource Locators. URLs identify a particular web resource. A simple example is https://github.com/someone. The URL specifies the protocol (“https”), host name (github.com) and file name (someone’s profile page). A user can obtained the web resource identified by this URL via HTTP from a network host whose domain name is github.com. (tongue twister much?!)

# HTTP

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

## HTTP Networking

- All computer networking at the software level is based on an abstraction called a **socket**. **Sockets** represent a specific open connection to another computer. A **server** starts listening for incoming connections, and a **client** asks to open a new connection. Connections are defined using numeric dot-separated **IP addresses** like `192.168.0.255`, and an additional numeric **port** numbers like `8080`. An individual **IP address** segment can be from **0-255**, and **port numbers** range from **0-65535**. Think of an **IP address** as a street address for an apartment building, and a **port number** as a specific room in that building. Any data can be sent over a **socket** - binary or text - it's all just bytes.
- Plain **HTTP** is an unencrypted protocol. HTTP Secure (HTTPS) is the same content, but encrypted before being sent.
- Standardized networking protocols use specific well-known port numbers. Plain **HTTP** defaults to port `80`, and **HTTPS** defaults to port `443`. So, an address of `http://192.168.0.255` implies port `80`, and `https://192.168.0.255`implies port `443`. Other ports are frequently used depending on project setup. For example, many web server applications listen on port `8080` or `3000` in a development environment, so in that case you would use an address like `http://192.168.0.255:3000` as the destination for an **HTTP** connection.
- Since numeric **URLs** are hard to remember, and a site may be made up of many systems working together, the **Domain Name System** (**DNS**) maps text name URLs like `www.google.com` to a specific set of numeric **IP addresses**.
- A **URL** like `http://www.example.com:8080/some-page?id=42#intro` can be split into multiple pieces:
  1. protocol: `http://`
  2. subdomain: `www`
  3. domain name: `example.com`
  4. port: `8080`
  5. path: `some-page`
  6. query parameters: `?id=42`
  7. fragment: `#intro`

## HTTP Requests and Responses

- **HTTP** is a plain-text, "stateless", request/response-based protocol. In other words:
  - A **client** application has to open a connection to the **server** and send a request using a text-based format
  - The **server** then parses the **request**, runs code to process and handle the **request** appropriately, and sends back a text-based response. Once the response has been sent, it closes the open socket connection.
  - Each **request**/**response** is an individual transaction between a **client** and a **server**, and by default there is no correlation between separate requests
- A typical **HTTP** **request** looks like:
  ```http
    GET https://www.example.com/description.html HTTP/1.1
    Host: www.example.com
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) Chrome/16.0.912.75 Safari/535.7
    Accept: text/html,application/xhtml+xml
    Referer: http://www.google.com/url?&q=example
    Accept-Language: en-US,en
  ```
- The first line of the request is broken down into three pieces:
  1. The **HTTP method** or **verb**, such as `GET` or `POST`
  2. The path of the request
  3. The HTTP protocol version
- After that, the **request** may contain additional **headers**. Each **header** is a piece of metadata that the **client** can include so that the **server** better understands what kind of information is being requested.
- The **request** may also include a **body** after the **headers**, with additional data.
- **Responses** follow the same structure:

  ```http
    HTTP/1.1 200 OK
    Content-Type: text/html; charset=utf-8
    Server: Apache/2.4
    Date:   Sun, 01 Nov 2020 16:38:23 GMT
    Content-Length: 17151

    <html>
    <head>
        <title>Page Title Here</title>
    </head>
    <body>
    Content here
    </body>
    </html>
  ```

- The first line contains:
  1. The HTTP protocol version
  2. The HTTP status code, in a numeric form
  3. The HTTP status reason, in a text form
- That is followed by additional header lines containing metadata about the response, including the total byte size of the body. Finally, the response includes the actual body contents.

## HTTP Headers

- There are dozens of **header** fields that can be sent over **HTTP**, and both clients and servers can send additional arbitrary headers they've defined. Some of the most common headers are:
  1. **Requests**
     1. `User-Agent`: a string describing the specific type and version of the client
     2. `Cookie`: a small piece of data previously attached by the server to help track this client
     3. `Referer`: URL of the previous page where a link was clicked
  2. **Responses**
     1. `Content-Length`: size of the response in bytes
     2. `Location`: redirect request to a new URL
     3. `Set-Cookie`: creates a new cookie value
  3. Both:
     1. `Content-Type`: name of the format used in the request / response body

## HTTP Methods

- The HTTP protocol specifies several possible methods or verbs. Each HTTP method represents a different type of request intent:
  1. `GET`: the **client** wants to retrieve information
  2. `POST`: the **client** wants to create or update data on the server
  3. `PUT`: the **client** wants to update or replace data on the server
  4. `DELETE`: the **client** wants to delete some data on the server

### `HET` Requests

- `GET` requests are used to retrieve information from the **server**, based on a specific URL. `GET` requests do not contain a request body. However, **clients** may include additional data as **query parameters** options attached to the main URL. **Query params** start with a `?`, and are formatted as `key=value` pairs separated by ampersands: `/endpoint?a=1&b=stuff`. Spaces and special characters in URLs may need to be URL-encoded, where the original value is replaced by a `%` and a number: `?a=Some Value` might become `?a=Some%20Value`.

- Since `GET` requests are only used for retrieving data, **servers** should not update data in response to a `GET`. This means it should be safe to make the same `GET` request multiple times without causing side effects.

### `POST` Requests

- `POST` requests are used to tell the server to update some data or process some information. `POST`s typically include all relevant information in the body of the request, and rarely include **query params**.
- `POST` request bodies typically use a few common formats:
  1. "Form-encoded": the same `key=value` structure as query parameters, but in the body of a `POST`
  2. "Multi-part form data": a delimited format that splits the body into sections
  3. "JSON": a string representation of JavaScript data structures like objects and arrays

### `PUT` Requests

- `PUT` requests are very similar to `POST` requests. Both involve sending data to the **server** with an intent to update. The intended difference is that a `PUT` is intended to **create** or **replace** a value, while a `POST` is intended to **create** or **update** a value. Conceptually, a `PUT` should be safe to do multiple times in a row, while a `POST` is likely to cause something to happen separately for each request.

### `PATCH` Requests

- `PATCH` requests are also similar to `PUT` requests, but the intent is to send a partial representation of an item, while `PUT` is meant to send the complete representation of an item.

### `DELETE` Requests

- `DELETE` requests are used to ask a server to **delete** some data. Conceptually, it should be safe to make a `DELETE` request multiple times - if a value is already gone, the server ought to ignore the request.

## HTTP Status Codes

- All **HTTP** responses include a numeric status code, along with a text "reason" string that describes the status code value. Status codes are 3-digit numbers, grouped into these ranges:
  1. `1xx`: Informational
  2. `2xx`: Successful. E.g.,
     1. `200` ("OK"): successful response
  3. `3xx`: Redirection. E.g.,
     1. `301` ("Moved permanently"): the resource at this URL has been moved to a new URL
     2. `304` ("Not Modified"): The value at this URL has not changed since last asked
  4. `4xx`: Client error:
     1. `400` ("Bad Request"): the request was not formatted properly
     2. `401` ("Not Authorized"): not authenticated to view this
     3. `403` ("Forbidden"): not allowed to view this
     4. `404` ("Not Found"): server does not recognize this URL
  5. `5xx`: Server error. E.g.,
     1. `500` ("Internal Server Error"): something went wrong on the server while handling this
     2. `503` ("Service Unavailable"): a portion of the server is down and cannot respond

# Cookies

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

# Servers

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

# Resource and Further Reading

1. [https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev](https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev)
