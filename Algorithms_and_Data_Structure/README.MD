# Algorithms and Data Structures
- [Table of Contents]()
- [Introduction to Algorithsms and Data Strucures](#Introduction-to-Algorithms-and-Data-Structures)
- [Classification of Data Structurea](#Classification-of-Data-Structures)
    - Linear STructures
        - [Linked List Data Structure](#Linked-List-Data-Structure)
            - [Advantages of Linked Lists](#Advantages-of-Linked-Lists)
            - [Linked Lists Drawbacks](#Linked-Lists-Drawbacks)
            - [Types of Linked Lists](#Types-of-Linked-Lists)
                - Singly Linked List
                - Doubly Linked List
            - [Modern Implementations of Linked List](#Modern-Implementations-of-Linked-List)

        - [Stack Data Structure](#Stack-Data-Structure)
            - [Use cases for STACK](#Use-cases-for-STACK)
            - [Implementing Stacks](#Implementing-Stacks)

        - [Queue Data Structure](#Queue-Data-Structure)
            - [Applications of Queue](#Applications-of-Queue)
            - [Implementations of Queue data structure](#Implementations-of-Queue-data-structure)
            - [Priority Queue](#Priority-Queue)

        - [Hash Table Data Structure](#Hash-Table-Data-Structure)
            - [Advanteges of Hash Table](#Advanteges-of-Hash-Table)
            - [Disadvantages of Hash Table](#Disadvantages-of-Hash-Table)
            - [Applications of Hash Table](#Applications-of-Hash-Table)
            - [Implementations of Hash Table](#Implementations-of-Hash-Table)

    - Hierarchial Structures
        - [Graphs Data Strucure](#Graphs-Data-Strucure)
            - [undirected vs. directed graphs](#undirected-vs.-directed-graphs)
            - [Implementation of graphs](#Implementation-of-graphs)
        - [Binary Tree Data Strucute](#Binary-Tree-Data-Strucute)
            - [Types of Binary Trees](#Types-of-Binary-Trees)
            - [Advantages of Binary Tree](#Advantages-of-Binary-Tree)
        - [Matrix Data Structure](#Matrix-Data-Structure)
            [#usage of matrix](#usage-of-matrix)
- [References](#References)

# Introduction to Algorithms and Data Structures
We will highlight the most common data structures used in __Computer Programming__ and also the __algorithms__ associated with these structures.

* __Data Structure__ arrangement of data in computer's memory such that it could make the data quickly available to the processor for required calculations. The functional definition of a __data structure__ is known as __ADI__ (__Abstract Data Type__) which is independent  of implementation. The implementation  part is left for developers who decide which technology better suits to their project needs.

# Classification of Data Structures
1. Linear Structures
    * Arrays
    * Linked List
    * Stacks
    * Queues - can be used to create task schedulers
2. Hierarchial Structures
    * trees - are used to represent hierarchial data e.g., files and folders in a file system
    * graphs - used to represent connections on social websites (e.g., Twitter, Facebook)
    * heaps

# Linked List Data Structure
A __linked list__ is a _linear collection of data elements , in which each element points to the next_. The first element contains the address of the second element and the second element contains the address of the third element and so on till the last element contains null. It is a data structure consisting of a collection of __nodes__ which together represent a sequence.

__Linked Lists__ are generally used as the fundamental building block for implementing data structure such as :
* stacks
* queues
* trees
* graphs

### The Node
This is the most basic building block for many common data structures. The node fulfills two functions:
1. _provides a mechanism to contain a piece of data_ e.g., an integer value 7.
2. _it provides a means of connecting itself to other nodes via object reference pointer_.This object reference point is referred to as _Next Pointer_.
# Types of Linked Lists
1. __Singly Linked List__: __Linked List__ in a single chain of nodes.
    * They have a well defined starting point known as the __List Head__
    * Also expose a pointer to the next node in the list i.e., the _tail_
    * Provids various operations that allow the the list items to be managed, searched and enumerated. e.g., _Add_, _Find_, _Remove_, _Enumerate_

2. __Doubly Linked List__: A __doubly linked list__ is a linked data structure that consists of a set of sequentially linked records called __nodes__. Each node contains three fields: 
    * Two link fields(the first contains the address of previous element and the other contains the address of the next element) 
    * One data field/element field.

# Modern Implementations of Linked List
* .NET Framework  linked list class: LinkedList<T>
* c++ standad language class: std::list<T>

# Advantages of Linked Lists
* although __Linked List__ is similar to an array, it's not restricted to a declared number of elements
* Unlike __array__ which store data contiguesly in memory or on disk, a __linked list__ can easily __insert__ or __remove__ elements without reallocation or reorganization of the entire structure because the data items need not be stored contiguously.

# Linked Lists Drawbacks
* Random access is not allowed - we must access nodes sequentially starting from the first one. Therefore, we cannot do a __binary serach__ on a __linked list__
* Extra memory space for a link is required for each element of the list.

# Stack Data Structure
A __stack__ is a collection in which data is added and removed in a __Last In First Out__ order. i.e., a __stack__ is an abstract data type that serves as a collection of elements, with two main principal operations: __Push__, which adds an element to the collection, and __Pop__, which removes the most recently added element that was not yet removed. This is know as __Last In First Out__ or __LIFO__.

# Use cases for STACK .
* When we are calling a Function and then that Function calls another function internally then this is managed by __Stack__
* The Undo command in any editor uses __Stack__ to track down the last set of operations 
* When you visit a website A and you open a page from A to B and then in B you open a certain page C. So the Go Back on Page C will take you back to B and then from B the back operation will take you to A. This is implemented using Stack. 

# Implementing Stacks
* We can implement Stacks using __Dynamic Array__ but there is a problem with this . When you are inserting in a __Dynamic Array__ , first it will allocate a random continues memory location and when its gets filled it will again allocate double the size of memory location and then it will copy all old elements to the new location. Hence they are not recommended for implementing Stacks
* To overcome this we make use of __DEQUE__ in Python


# Queue Data Structure
A __queue__ is a __First In, First Out__ (__FIFO__) collection. This is a contrast to a __stack__ collection i.e., __First In, Last Out__ collection. i.e., queue returns items in the same order they were added.

* __Enque__ adding an item into the queue.
* __Deque__ removing an item from the queue

# Applications of Queue
__Queue__ are used whenever we need to manage objects in order starting with the first one in. Scenarios include:
* printing documents on a printer
* call centre stystem answering people on hold
# Implementations of Queue data structure
* Linked List for the item storage
* Array implementation

# Priority Queue
__Priority Queue__ differs from the __normal queue__ in that they are not __First In, First Out__, but rather, they return the highest priority items first, regardless of the order of in which they were added to the Queue.

# Hash Table Data Structure
A __hash table__ is a data structure that implements an _associative array_ abstract data type, a structure that can map __keys__ to __values__. In other words we can say that , __Hash Table__ is a data structure that stores the values using a __KEY:VALUE pairs__.

__Hashing__ is a technique that is used to uniquely identify a specific object from a group of similar objects. Some examples of how hashing is used in our daily lives include:
- students are assigned a unique ID used to store and retrieve information about them
- libraries assign each book a unique number that is used to determine its shelf location.

In the above examples, the students and books were __hashed__  to a unique number.

__Hash function__: any function that maps a data set of an arbitrary size to a data set of a fixed size that falls into the hash table.
- the values returned by a __hash function__ are called __hash values__, __hash codes__, __hash sums__, or simply __hashes__.
- the __hash function__ should be able to get a unique hash  for each element in the data set to prevent collisions.

In Python we make use of __Dictionaries__ to store data values in __KEY:VALUE pairs__. . So Dictionaries is the Python specific implementation for the __Hash Table__ or __Hash Map__ . Though we can implement same thing using 2D Arrays .

### Hashing Functions(Algorithms)
1. Additive
2. Folding
3. CRC32
4. MD5
5. SHA-2

# Advanteges of Hash Table
* each element is assigned a __key (hash)__. The __key__ can be used to find the desired element directly.

# Disadvantages of Hash Table
* __Hash Tables__ don't remember  the order in which items are inserted. Thus, __hash tables__ are not efficient at ordering or sorting data

# Applications of Hash Table
* __Hash Tables__ are used in __database indexing__, __cache implementstions__ e.t.c.,
# Implementations of Hash Table
* __Hash Tables__ are commonly used to implement __associative arrays

# Graphs Data Strucure
are used to represent many real-life applications like networks, transportation paths of a city and social networks like __facebook__ where each person represent a single __node__.

A __graph__ is a set of connected __nodes__ where each node is called a __vertex__ and the connection between two of them is called an __Edge__.

# undirected vs. directed graphs
In __undirected graphs__, the __edges__ do not have directions (==>) id the vertex __u__ is connected to __v__, then __v__ is connected to __u__. They are usually drawn with straigh lines between the verteces (no arrows)

__example___: on __facebook__, if a user A friend to user B, then automatically menas user B is a friend of user A.

In __directed graphs__, each __edge__ has a defined direction which is usually represented with arrays. Having __u__ connected to __v__ does not necessarily mean that __v__ is connected to __u__.

__example__: on __twitter__, if user A follows user B, then B does not necessarily follow user A back.

# Implementation of graphs
* Adjacency Matrix
* Adjacency List

# Binary Tree Data Strucute
Unlike __Linear Data Structure__ (arrays, Linked List, Stacks and Queues), __Binary trees__ are __hierarchial__, they consists of interconnected __nodes__. The top most __node__ is called __root__.

For a given __node__, the __nodes__ that are directly under are called __children__. The __tree__ is called __binary__ because each node can have at most two children. The node directly above another node is called its __parent__.

* The tree which is a child of a node is called a __subtree__.
* Elements with no chilren are called __leaves__

# Types of Binary Trees
1. __Full Binary Tree__ a binary tree is considered __full__if every node has 0 or 2 children
2. __Complete Binary Tree__: all levels are completely filled except possibly the last level and the last level has all nodes as far left as possible
3. __Perfect Binary Tree__: if all internal nodes have two childres abd all leaves are at the same level.

# Advantages of Binary Tree
- trees reflect structural relationships in the data and are used to represent hierarchies
- trees provide efficient inseration and searching
- trees are flexible, allowing subtrees to be moved around with minimum effort

# Matrix Data Structure
Data structure with __rows__ and __columns__ (could be thought of as a two-dimensional array)

# usage of matrix
- consider __graphics__, where a digital image is basically a __matrix__. rows and columns of the matrix correspond to rows and columns of pixels, and the numerical entries  corresponf=d to the pixel's color values
- decoding digital videos
- processing digital sound
# References
1. https://carboncoffee.hashnode.dev/queue-in-python
2. https://carboncoffee.hashnode.dev/implementing-stack-in-python
3. https://carboncoffee.hashnode.dev/linked-list-using-python
4. https://carboncoffee.hashnode.dev/hash-table-in-python
