# APIs & Web Services

## Table Of Contents

# What is an Event-Driven Architecture?

- **Event-driven architectures** establish an event that can be consumed and reacted to. But what is an **event**? An **event** is essentially _any significant change from one state to another, such as the change from having no messages in your inbox to have a new message in your inbox_.

# Popular Concepts in APIs Design

## 1. Access Tokens

- In their broadest sense, an **access token** is any code that authorizes a user and establishes the extent of their permissions. Once they’re received, a resource server verifies the access token and grants access for the specified duration. This duration is usually very short for security reasons. **Sessions** can be extended by using a **refresh token** to obtain a new access token without requiring the user to log in again.

- **Main Types of Access Tokens**:
  1. **Bearer tokens**: are the most rudimentary, as they’re the digital equivalent of the key to your front door. They’ve got the same problems and limitations as physical keys, too. If someone gets a hold of a bearer token, they’ll have the same access as the official recipient.
  2. **Sender-constrained tokens**: are more secure while operating on a principle similar to access tokens. For sender-constrained tokens, the access token is bound to the client’s identity, preventing unauthorized reuse.
  3. **ID tokens**: serve a different purpose — proving who the user is. Using OpenID Connect, ID tokens are issued as JSON Web Tokens (JWTs) containing numerous properties associated with the user, all of which can be configured by the authorization server. JWTs are web tokens encoded in Base64URL format consisting of three segments: the header, the payload, and the signature. Each of these segments is separated by a period.

## API Gateway

- Is a type of software that provides a way for **clients** to interact with a set of back-end services. A typical API gateway will provide a set of APIs that clients can use to access the various back-end services. **API Gateway** acts as a **proxy**, intercepting requests from the application and forwarding them to the appropriate backend service.
- **What the API Gateway does**:

  1. Routes requests to appropriate microservices.
  2. Handles **authentication** and **authorization** using **tokens** (e.g., **JWT**).
  3. Applies rate limiting to prevent abuse.
  4. Caches responses to improve performance.
  5. Logs requests and responses for monitoring and debugging.

- **Benefits of API Gateway**:

  1.  Simplifies client logic: Clients deal with one endpoint instead of many.
  2.  Increased Security: API gateways can provide an additional layer of security for your backend services by validating incoming requests and enforcing authentication and authorization policies.
  3.  Improved performance: API gateways can cache commonly requested data and distribute load across multiple backend servers to improve performance.
  4.  Easier management: API gateways can provide a single point of control for managing your backend services, making them easier to deploy.
  5.  Supports versioning: Helps manage multiple versions of APIs.

