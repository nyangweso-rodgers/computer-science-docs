# HTTP Headers

## 10 HTTP Headers

# 1. Accept
* A client-side header that defines the type of data the client expects from the server. 

* This means the server won’t waste time returning a data type the client cannot use.

# 2. Authorization
* A client-side header that passes the credentials to the server.

* This is not the same as authentication. The server can only authenticate the user after it checks the authorization credentials.

# 3. Content-Type
* Specifies the type of content the server returns, e.g., JSON, text, form data, etc.

# 4. Accept-Encoding
* Tells the server which encoding method the client can understand. This refers to how the data is compressed in transfer.

# 5. Access-Control-Allow-Origin
* A server-side header that lists the server’s accepted web addresses, with which it only expects to interact.
* Any client-side errors referencing ‘cross-origin-request’ (CORS) may be linked to this header.

# 6. Access-Control-Allow-Methods
* A cross-origin resource sharing (CORS) header that indicates which HTTP methods are allowed to access the resource.

# 7. Accept-Language
* Used to state which human language or languages are understood by the client so that the user can choose their preferred.

# 8. Content-Length
* Indicates the size of the message body in bytes and can be used in either requests or responses.

# 9. Cache-Control
* This server and client-side header communicate how the cache should be controlled using directives and values.

* Some examples of the various directives:
    - Cache-Control: no-store
    - Cache-Control: max-age
    - Cache-control: public

# 10. Host
* A request header that specifies the host (domain name) and port number of the server being requested.