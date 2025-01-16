# HTTP

## Table Of Contents

# Introduction

- In **HTTP protocol**, a typical session has three phases:

  1. **Establishes a TCP connection**: The **client** establishes the connection with the **server** using the **TCP** layer. Default HTTP port with TCP layer is `80` but other ports might be used as well. As the `80` port number is the default for the HTTP protocol, so adding it with the domain is not mandatory.

  2. **Client sends an HTTP request**: After a successful connection, the **client** can ask for data from the `server`. User-agent (mostly web browsers) can send HTTP requests and ask for the necessary data. A typical HTTP request contains three things:

     - Request methods
     - HTTP headers
     - Method body (optional)

  3. **Server sends an HTTP response**: After the client sent the request, the server process it and sends the response accordingly. Server always returns a response doesn't matter request is successful or not. The structure of the HTTP response looks like this:
     - Status line
     - Response header
     - Message body (optional)

# HTTP Networking

- All computer networking at the software level is based on an abstraction called a **socket**. **Sockets** represent a specific open connection to another computer.

- A **server** starts listening for incoming connections, and a **client** asks to open a new connection. Connections are defined using numeric dot-separated **IP addresses** like `192.168.0.255`, and an additional numeric **port** numbers like `8080`. An individual **IP address** segment can be from **0-255**, and **port numbers** range from **0-65535**. Think of an **IP address** as a street address for an apartment building, and a **port number** as a specific room in that building. Any data can be sent over a **socket** - binary or text - it's all just bytes.

- Plain **HTTP** is an unencrypted protocol. **HTTP Secure** (**HTTPS**) is the same content, but encrypted before being sent.

- Standardized networking protocols use specific well-known port numbers. Plain **HTTP** defaults to port `80`, and **HTTPS** defaults to port `443`. So, an address of `http://192.168.0.255` implies port `80`, and `https://192.168.0.255`implies port `443`. Other ports are frequently used depending on project setup. For example, many **web server applications** listen on port `8080` or `3000` in a development environment, so in that case you would use an address like `http://192.168.0.255:3000` as the destination for an **HTTP** connection.

- Since numeric **URLs** are hard to remember, and a site may be made up of many systems working together, the **Domain Name System** (**DNS**) maps text name URLs like `www.google.com` to a specific set of numeric **IP addresses**.
- A **URL** like `http://www.example.com:8080/some-page?id=42#intro` can be split into multiple pieces:
  1. protocol: `http://`
  2. subdomain: `www`
  3. domain name: `example.com`
  4. port: `8080`
  5. path: `some-page`
  6. query parameters: `?id=42`
  7. fragment: `#intro`

# HTTP Requests and Responses

- **HTTP** is a plain-text, "**stateless**", request/response-based protocol. i.e.,:

  - A **client** application has to open a connection to the **server** and send a request using a text-based format
  - The **server** then parses the **request**, runs code to process and handle the **request** appropriately, and sends back a text-based response. Once the response has been sent, it closes the **open socket connection**.
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

# HTTP Headers

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

# HTTP Methods

- The **HTTP protocol** specifies several possible methods or verbs. Each **HTTP method** represents a different type of request intent:

  1. `GET`:

     - `GET` requests are used to retrieve information from the **server**, based on a specific **URL**.
     - `GET` requests do not contain a request body. However, **clients** may include additional data as **query parameters** options attached to the main **URL**. **Query params** start with a `?`, and are formatted as `key=value` pairs separated by ampersands: `/endpoint?a=1&b=stuff`. Spaces and special characters in URLs may need to be URL-encoded, where the original value is replaced by a `%` and a number: `?a=Some Value` might become `?a=Some%20Value`.
     - Since `GET` requests are only used for retrieving data, **servers** should not update data in response to a `GET`. This means it should be safe to make the same `GET` request multiple times without causing side effects.

  2. `POST`:

     - `POST` requests are used to tell the server to **update** some data or process some information. `POST`s typically include all relevant information in the body of the request, and rarely include **query params**.
     - `POST` request bodies typically use a few common formats:
       - "Form-encoded": the same `key=value` structure as query parameters, but in the body of a `POST`
       - "Multi-part form data": a delimited format that splits the body into sections
       - "JSON": a string representation of JavaScript data structures like objects and arrays

  3. `PUT`

     - `PUT` requests are very similar to `POST` requests. Both involve sending data to the **server** with an intent to update. The intended difference is that a `PUT` is intended to **create** or **replace** a value, while a `POST` is intended to **create** or **update** a value. Conceptually, a `PUT` should be safe to do multiple times in a row, while a `POST` is likely to cause something to happen separately for each request.

  4. `DELETE`: the **client** wants to delete some data on the server

     - `DELETE` requests are used to ask a server to **delete** some data. Conceptually, it should be safe to make a `DELETE` request multiple times - if a value is already gone, the server ought to ignore the request.

  5. `PATCH`
     - `PATCH` requests are also similar to `PUT` requests, but the intent is to send a partial representation of an item, while `PUT` is meant to send the complete representation of an item.

# HTTP Status Codes

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

# Resources and Further Reading
