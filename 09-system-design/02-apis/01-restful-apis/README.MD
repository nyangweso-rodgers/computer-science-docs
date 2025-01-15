# APIs

## Table Of Contents

# What is an API?

- An **API** is a set of rules and protocols for building and interacting with software applications. It defines the methods and data formats that applications use to communicate with external systems or services. APIs enable different software components to interact with each other, allowing developers to use functionalities of other applications without needing to understand their internal workings.

# Types of APIs

- API Types include:
  1. **Public APIs**: Open for use by external developers (e.g., Twitter API)
  2. **Private APIs**: Used internally within an organization
  3. **Partner APIs**: Shared with specific business partners
  4. **Composite APIs**: Combine multiple data or service APIs

# API Architectures

- The following API architectures form the core of your API's structure and client interaction:
  1. REST (Representational State Transfer)
  2. SOAP (Simple Object Access Protocol):
  3. GraphQL
  4. gRPC
  5. WebSockets
  6. Webhook

## 1. REST (Representational State Transfer)

- **REST** is an architecture style to develop web services, which uses the **HTTP protocol** as a communication interface in order to transfer data through **HTTP methods**.
- **REST** has gained a lot of popularity in recent years due to its

  - simplicity, and
  - scalability

- **Advantages of REST** include:

  - **REST** is Easy to Understand and Implement: **REST** is meant to work over **HTTP** (actually HTTP was influenced by REST). Therefore it makes use of HTTP verbs such as `GET`, `POST`, and `PUT`.
  - **REST** Makes your Application More Scalable: There are 2 main reasons why **REST** can help make your application more scalable:
    - **No State**: one of the core principles of **REST** is that it's **stateless** on the **server-side**. Therefore each request will be processed independently from the previous ones. In applications with a server-side state or sessions, a session is stored for possibly every logged-in user. This session data can easily get bloated and start to occupy a lot of resources on the server. On the other hand, **stateless** servers only keep resources (memory) occupied when they are handling a request and they free it as soon as the request is processed. Since the current trend in scalability is horizontal scaling (typically on the cloud), storing server-side sessions can also make it hard to scale your application because it creates some difficult problems.
    - Faster Data Interchange Format: **RESTful APIs** typically use **JSON** as the data interchange format. **JSON** is much more compact and smaller in size compared to **XML**. It can also be parsed faster than **XML**.
  - Caching is Easier with REST: Caching is a critical factor for the scalability and performance of a modern web application. A well-established cache mechanism (with the best hit-rates possible) can drastically decrease the average response time of your server. **REST** aims to make caching easier. Since the server is **stateless** and each request can be processed individually, **GET requests** should usually return the same response regardless of previous ones and the session. This makes the `GET` requests easily cacheable and browsers usually treat them as such. We can also make our **POST requests** cacheable using **Cache-Control** and **Expires headers**
  - REST is Flexibile: i.e., it's easy to modify and it's also able to answer many clients who can ask for different data types (**XML**, **JSON**, and so on). The client can specify the type using the Accept header and the **REST API** can return different responses depending on that. **REST** has the ability to handle multiple types of requests and return different types of data (such as JSON and XML)

- **Cons of REST** include:

  - Where **REST APIs** fall short is that their rich metadata creates big payloads that can sometimes cause more trouble than they’re worth. You can get over- and under-fetching problems that require further API requests, bogging down the process.

- **Principles of RESTful API** include:
  1.  **Client-Server Model**: Separation of Concerns, i.e., the **Client** that sends the request it’s completely independent from the **Server** that returns the response.
  2.  **Cache**: **Cache** is a computational storage structure focused on keeping stored data that is frequently accessed, improving performance and network efficiency. Therefore, through caching, it’s possible to reduce or even eliminate the need for the Client to send requests to the Server
  3.  **Uniform Interface**: Means how **Client** and **Server** will share information by defining an interface that must be followed in every request. i.e.,, it’s a contract between the **Client** and the **Server** that determines the standards for their communication. the app needs to know that it can hit the same URI to get a particular piece of data, every-time! It also needs to know that it’ll get the data in the format that it expects, and that format will not change. This is the Contract and the URI.
  4.  **Layered System/Architecture**: this relates to the fact that there can be more components and subsystems between a **Client** and a **Server**. i.e., the client can’t assume that it is communicating directly to the Server, and don’t know about the complexity to process the request and return the response. Each layer only knows about the layer next to it, and no more. This promotes separation-of-concerns. Each layer is responsible for a specific role. It knows how to do its job, and passes information to and from its immediate neighboring layer to get the job done
  5.  **Statelessness**: The **server** should have no knowledge of prior requests. The **client** needs to provide all the information necessary for the server to provide a response.

