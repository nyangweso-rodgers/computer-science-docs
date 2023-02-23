# Hash Table

## Table Of Contents

# Overview of Hash Table
* A __hash table__ is a data structure that implements an _associative array_ abstract data type, a structure that can map __keys__ to __values__. In other words we can say that , __Hash Table__ is a data structure that stores the values using a __KEY:VALUE pairs__.

* __Hashing__ is a technique that is used to uniquely identify a specific object from a group of similar objects. Some examples of how hashing is used in our daily lives include:
    - students are assigned a unique ID used to store and retrieve information about them
    - libraries assign each book a unique number that is used to determine its shelf location.
* In the above examples, the students and books were __hashed__  to a unique number.

* __Hash function__: any function that maps a data set of an arbitrary size to a data set of a fixed size that falls into the hash table.
    - the values returned by a __hash function__ are called __hash values__, __hash codes__, __hash sums__, or simply __hashes__.
    - the __hash function__ should be able to get a unique hash  for each element in the data set to prevent collisions.

# Advantages
* Each element is assigned a __key (hash)__. The __key__ can be used to find the desired element directly.

# Disadvantages
* __Hash Tables__ don't remember  the order in which items are inserted. Thus, __hash tables__ are not efficient at ordering or sorting data

# Applications
* database indexing

* cache implementstions_

# Implementations
* __Hash Tables__ are commonly used to implement __associative arrays__