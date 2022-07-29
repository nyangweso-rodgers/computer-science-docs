# GraphQL

## Table of Contents
1. [GraphQL Overview](#GraphQL-Overview)
2. [GraphQL Query Document](#GraphQL-Query-Document)
3. [GraphQL Type System](#GraphQL-Type-System)
4. [Pros of GraphQL](#Pros-of-GraphQL)
5. [Cons of GraphQL](#Cons-of-GraphQL)

# GraphQL Overview
* __GraphQL__. Created by Facebook, is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send. A __query language__ allows you to query data from the data store. 
* __GraphQL__ was developed in response to __REST APIs__, with the idea that you could execute precise syntax that retrieves only what is needed, lightening the payload and simplifying the process significantly.
* You start by creating a schema that describes all the possible queries and the specific types that they return. This can be challenging, but once completed, the API can accept specific requests and return a result that matches exactly what the user is looking for.
# GraphQL Query Document
In __GraphQL__ a __query document__ is a _string sent to a server to process and request data_. __Query Document__ are read-only operations, and cannot be manipulated. The query tells the server what it needs to do. The __fields__ are what the server used to identify what data to return.

# GraphQL Type System
__GraphQL__ used a type system to describe data and is organized around three main buiding blocks:
1. __Schema__: defines a set of types
2. __Queries__: obtain information about a specific fields from objects
3. __Resolvers__: retrieve data

# Pros of GraphQL
* The advantages of immersing yourself in GraphQL APIs are that the API queries are transparent and well documented, giving users all the information they need to use it effectively. In addition, the precise results, detailed error messages, and flexible permissions help round out a well-balanced but high-functioning API. This is especially true when it comes to data structuring, where GraphQL gives users significant flexibility.

# Cons of GraphQL
* Performance can suffer with GraphQL if you have too many nested fields in any one request. It also doesn’t reuse standard HTTP caching semantics, so it actually requires custom efforts to achieve proper caching. All of this makes GraphQL difficult to pick up without lots of training and experience. It certainly is an acquired skill, breaking away from the long track record and industry knowledge around REST APIs.