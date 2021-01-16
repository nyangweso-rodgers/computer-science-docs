# Algorithms and Data Structures
We will highlight the most common data structures used in __Computer Programming__ and also the __algorithms__ associated with these structures.

## 1. Linked List Data Structure
A __linked list__ is a _linear collection of data elements , in which each element points to the next_. The first element contains the address of the second element and the second element contains the address of the third element and so on till the last element contains null. It is a data structure consisting of a collection of nodes which together represent a sequence.

### The Node
This is the most basic building block for many common data structures. The node fulfills two functions:
1. _provides a mechanism to contain a piece of data_ e.g., an integer value 7.
2. _it provides a means of connecting itself to other nodes via object reference pointer_.This object reference point is referred to as _Next Pointer_.

### 1.1 Singly Linked List
* __Linked List__ is a single chain of nodes.
* They have a well defined starting point known as the __List Head__
* Also expose a pointer to the next node in the list i.e., the _tail_
* Provids various operations that allow the the list items to be managed, searched and enumerated. e.g., _Add_, _Find_, _Remove_, _Enumerate_

It is these operations that makes the list truly useful as a collection.

### 1.2 Doubly Linked List
A __doubly linked list__ is a linked data structure that consists of a set of sequentially linked records called __nodes__. Each node contains three fields: 
* Two link fields(the first contains the address of previous element and the other contains the address of the next element) 
* One data field/element field.

### Modern Implementations
* .NET Framework  linked list class: LinkedList<T>
* c++ standad language class: std::list<T>


## 2. Stack Data Structure
A __stack__ is a collection in which data is added and removed in a Last In First Out order. i.e., a __stack__ is an abstract data type that serves as a collection of elements, with two main principal operations: __Push__, which adds an element to the collection, and __Pop__, which removes the most recently added element that was not yet removed. This is know as __Last In First Out__ or __LIFO__.

### Use cases for STACK .
* When we are calling a Function and then that Function calls another function internally then this is managed by __Stack__
* The Undo command in any editor uses __Stack__ to track down the last set of operations 
* When you visit a website A and you open a page from A to B and then in B you open a certain page C. So the Go Back on Page C will take you back to B and then from B the back operation will take you to A. This is implemented using Stack. 

### Implementing Stacks
* We can implement Stacks using __Dynamic Array__ but there is a problem with this . When you are inserting in a __Dynamic Array__ , first it will allocate a random continues memory location and when its gets filled it will again allocate double the size of memory location and then it will copy all old elements to the new location. Hence they are not recommended for implementing Stacks
* To overcome this we make use of __DEQUE__ in Python


## 3. Queue Data Structure
A __queue__ is a __First In, First Out__ (__FIFO__) collection. This is a contrast to a __stack__ collection i.e., First In, Last Out collection. i.e., queue returns items in the same order they were added.

* __Enque__ adding an item into the queue.
* __Deque__ removing an item from the queue

### Implementations of Queue data structure
* Linked List for the item storage
* Array implementation

### Priority Queue
__Priority Queue__ differs from the normal queue in that they are not First In, First Out, but rather, they return the highest priority items first, regardless of the order of in which they were added to the Queue.

## 4. Hash Table Data Structure
A __hash table__ is a data structure that implements an _associative array_ abstract data type, a structure that can map __keys__ to __values__. In other words we can say that , __Hash Table__ is a data structure that stores the values using a __KEY:VALUE pairs__.

In Python we make use of __Dictionaries__ to store data values in __KEY:VALUE pairs__. . So Dictionaries is the Python specific implementation for the __Hash Table__ or __Hash Map__ . Though we can implement same thing using 2D Arrays .

### Hashing Functions(Algorithms)
1. Additive
2. Folding
3. CRC32
4. MD5
5. SHA-2


## References
1. https://carboncoffee.hashnode.dev/queue-in-python
2. https://carboncoffee.hashnode.dev/implementing-stack-in-python
3. https://carboncoffee.hashnode.dev/linked-list-using-python
4. https://carboncoffee.hashnode.dev/hash-table-in-python