## 2. SOAP (Simple Object Access Protocol)

- Protocol for exchanging structured information.
- Relies on XML.
- Supports complex operations and higher security.
- Used in enterprise-level applications.
- Pros of **SOAP** include:
  - The major advantage of **SOAP** is the fact that it is completely agnostic when it comes to the programming language and processing platform. The standardized format ensures that no matter what is receiving the message on the other end, the request can be executed.
  - this type of API comes with native error handling already built-in, helping developers to be proactive and solve issues before they snowball.
- Use Case include:
  - Perhaps the strongest SOAP use case is with high-security data transmissions in situations where two parties have agreed to a specific legal contract. Here SOAP’s standardization works wonders because it allows for the contract’s terms to be formally codified and enforced throughout all of the API’s processing. You’ll see plenty of this in high-stakes industries like financial services, where the data being passed back and forth is highly sensitive.
- Remark
  - **SOAP** has become less popular in recent years because of the sheer volume of information it requires. The `XML` files are large and are often unnecessarily clunky – especially for simple systems. The number of people who specialize in SOAP servers is rapidly declining, and that makes it a difficult thing to maintain if you don’t already have the right talent on board. It feels like the format is lagging behind newer, more flexible communication methods that offer more robust, sustainable results.

## 3. GraphQL

- **GraphQL**. Created by Facebook, is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send. A **query language** allows you to query data from the data store.
- **GraphQL** was developed in response to **REST APIs**, with the idea that you could execute precise syntax that retrieves only what is needed, lightening the payload and simplifying the process significantly.
- How do **GraphQL** and **REST** APIs fetch data differently?
  - With a **REST API**, a **client** requests a resource using an API endpoint where that particular resource is located on the server. Each resource has a unique endpoint. This means needing multiple resources requires multiple requests.
  - On the other hand, **GraphQL** functions using a single endpoint, and **clients** can request multiple resources in one call. **GraphQL** uses a strongly typed schema definition language that represents objects using nodes. The **GraphQL** server responds with a nested set of objects.
- **GraphQL Query Document**
  - In **GraphQL** a **query document** is a _string sent to a server to process and request data_. **Query Document** are read-only operations, and cannot be manipulated. The query tells the server what it needs to do. The **fields** are what the server used to identify what data to return.
- **GraphQL Type System**:
  - **GraphQL** used a type system to describe data and is organized around three main buiding blocks:
    1. **Schema**: defines a set of types
    2. **Queries**: obtain information about a specific fields from objects
    3. **Resolvers**: retrieve data
- Pros of GraphQL
  - The advantages of immersing yourself in GraphQL APIs are that the API queries are transparent and well documented, giving users all the information they need to use it effectively.
  - In addition, the precise results, detailed error messages, and flexible permissions help round out a well-balanced but high-functioning API. This is especially true when it comes to data structuring, where GraphQL gives users significant flexibility.
- Cons of GraphQL
  - Performance can suffer with GraphQL if you have too many nested fields in any one request. It also doesn’t reuse standard HTTP caching semantics, so it actually requires custom efforts to achieve proper caching. All of this makes GraphQL difficult to pick up without lots of training and experience. It certainly is an acquired skill, breaking away from the long track record and industry knowledge around REST APIs.