- **Example of API Gateways**:

  1. [Kong Gateway](https://github.com/Kong/kong)

     - An open-source, cloud-native API gateway built for scalability and extensibility.
     - Kong excels with its plugin architecture, deep Kubernetes integrations, and native service mesh (Kong Mesh). Kong Konnect, its SaaS control plane, makes hybrid/multi-cloud management seamless.

  2. [Zuplo](https://zuplo.com/)

     - A newer, developer-friendly API gateway designed for rapid deployment.
     - Zuplo is built with developer experience in mind, offering a code-first approach with native GitOps, automatic OpenAPI validation, and integrated rate limiting.

  3. [Tyk API Management Platform & API Gateway](https://tyk.io/)

     - An open-source gateway with both self-managed and cloud-hosted options.
     - Tyk offers a lightweight footprint, a strong open-source community, and out-of-the-box GraphQL support. Its additional tooling through the API developer portal makes it attractive for teams looking to integrate features in a one-stop shop model.

  4. [Gravitee](https://www.gravitee.io/)

     - An event-native API gateway that supports both REST and asynchronous APIs.
     - **Gravitee** is differentiated by strong support for event-driven architectures and protocols like **MQTT** and **Kafka**.
     - **Use case**: Companies combining REST APIs with event streaming or IoT.

  5. [MuleSoft Anypoint API Manager](https://docs.mulesoft.com/api-manager/latest/latest-overview-concept)

     - This gateway solution is part of MuleSoft’s broader Anypoint Platform, which offers broader API management and product-centric offerings.
     - MuleSoft provides deep integrations and reusable assets through its Anypoint Exchange. However, its complexity and cost can be high.
     - **Use case**: Large enterprises needing full-stack integration between APIs, data, and applications.

  6. [Axway Amplify API Management](https://www.axway.com/en/products/amplify-api-management)

     - A hybrid and multi-cloud API management solution with a policy-based security gateway.
     - An API solution unifying APIs across legacy systems, microservices, and SaaS environments.
     - **Use case**: Enterprises developing and modernizing legacy systems that don’t want to overhaul their architecture.

  7. [Sensedia API Platform](https://www.sensedia.com/)

     - A comprehensive API management suite with a powerful gateway integration focused on AI providers.
     - The AI gateway is a novel method for connecting with integrated AI providers, though it is challenged by standard solutions like MCP.
     - **Use Case**: Financial services and open banking implementations requiring adaptive governance.

  8. [Azure API Management](https://azure.microsoft.com/en-us/products/api-management)

     - A fully managed API gateway and management solution from Microsoft’s Azure offering with tight native integrations.
     - Full and easy integration with the Azure ecosystem unlocks high control and flexibility.
     - **Use case**: Best for teams already integrated or invested in the Azure cloud platform.

  9. [WSO2 API Gateway]()
     - A runtime and backend API gateway that offers integrated services across the WSO2 line, integrating monitoring, analytics, and more. WSO2 offers extensive customization across a variety of implementations.
     - Extensively customizable solution with strong identity management, REST and SOAP support, and open-source licensing.
     - **Use case**: Teams looking for a highly customizable solution that is open source.

- **Common API Gateway Patterns**:

  1. **Backends For Front-ends** (**BFF**)

     - **BFF pattern** is intended to solve the needs of diverse client-based applications like **web**, **mobile**, and **desktop**. Here, the **gateway** is customized according to the **client type** and then offers a backend capable of managing data in the proper manner for the particular client.
     - By this pattern, the developers can be assured that every client has what they require without complicated matters. This approach cuts down on the process from a client’s side and minimizes the client’s dialogue with the backend.
     - Here’s a simple code example in `Express.js`:

       ```js
       // Express.js example for a BFF pattern
       const express = require("express");
       const app = express();
       const port = 3000;

       // Mobile Backend
       app.get("/mobile/user", (req, res) => {
         // Fetch and process data specifically for mobile users
         res.json({ id: 1, name: "John Doe", mobileOptimized: true });
       });

       // Web Backend
       app.get("/web/user", (req, res) => {
         // Fetch and process data specifically for web users
         res.json({
           id: 1,
           name: "John Doe",
           mobileOptimized: false,
           additionalData: "More data for web",
         });
       });

       app.listen(port, () =>
         console.log(`BFF service running on port ${port}`)
       );
       ```

     - This results in the creation of two endpoints, mobile under `/mobile/user` and web under `/web/user`. Each endpoint returns data that is changed to meet the needs of a certain client.

  2. **API Gateway Aggregation**

     - **API gateway aggregation** unifies data from many microservices into one response. Most of the time, in microservices, a single request from a client may require information from several services since each handles a particular segment of the application functionality. The gateway eliminates the need for the client to make repeated calls to each of the services; instead, the pattern aggregates all the data on the server’s end and supplies it in a single response.
     - Here’s a code example in `Express.js`:

       ```js
       // Express.js example for API Gateway Aggregation
       const express = require("express");
       const axios = require("axios");
       const app = express();
       const port = 3000;

       app.get("/aggregated-data", async (req, res) => {
         try {
           const userResponse = await axios.get("http://user-service/users/1");
           const ordersResponse = await axios.get(
             "http://order-service/orders/user/1"
           );

           // Combine data from different services
           const aggregatedData = {
             user: userResponse.data,
             orders: ordersResponse.data,
           };

           res.json(aggregatedData);
         } catch (error) {
           res.status(500).send("Error fetching data");
         }
       });

       app.listen(port, () =>
         console.log(`API Gateway running on port ${port}`)
       );
       ```

     - The `/aggregated-data` endpoint retrieves data from a `user-service` and order data from an `order-service` and then produces a combined response.

  3. **Edge Functions**

     - **Edge functions** improves the performance of **API gateways** using **CDNs** and edge computing distributed topology. Utilizing this pattern features such as request routing and caching, as well as security checks, are placed near the end-users within the edge of the network. Edge functions distribute load across multiple edge locations and are not centrally hosted on another server.
     - Here’s a simple explanation in Javascript:

       ```js
       // Example using Cloudflare Workers as edge functions
       addEventListener("fetch", (event) => {
         event.respondWith(handleRequest(event.request));
       });

       async function handleRequest(request) {
         const url = new URL(request.url);

         // Simple routing logic
         if (url.pathname === "/cached-data") {
           // Respond with cached data
           return new Response("Cached Response", { status: 200 });
         } else {
           // Fetch from origin server
           return fetch(request);
         }
       }
       ```

     - The above shows how edge functions can be deployed using [Cloudflare Workers](https://workers.cloudflare.com/). The function deals with the request by providing the information from caches located at the edge available, thus decreasing the latency.

  4. **Circuit Breaker**

     - This is a resilience pattern that is applied to protect available services from failure occurrences. This pattern assists in keeping a check on the well-being of a service, and when it begins to deteriorate or fails to respond, a **circuit breaker** steps in and prevents any further requests from being made.
     - Here’s an example of how it prevents a tailoring service from continuing to receive traffic in Node.js:

       ```js
       // Simple Circuit Breaker example in Node.js
       const CircuitBreaker = require("opossum");

       // Service call wrapped in a circuit breaker
       const fetchServiceData = () =>
         axios.get("http://unreliable-service/data");

       const breaker = new CircuitBreaker(fetchServiceData, {
         timeout: 3000, // If service doesn't respond within 3 seconds, trip the circuit
         errorThresholdPercentage: 50, // Trip the circuit if 50% of requests fail
         resetTimeout: 5000, // Attempt to reset the circuit after 5 seconds
       });

       breaker.fallback(() => "Fallback data due to service failure");

       breaker
         .fire()
         .then((response) => console.log(response.data))
         .catch((error) => console.error("Service failed", error));
       ```

     - The above utilizes `opossum` in the implementation of a circuit breaker between a call to a service. If the service is not up to the mark or if the response time is high, then a breaker trip and fallback command is initiated. This means that the chances of the application becoming vulnerable are kept at a minimum.

# 5 Protocols For Event-Driven API Architectures

- 5 common event-driven methods include:

  1. **WebSockets**:
  2. **WebHooks**:
  3. **REST Hooks**:
  4. **Pub-Sub**:
  5. **Server Sent Events**:

- If you are building for scalability with low overhead in a browser environment, **WebSockets** are a great solution. Conversely, if you’d like those same benefits but are working in a non-browser system, then **WebHooks** should be your approach. **REST Hooks** are not only great for **RESTful services**, they’re also much easier to set up than either, and thus are _great in low-time high-rush situations_. **Pub-Sub** can be great if you need to enforce a division between client and server, and this can further be established and controlled in an even stronger way with Server Sent.

# Popular Free APIs

1. [Free Public APIs](https://www.freepublicapis.com/?ref=dailydev)

2. [Rest Countries API](https://restcountries.com/#rest-countries)

   - [Rest Countries API](https://restcountries.com/#rest-countries) enables developers get information about countries using RESTful API. It's used for applications that require country specific data like location-based services or ecommerce sites.

3. [OpenWeather](https://openweathermap.org/api)

   - [OpenWeather](https://openweathermap.org/api) provides developers with easy-to-work weather APIs in their projects. It provides real-time weather reports such as **temperature**, **wind speed**, and **humidity** for various locations. To use the API, developers must sign up and obtain an API key to authenticate request.
   - The service offers different subscription plans, with a free version offer that provides limited forecast features.

4. [Weather API](https://www.weatherapi.com/)
5. [Random User](https://randomuser.me/)
6. [ExchangeRate](https://www.exchangerate-api.com/)
7. [GitHub’s REST API](https://docs.github.com/en/rest)
8. [The NASA APIs](https://api.nasa.gov/)

## 1. Rest Countries API

## 2. Jira Cloud REST API

- The **Jira Cloud REST API** provides several endpoints to fetch data related to **issues**, **projects**, **sprints**, and more
- All endpoints assume the base URL is `https://your-domain.atlassian.net`
- Testing the API

  - To test if you can fetch sprints and inspect the data, Generate an API Token from `https://id.atlassian.com/manage-profile/security/api-tokens` and Use your email and API token for Basic Auth.

- **Handle Errors**

  1. **401 Unauthorized**: Invalid credentials or missing API token.
  2. **403 Forbidden**: Insufficient permissions (e.g., no access to the project or board).
  3. **404 Not Found**: Invalid project key or board ID.
  4. **400 Bad Request**: Incorrect parameters (e.g., invalid `state` value).

- Examples:

  1. **Fetching Project Boards**

     - **Endpoint**: `GET /rest/agile/1.0/board`
     - **Parameters**

       1. `projectKeyOrId`: The project key (e.g., `ABC`).
       2. Optional: `startAt` and `maxResults` for pagination.

     - **Authentication**: Use Basic Auth with your email and API token. Encode `email:api_token` in Base64.
     - Example Request:
       ```sh
         curl -u email:api_token \
            -X GET \
            -H "Content-Type: application/json" \
            https://your-domain.atlassian.net/rest/agile/1.0/board?projectKeyOrId=ABC
       ```

  2. **Fetching Issues from a Specified Board**

     - **Endpoint**: `GET /rest/agile/1.0/board/{boardId}/issue`
     - **Parameters**

       1. `boardId`: The board ID (e.g., `92`, obtained from `GET /rest/agile/1.0/board?projectKeyOrId=ABC`).
       2. Optional: fields to specify which issue fields to return (e.g., `summary`,`assignee`,`sprint`,`status`).
       3. Optional: `jql` to filter issues (e.g., `sprint=13` for a specific sprint).
       4. Optional: `startAt` and `maxResults` for pagination (default `maxResults` is 50).

     - **Example Request** (fetching one issue for simplicity):
       ```sh
         curl -u email:api_token \
            -X GET \
            -H "Content-Type: application/json" \
            https://your-domain.atlassian.net/rest/agile/1.0/board/92/issue?maxResults=1&fields=summary,assignee,sprint,status,issuetype,priority,labels,description,customfield_10010
       ```
     - **Example Request**: **Fetch a Specific Issue by Key**
       - **Endpoint**: `GET /rest/api/3/issue/{issueIdOrKey}`
         ```sh
            curl -u email:api_token \
               -X GET \
               -H "Content-Type: application/json" \
               https://your-domain.atlassian.net/rest/api/3/issue/ABC-123?fields=summary,assignee,sprint,status,issuetype,priority,labels,description
         ```

  3. **Fetching Sprints for the Board**

     - Using the board ID, fetch the sprints associated with that board.
     - **Endpoint**: `GET /rest/agile/1.0/board/{boardId}/sprint`
     - **Parameters**:

       1. `boardId`: The board ID (e.g., `92`)
       2. Optional: `state` (e.g., `active`, `closed`, `future`) to filter sprints.
       3. Optional: `startAt` and `maxResults` for pagination.

     - Example Request (Active Sprint):
       ```sh
         curl -u email:api_token \
            -X GET \
            -H "Content-Type: application/json" \
            https://your-domain.atlassian.net/rest/agile/1.0/board/92/sprint?state=active
       ```
     - Example Request (Closed Sprints):
       ```sh
         curl -u email:api_token \
            -X GET \
            -H "Content-Type: application/json" \
            https://your-domain.atlassian.net/rest/agile/1.0/board/92/sprint?state=closed
       ```

  4. **Fetch Issues in a Sprint (to Verify Data)**

     - To further inspect sprint-related data, you can fetch issues in a specific sprint to see how sprint details are nested within issues.
     - **Endpoint**: `GET /rest/agile/1.0/sprint/{sprintId}/issue`
     - **Parameters**:

       1. `sprintId`: The sprint ID (e.g., `13`).
       2. **Optional**: fields to specify issue fields (e.g., `summary`,`sprint`).

     - Example Request:
       ```sh
         curl -u email:api_token \
            -X GET \
            -H "Content-Type: application/json" \
            https://your-domain.atlassian.net/rest/agile/1.0/sprint/13/issue?fields=summary,sprint
       ```

# Resources and Further Reading

1. [OpneReplay - API Gateway Patterns and Practices](https://blog.openreplay.com/api-gateway-patterns-and-practices/?ref=dailydev)
