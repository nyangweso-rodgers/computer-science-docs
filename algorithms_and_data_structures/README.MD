# Algorithms and Data Structures
We will highlight the most common data structures used in __Computer Programming__ and also the __algorithms__ associated with these structures.

## 1. Stack Data Structure
A __stack__ is a collection in which data is added and removed in a Last In First Out order. i.e., a __stack__ is an abstract data type that serves as a collection of elements, with two main principal operations: __Push__, which adds an element to the collection, and __Pop__, which removes the most recently added element that was not yet removed. This is know as __Last In First Out__ or __LIFO__.

### Use cases for STACK .
* When we are calling a Function and then that Function calls another function internally then this is managed by __Stack__
* The Undo command in any editor uses __Stack__ to track down the last set of operations 
* When you visit a website A and you open a page from A to B and then in B you open a certain page C. So the Go Back on Page C will take you back to B and then from B the back operation will take you to A. This is implemented using Stack. 


## 2. Queue Data Structure
A __queue__ is a __First In, First Out__ (__FIFO__) collection. This is a contrast to a __stack__ collection i.e., First In, Last Out collection. i.e., queue returns items in the same order they were added.

* __Enque__ adding an item into the queue.
* __Deque__ removing an item from the queue

### Implementations of Queue data structure
* Linked List for the item storage
* Array implementation

### Priority Queue
__Priority Queue__ differs from the normal queue in that they are not First In, First Out, but rather, they return the highest priority items first, regardless of the order of in which they were added to the Queue.


## References
1. https://carboncoffee.hashnode.dev/queue-in-python
