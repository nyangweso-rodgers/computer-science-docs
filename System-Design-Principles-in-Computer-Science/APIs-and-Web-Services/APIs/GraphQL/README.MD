# GraphQL

## Table of Contents
- [Further Reading]()
    - [freeCodeCamp - The GraphQL API Handbook – How to Build, Test, Consume and Document GraphQL APIs](https://www.freecodecamp.org/news/building-consuming-and-documenting-a-graphql-api/)
# GraphQL Overview
* __GraphQL__. Created by Facebook, is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send. A __query language__ allows you to query data from the data store. 

* __GraphQL__ was developed in response to __REST APIs__, with the idea that you could execute precise syntax that retrieves only what is needed, lightening the payload and simplifying the process significantly.

* You start by creating a schema that describes all the possible queries and the specific types that they return. This can be challenging, but once completed, the API can accept specific requests and return a result that matches exactly what the user is looking for.

# How do GraphQL and REST APIs fetch data differently?
* With a __REST API__, a client requests a resource using an API endpoint where that particular resource is located on the server. Each resource has a unique endpoint. This means needing multiple resources requires multiple requests.

* On the other hand, __GraphQL__ functions using a single endpoint, and clients can request multiple resources in one call. __GraphQL__ uses a strongly typed schema definition language that represents objects using nodes. The __GraphQL__ server responds with a nested set of objects.
# GraphQL Query Document
* In __GraphQL__ a __query document__ is a _string sent to a server to process and request data_. __Query Document__ are read-only operations, and cannot be manipulated. The query tells the server what it needs to do. The __fields__ are what the server used to identify what data to return.

# GraphQL Type System
__GraphQL__ used a type system to describe data and is organized around three main buiding blocks:
1. __Schema__: defines a set of types
2. __Queries__: obtain information about a specific fields from objects
3. __Resolvers__: retrieve data

# Pros of GraphQL
* The advantages of immersing yourself in GraphQL APIs are that the API queries are transparent and well documented, giving users all the information they need to use it effectively. In addition, the precise results, detailed error messages, and flexible permissions help round out a well-balanced but high-functioning API. This is especially true when it comes to data structuring, where GraphQL gives users significant flexibility.

# Cons of GraphQL
* Performance can suffer with GraphQL if you have too many nested fields in any one request. It also doesn’t reuse standard HTTP caching semantics, so it actually requires custom efforts to achieve proper caching. All of this makes GraphQL difficult to pick up without lots of training and experience. It certainly is an acquired skill, breaking away from the long track record and industry knowledge around REST APIs.

# GraphQL Security Best Practices
* __Use query cost analysis__: This is the best method of rate limiting for GraphQL. Cost analysis protects your GraphQL server from DoS attacks by computing the data consumption per user and applying limits.

* __Use depth limiting__: GraphQL uses a single endpoint to access data, and its structure uses nested fields. This is very convenient, but its also a security risk.Attackers can use nested fields to create malicious loops that can crash a server. Depth limiting prevents this.

* __Use pagination__: Pagination limits the number of resources a client can access in a single request. This reduces latency when fetching large amounts of data and prevents the server from being overloaded.

* __Set query timeouts__: Timeouts can be used to protect against large queries. If the query is executing after the set time, it will fail automatically.

* __Prevent batch requests__: GraphQL supports query batching, where multiple requests can be made in a single call using GraphQL Aliases. Multiple batch requests can overload a server. Batch querying can be prevented by implementing proper rate-limiting and timeouts.