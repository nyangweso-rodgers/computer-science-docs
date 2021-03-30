## NoSQL Databases
the following major types of NoSQL databases are available:
1. key - value
2. Document
3. Columnar
4. Graph

_these databases have unique characteristics that make them well-suited for different types of applications or parts of applications._

## 1. Key - Value:
are the least complex of the NoSQL databases. All data that is stored with a key and an associated value blob. key-value stores are represented as a hashmap, which makes them powerful for basic Create - Read - Update - Delete operations.

however, these databases often are not meant for complex queries that are attempting to connect multiple pieces of data. Instead, they are suited only to situatiosn in which you always access data by using only a single key.

some popular Key-Value databases are:
* Redis
* Hamster DM
* DynamoDB
* Berkely DB

## 2. Document:
build off the key-value model by making the value visible and can be queried. Each piece of data is considered a document and ofetn is stored in __JSON__ or __XML__ format. documnent databases can index and query the contents of the document, which offers key and value range lookups and search ability or analytical queries by using paradigms, such as __MapReduce__.

document databases are currently the most popular of the NoSQL databeses in use today. Some popular Document Databases include:
* Cloudent
* MongoDB
* CouchDB

## 3. Columnar:
focus on columns and groups of columns when storing data. when compared to row-oriented databases, columnar databases can better compress data and save storage space.
   
some popular columnar databases include:
* dashDB
* Cassandra

## 4. Graph:
store information in entities (or nodes) and relationships (or edges). graph databases are useful when your dataset resembles a graph-like data structure. traversing all of the relationships is quick and efficient, but these databases tend not to scale well.

some popular Graph databases include:
* Neo4j
* OrientDB
* FlockDB


## MongoDB
__MongoDB__ is becoming the most popular database and many popular websites use it.

## What kind of NoSQL database is MongoDB is?
__MongoDB__ is a document-oriented database. It stores data in the form of __BSON__ structure-based documents. These documents are stored in a collection.

## Compare SQL databases and MongoDB at a high level
__SQL__ databases store data in form of tables, rows, columns, and records. __MongoDB__ in contrast uses a flexible structure that can be easily modified and extended.

## How is MongoDB better than other SQL databases?
__MongoDB__ allows a highly flexible and scalable document structure. Also, __MongoDB__ databases are  faster as compared to SQL databases due to efficient indexing and storage technoques.

## Compare MongoDB and CouchDB at a high level
Both of these databases are document-oriented, __MongoDB__ is a better choice for applications that need dynamic queries and good performance. On the other side, __CauchDB__ is better used for applications with occassionally changing queries.

## Features of MongoDB
1. Flexible data model in form of documents
2. Agile and highly scalable database
3. Faster than traditional databases
4. Expressive query language

## What is a Namespace in MongoDB?
A __Namespace__ is the concatenation of the database name and collection name. e.g., school.students with the school as the database and students as the collection.

## Which languages can be used with MongoDB?
Currently, __MongoDB__ provides official drivery support for C, C++, C#, Java, Node.js, Perl, PHP, Python, Ruby, Scala, Go, and Erlang. __MongoDB__ can easily be used with any of these languages.

## Does MongoDB need a lot of RAM?
No. __MongoDB__ can be run even on a small amount of RAM. __MongoDB__ dynamically allocates and de-allocates RAM based on the requirements of other proceesses.

## Does MongoDB push the writes to disk immediately or lazily?
__MongoDB__ pushes the data to disk lazily. It updates the immediately written to the journal but writting the data from journal to disk happens lazily.

## Explain the structure of ObjectID in MongoDB
ObjectID is a 12-byte BSON type with:
* 4-bytes value representing seconds
* 3-byte machine identifier
* 2-byte process id
* 3-bytes counter

## What are indexes in MongoDB?
__Indexes__ support the efficient execution of queries in MongoDB. Without indexes, __MongoDB__ must perform a collection scan i.e.,scan every document in a collection, to select those documents that match the query statement.

## How many indexes does MongoDB create by default for a new collection?
By default, __MongoDB__ crateates the _id for every collection.

## Mention the command to list all the indexes on a particular collection.
db.collection.getIndexes()

## Whya re MongoDB data files large in size?
__MongoDB__ preallocates data files to reserve space and avoid file system fragmentation when you set up the server.