- You start by creating a schema that describes all the possible queries and the specific types that they return. This can be challenging, but once completed, the API can accept specific requests and return a result that matches exactly what the user is looking for.
- Allows clients to request exactly the data they need.
- Reduces over-fetching and under-fetching of data.
- Supports more flexible queries compared to REST.

## 4. gRPC

- In **gRPC**, RPC stands for **Remote Procedure Call** and refers to something that can execute a function housed elsewhere but in a different context.
- The ‘`g`’ appended at the beginning narrows things down to the most advanced version developed by Google back in 2015. A user on one side will select a remote procedure to execute, serialize the necessary parameters and then append any additional information into the message. This will then be sent to the server, which interacts with the other application, decoding the message and executing the operation. A result then comes back to the initial user.

* Pros of **gRPC** include:
  - This is a powerful form of API because of its simplicity. It’s straightforward, using `GET` to fetch information and `POST` for everything else. This means that functions are easy to add, and for lightweight payloads, you get great performance overall. The ability to define any type of function makes it infinitely configurable. Essentially you’re limited only by your imagination.
* Cons of **gRPC** include:
  - Where **gRPC** falls short is in the fact that it’s tightly coupled to the underlying system, which restricts its reusability in many cases. In addition, there is no abstraction layer sitting between the API and the actual system functions, which can raise security concerns.
* Use Case include:
  - Typical use cases include command APIs that send simple requests to remote systems and customer-specific APIs, which help manage internal microservices at scale with great speed. By simplifying otherwise complex remote calls, gRPC has also become a staple of the Docker-based application world, proving its value when you have massive numbers of remote calls to execute.

# Basic Principles of API Design

## 1. Consistency

- Ensure that your API is consistent in its structure, naming conventions, and error handling. For instance:
  - Use similar naming conventions for endpoints.
  - Apply uniform formats for responses and errors.
  - Standardize parameter names and data types.

## 2. Statelessness

- Each request from a client should contain all the information needed to process the request. This simplifies the server’s design and improves scalability. **Statelessness** means that the server does not store any client context between requests, which helps in distributing the load across multiple servers.

## 3. Resource-Oriented Design

- Treat everything in your API as a resource. Resources can be objects, data, or services, and each should have a unique identifier (typically a URL in RESTful APIs). Design endpoints to represent resources and use HTTP methods to perform actions on them.

## 4. Use Standard HTTP Methods

- Follow the HTTP methods convention to perform operations on resources:
  1. GET for retrieving resources.
  2. POST for creating resources.
  3. PUT for updating resources.
  4. DELETE for deleting resources. Using these standard methods makes your API intuitive and easier to use.

## 5. Versioning

- Include versioning in your API design to handle updates without breaking existing clients. Common versioning strategies include:
  - URL versioning (`/v1/resource`).
  - Header versioning (`Accept: application/vnd.yourapi.v1+json`).
  - Parameter versioning (`/resource?version=1`).

## 6. Implementation Frameworks

