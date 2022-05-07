# NoSQL Databases

## Table of Contents
- [Types of NoSQL Database](#Types-of-NoSQL-Database)
    - Key - Value
    - Document
    - Columnar
    - Graph

# Types of NoSQL Database
1. __key - value__: are the least complex of the __NoSQL__ databases. All data that is stored with a __key__ and an associated __value__ blob. __key-value__ stores are represented as a __hashmap__, which makes them powerful for basic Create - Read - Update - Delete operations. however, these databases often are not meant for complex queries that are attempting to connect multiple pieces of data. Instead, they are suited only to situatiosn in which you always access data by using only a single key. some popular Key-Value databases are:
    * Redis
    * Hamster DM
    * DynamoDB
    * Berkely DB
    * Document
    * columnar
    * Graph
2. __Document__: build off the __key-value__ model by making the value visible and can be queried. Each piece of data is considered a document and often is stored in __JSON__ or __XML__ format. __document__ databases can index and query the contents of the document, which offers key and value range lookups and search ability or analytical queries by using paradigms, such as __MapReduce__. document databases are currently the most popular of the NoSQL databeses in use today. Some popular Document Databases include:
    * Cloudent
    * _MongoDB_: stores data in the form of __BSON__ structure-based documents. These documents are stored in a collection. __MongoDB__ allows a highly flexible and scalable document structure. Also, __MongoDB__ databases are  faster as compared to SQL databases due to efficient indexing and storage technoques. _Features_ include:
        * Flexible data model in form of documents
        * Agile and highly scalable database
        * Faster than traditional databases
        * Expressive query language
    * CouchDB

3. __Columnar__: focus on columns and groups of columns when storing data. when compared to row-oriented databases, __columnar__ databases can better compress data and save storage space. some popular columnar databases include:
    * dashDB
    * Cassandra
4. __Graph__: store information in entities (or nodes) and relationships (or edges). __graph__ databases are useful when your dataset resembles a graph-like data structure. traversing all of the relationships is quick and efficient, but these databases tend not to scale well. some popular Graph databases include:
    * Neo4j
    * OrientDB
    * FlockDB




# References
