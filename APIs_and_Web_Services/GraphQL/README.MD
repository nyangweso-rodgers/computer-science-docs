# GraphQL

## Table of Contents
- [GraphQL Overview](#GraphQL-Overview)
- [GraphQL Query Document](#GraphQL-Query-Document)
- [GraphQL Type System](#GraphQL-Type-System)

# GraphQL Overview
__GraphQL__. Created by Facebook, is a very flexible query language for APIs, where the clients decide exactly what they want to fetch from the server instead of the server deciding what to send. A __query language__ allows you to query data from the data store. 

# GraphQL Query Document
In __GraphQL__ a __query document__ is a _string sent to a server to process and request data_. __Query Document__ are read-only operations, and cannot be manipulated. The query tells the server what it needs to do. The __fields__ are what the server used to identify what data to return.

# GraphQL Type System
__GraphQL__ used a type system to describe data and is organized around three main buiding blocks:
1. __Schema__: defines a set of types
2. __Queries__: obtain information about a specific fields from objects
3. __Resolvers__: retrieve data