- Choosing the proper framework can significantly impact your API development experience
  1. Python: [Flask](https://flask.palletsprojects.com/en/stable/), [Django REST framework](https://www.django-rest-framework.org/), [FastAPI](https://fastapi.tiangolo.com/)
  2. **JavaScript**​: [Express.js](https://expressjs.com/)
  3. **Java**: [Spring Boot](https://spring.io/projects/spring-boot)
  4. **.NET**: [ASP.NET Core](https://dotnet.microsoft.com/en-us/apps/aspnet)

# Designing a Simple RESTful API

## Step 1: Define the Resources

- Identify the resources your API will expose. For a simple blog API, resources might include `posts`, `comments`, and `users`.

## Step 2: Design the Endpoints

- Map out the endpoints for each resource. For example:
  - `GET /posts` - Retrieve all posts.
  - `GET /posts/{id}` - Retrieve a specific post.
  - `POST /posts` - Create a new post.
  - `PUT /posts/{id}` - Update a specific post.
  - `DELETE /posts/{id}` - Delete a specific post.

## Step 3: Define the Data Models

- Specify the data structure for each resource. For instance, a post might have:
  ```json
  {
    "id": 1,
    "title": "API Design",
    "content": "Content of the post",
    "author": "John Doe",
    "created_at": "2024-06-03T12:00:00Z"
  }
  ```

## Step 4: Implement the Endpoints

- Use a framework like **Express** (Node.js), **Django** (Python), or **Spring Boot** (Java) to implement the endpoints. Ensure each endpoint performs the intended operation and returns the appropriate HTTP status codes. For example, a `GET /posts` endpoint might look like this in Express.js:
  ```js
  app.get("/posts", (req, res) => {
    // Logic to retrieve all posts from the database
    res.status(200).json(posts);
  });
  ```

# APIs Concepts

1. **Base URL**: The base URL structure is no different from the URLs you use for browsing Google, YouTube, or Facebook, though it usually contains the word api. This is not mandatory, just more of a rule of thumb. e.g.,

   - https://api.twitter.com
   - https://api.github.com
   - https://api.stripe.com

2. **Endpoint**: is a _part of the URL that specifies what resource you want to fetch_. Well-documented APIs usually contain an **API reference**, which is extremely useful for knowing the exact endpoints and resources an API has and how to use them.

3. **Request and Response**:

   - **Requests** contain relevant data regarding your **API request** call, such as the _base URL_, the _endpoint_, the _method_ used, the _headers_, and so on.
   - **Responses** contain relevant data returned by the server, including the _data_ or _content_, the _status code_, and the _headers_

4. **? Operator**: This operator is used to specify the parameters we want to send to the **API** or our “online function.”

5. **Query Parameters**:

   - Sometimes when you call an **API**, you get a ton of data that you don’t need or want. But in some cases, you might want to extract only certain information. That’s where **query parameters** come in!
   - To add a query parameter to a given **URL**, you have to add a question mark (?) before the first query parameter. If you want to have multiple query parameters in your request, then you can split them with an ampersand (&).
   - In the **API** world, **query parameters** are used as filters you can send with your **API request** to further narrow down the responses. Using **query parameters**, you can start fetching more specific data from an **API**, making the whole experience a bit more tailored to your needs.

6. **Pagination**: Sending lots of data back and forth between clients and servers comes with a price: bandwidth. To make sure that servers can cope with a lot of requests, APIs typically use **pagination**. In very simple terms, pagination is the act of splitting large amounts of data into multiple smaller pieces.

7. **Access Token**: used for **authentication**. Applications use an access token to authenticate themselves so that they can make an API call. Access tokens are just random strings.

# API Gateway

- API Gateway is a type of software that provides a way for clients to interact with a set of back-end services. A typical API gateway will provide a set of APIs that clients can use to access the various back-end services.
- API Gateway acts as a proxy, intercepting requests from the application and forwarding them to the appropriate backend service.
- Benefits of API Gateway include:
  1. Increased Security: API gateways can provide an additional layer of security for your backend services by validating incoming requests and enforcing authentication and authorization policies.
  2. Improved performance: API gateways can cache commonly requested data and distribute load across multiple backend servers to improve performance.
  3. Easier management: API gateways can provide a single point of control for managing your backend services, making them easier to deploy.

# API Design Bes Practices

## 1. Authentication and Authorization

- Secure your API using authentication (who you are) and authorization (what you can do). Common methods include:
  1. **OAuth**: A widely used open standard for access delegation, commonly used for token-based authentication.
  2. **JWT** (JSON Web Tokens): Tokens that encode a payload with a signature to ensure data integrity.
  3. **API Keys**: Simple tokens passed via HTTP headers or query parameters to authenticate requests.

## 2. Rate Limiting

- Rate limiting helps protect your API from excessive use and ensures resources are available for all users.
- there might be a case where the user executes a loop, causing many API requests that can slow doen your API performance. In order to avioid such scenarios, use **rate-limitng** factors and limit the specific number or requests in the given time period.

## 3. Error Handling

- Provide clear and consistent error messages. Use standard HTTP status codes and include meaningful error messages and codes in the response body.
- For example:
  ```json
  {
    "error": {
      "code": 404,
      "message": "Resource not found"
    }
  }
  ```
- Common HTTP status codes include:
  1. `200 OK` for successful requests.
  2. `201 Created` for successful resource creation.
  3. `400 Bad Request` for client-side errors.
  4. `401 Unauthorized` for authentication errors.
  5. `403 Forbidden` for authorization errors.
  6. `404 Not Found` for non-existent resources.
  7. `500 Internal Server Error` for server-side errors.

## 4. Pagination and Filtering

- For endpoints returning large datasets, implement **pagination** to manage the load and improve performance. Allow clients to filter and sort data as needed.
- For example:
  - Pagination: `GET /posts?page=2&limit=10`
  - Filtering: `GET /posts?author=JohnDoe`
  - Sorting: `GET /posts?sort=created_at&order=desc`
- Here are six popular **pagination techniques**:
  1. Offset-based Pagination:
     - This technique uses an offset and a limit parameter to define the starting point and the number of records to return.
     - Example:
       ```sh
        GET /orders?offset=0&limit=3
       ```
     - Pros:
       - Simple to implement and understand.
     - Cons:
       - Can become inefficient for large offsets, as it requires scanning and skipping rows.
  2. Cursor-based Pagination:
     - This technique uses a cursor (a unique identifier) to mark the position in the dataset. Typically, the cursor is an encoded string that points to a specific record.
     - Example:
       ```sh
        GET /orders?cursor=xxx
       ```
     - Pros:
       - More efficient for large datasets, as it doesn't require scanning skipped records.
     - Cons:
       - Slightly more complex to implement and understand.
  3. Page-based Pagination:
     - This technique specifies the page number and the size of each page.
     - Example
       ```sh
        GET /items?page=2&size=3
       ```
     - Pros
       - Easy to implement and use.
     - Cons
       - Similar performance issues as offset-based pagination for large page numbers.
  4. Keyset-based Pagination:
     - This technique uses a key to filter the dataset, often the primary key or another indexed column.
     - Example
       ```sh
        GET /items?after_id=102&limit=3
       ```
     - Pros:
       - Efficient for large datasets and avoids performance issues with large offsets.
     - Cons:
       - Requires a unique and indexed key, and can be complex to implement
  5. Time-based Pagination:
     - This technique uses a timestamp or date to paginate through records.
     - Example
       ```sh
        GET /items?start_time=xxx&end_time=yyy
       ```
     - Pros:
       - Useful for datasets ordered by time, ensures no records are missed if new ones are added.
     - Cons
       - Requires a reliable and consistent timestamp.
  6. Hybrid Pagination:
     - This technique combines multiple pagination techniques to leverage their strengths.
     - Example:
       - Combining **cursor** and **time-based pagination** for efficient scrolling through time-ordered records.
     - Example:
       ```sh
        GET /items?cursor=abc&start_time=xxx&end_time=yyy
       ```
     - Pros:
       - Can offer the best performance and flexibility for complex datasets.
     - Cons:
       - More complex to implement and requires careful design.

## 5. Documentation

- Use tools like Swagger (OpenAPI) or Postman to create interactive and up-to-date documentation. Good documentation should include:

  - Detailed descriptions of endpoints.
  - Request and response examples.
  - Error messages and codes.
  - Authentication methods.
  - Sample code snippets.

- Tools for API documentation include:
  1. [Swagger/OpenAPI Specification](https://swagger.io/specification/): A standard for describing RESTful APIs
  2. [Postman](https://www.postman.com/): A popular tool for API development and documentation

## 6. Testing

- **API Testing** is performed to test wheather a particular API meets pre-deined parametsrs or not. It includes testing APIs in isolation to ascertain if they meet the:
  - functionality,
  - reliability,
  - latency,
  - performance,
  - security, and other essesbtial parameters.
- Some of the api tests include:
  1. **Unit Testing:** involves testing the individual operations of the API by logically dividig them into units. **Unit testing** helps to identify imperfections in the early stages. It typically inclues testing each part of the code seperately.
  2. **Functional Testing:** includes testing of all the functions in the codebase. It is often uses unit tests as tyhe building blocks.
  3. **Load Testing:** generally validates the functionality and performance of API under load. **Load Testing** ensures whether an API will work as expected if multiple users are accessing the API concurrently.
  4. **Runtime Error Detection**: can be performed manually or through automated testing. This testing includes monitoring an API by actually running the API entirely. It helps us to detect errors and exceptions and also prevent resource leaks.
  5. **Security Testing**: this testing handles all the security aspects of an API, including external threats, validation, access control, and data encryption.
  6. **Penetration Testing:** includes testing an API to find vulnerabilities in the system or codebase that attackers can exploit. It also includes testing functions that could be misused and test security assests that could be bypassed.
  7. **Fuzz Testing:** in this testing, we provide substantial random data as the input to test the reliability of an API. This random data is known as **fuzz**. Fuzz Testing ensures the API functionality in the worst-case scenario.

* Thoroughly test your API to ensure it handles various scenarios gracefully. Use unit tests, integration tests, and automated testing tools to validate functionality and performance. Popular testing frameworks include:
  1. **JUnit** for Java.
  2. **PyTest** for Python.
  3. **Mocha** for JavaScript. Automated testing can help catch issues early and ensure your API remains reliable as it evolves.

## 7. Naming API Endpoints

- Here are some guidelines and examples to help you name your API endpoints effectively:

  1. **Use Nouns for Resource Names**. Endpoints should represent resources (nouns) rather than actions (verbs). For example, use `/users` instead of `/getUsers`
  2. **Use Plural Names for Collections**. When referring to a collection of resources, use plural nouns (e.g., `/users`). For a single resource, use the singular form along with its identifier (e.g., `/users/{id}`)
  3. **Use HTTP Methods to Define Actions**:
     - **GET**. Retrieve a resource or a collection of resources (e.g., `GET /users`, `GET /users/{id}`)
     - **POST**. Create a new resource (e.g., `POST /users`)
     - **PUT** or **PATCH**. Update an existing resource (e.g., `PUT /users/{id}` or `PATCH /users/{id}`).
     - **DELETE**. Remove a resource (e.g., `DELETE /users/{id}`)
  4. **Hierarchical Structure**. Use a clear and logical hierarchy to represent relationships between resources (e.g., `/users/{id}/posts` to represent posts by a specific user)
  5. **Use Consistent Naming Conventions**. Stick to a consistent naming convention, such as snake_case or kebab-case, and be consistent throughout your API (e.g., `/user_profiles` or `/user-profiles`)
  6. **Avoid Special Characters and Spaces**. Use hyphens (`-`) to separate words instead of spaces or underscores in URL paths (e.g., `/user-profiles` rather than `/user_profiles`)
  7. **Keep It Simple and Intuitive**. Names should be easy to understand and remember. Avoid complex or overly technical terminology.
  8. **Version Your API**. Include versioning in your endpoint paths to allow for future changes without breaking existing clients (e.g., `/v1/users`)
  9. **Describe Actions with Query Parameters**. Instead of using verbs in your endpoint paths, use query parameters for filtering, sorting, or searching (e.g., `GET /users?status=active`)

- Examples (Well-named API Endpoints):
  1. User Management
     - GET /v1/users – Retrieve a list of users.
     - GET /v1/users/{id} – Retrieve a specific user by ID
     - POST /v1/users – Create a new user
     - PUT /v1/users/{id} – Update a user's information
     - DELETE /v1/users/{id} – Delete a user
  2. Authentication
     - POST /v1/auth/login – User login
     - POST /v1/auth/register – User registration
     - POST /v1/auth/logout – User logout
  3. Resource Relationship
     - GET /v1/users/{id}/posts – Retrieve posts created by a specific user
     - POST /v1/users/{id}/posts – Create a new post for a specific user
  4. Pagination and Filtering
     - GET /v1/users?page=2&limit=10 – Paginate users with 10 per page
     - GET /v1/posts?sort=desc&category=tech – Retrieve posts sorted by date in descending order and filtered by category
  5. Complex Operations with Clear Naming
     - POST /v1/orders/{id}/cancel – Cancel an order
     - PUT /v1/users/{id}/password – Update a user's password.
  6. Error Handling and Statuses
     - GET /v1/orders?status=pending – Retrieve orders with a pending status

# API Optimizations

It's imperative to optimize your API to provide a better user experience. Here are five ways to optimize your API performance and make it standout:

1. **Cache Requests:** you can implement cache endpoints for the frequently used requests. This will reduce the number of round trips of client requets to the server and improve API performance and latency.

2. **Use PATCH over PUT:** the **PATCH** requests method only updates the necessary part of the resource whereas **PUT** updates the entire resource.

3. **Compress Data:** massive data transactions make the API slow. Consider using compression teschniques like **GZip** to compress the data sent through the API. It will make the transfer faster and improve the overall performance of your API.

4. **Using Appropriate Hosting:** if you expect your API to see high traffic surges, make sure you use a good hosting company that provides you with enough CPUs and databse instances to make your APIs fast. It will solve your network-related issues.

# API Lifecycle

- **API Lifecycle** provides a clear-cut plan for the entire lifecycle of an API. From a higher level, the **lifecycle of an API** involves three key phases — **create**, **control**, and **consume**. The following are the 7 stages of an API Lifecycle:

  1. **Design**: An API’s lifecycle starts with planning and designing the API in question. API design includes choosing an _API architecture_, _target audience_, and _API type_ (public, private, or partner). Lastly, API requirements are laid out using an API specification file.

  2. **Develop**: A team of API developers works on implementing the API according to the decisions and specifications in the design plan. An organized development phase includes implementation using a language or framework of choice, debugging, testing and documentation.

  3. **Publish**: At the end of the development phase, it is time to deploy the finished API to development, staging, and production environments. Then, we can make it available to the end-users by publishing it.

  4. **Secure**: The secure phase includes authentication and access control to stop unauthorized access to the API. The API should also be protected against OWASP 10 API security vulnerabilities.

  5. **Discover**: In this phase, the aim is to expose your API to potential consumers to increase adoption. We can call it the monetize phase for cases when you want to sell your API as a product.

  6. **Monitor**: When the API is up and running, it will be connected to multiple consumer applications that rely on it for data. Now the API enters the monitoring phase, where all parameters are checked to ensure the API is working correctly.

  7. **Depreciate**: In the API industry, backward compatibility is a serious concern, which is why older versions must work long enough after newer versions are released. Therefore, after proper planning and monitoring, API enters the last stage, where the older version is retired.

# Attacks On APIs

1. **API Injection Attack**: Injection attacks are carried out by inserting malicious code into the API via a query or request to obtain unauthorized access to data. These are most commonly SQL injection attacks, which insert malicious SQL code as a parameter field.

2. **DDoS (Distributed Denial of Service) attack**: This aims to disrupt a server with a large amount of traffic. It essentially creates a traffic jam, with no traffic able to be transferred to and from the server. This can break the API by making its data inaccessible to users.

3. **Excessive data exposure**: This is where an API returns unneeded or sensitive data in its responses that could be valuable to hackers. This is commonly seen where APIs return complete datasets as they are on backend servers, and the client is relied on to filter the results.

4. **MITM (Man-in-the-middle attack)**: MITM attacks are when a hacker intercepts communication between two programs to obtain the information being transferred between them. This risk is much greater if the data in transit is not encrypted, which is why using HTTPS is standard.

5. **Parameter tampering**: Parameter tampering aims to manipulate parameters sent in **API** requests, creating access to potentially sensitive information. Parameter tampering is done mainly through input forms submitted by clients on the web.

# Resources and Further Reading

1. [dev - Best Practices for Naming API Endpoints](https://dev.to/msnmongare/best-practices-for-naming-api-endpoints-2n5o?ref=dailydev)
2. [Medium - API Design: From Basics to Best Practices](https://blog.devgenius.io/api-design-from-basics-to-best-practices-49bbb29cf696)
