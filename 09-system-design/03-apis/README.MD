# APIs & Web Services

## Table Of Contents

# What is an Event-Driven Architecture?

- **Event-driven architectures** establish an event that can be consumed and reacted to. But what is an **event**? An **event** is essentially _any significant change from one state to another, such as the change from having no messages in your inbox to have a new message in your inbox_.

# 5 Protocols For Event-Driven API Architectures

- 5 common event-driven methods include:

  1. **WebSockets**:
  2. **WebHooks**:
  3. **REST Hooks**:
  4. **Pub-Sub**:
  5. **Server Sent Events**:

- If you are building for scalability with low overhead in a browser environment, **WebSockets** are a great solution. Conversely, if you’d like those same benefits but are working in a non-browser system, then **WebHooks** should be your approach. **REST Hooks** are not only great for **RESTful services**, they’re also much easier to set up than either, and thus are _great in low-time high-rush situations_. **Pub-Sub** can be great if you need to enforce a division between client and server, and this can further be established and controlled in an even stronger way with Server Sent.

# Popular Free APIs

1. Rest Countries API

   - [Rest Countries API](https://restcountries.com/#rest-countries) enables developers get information about countries using RESTful API. It's used for applications that require country specific data like location-based services or ecommerce sites.

2. OpenWeather

   - [OpenWeather](https://openweathermap.org/api) provides developers with easy-to-work weather APIs in their projects. It provides real-time weather reports such as **temperature**, **wind speed**, and **humidity** for various locations. To use the API, developers must sign up and obtain an API key to authenticate request.
   - The service offers different subscription plans, with a free version offer that provides limited forecast features.

3. [Random User](https://randomuser.me/)
4. [ExchangeRate](https://www.exchangerate-api.com/)
5. [GitHub’s REST API](https://docs.github.com/en/rest)
6. [The NASA APIs](https://api.nasa.gov/)

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
