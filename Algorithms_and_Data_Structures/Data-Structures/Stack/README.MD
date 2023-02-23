# Stack

## Table Of Contents

# Overview of Stack
* A __stack__ is a collection in which data is added and removed in a __Last In First Out__ order. i.e., a __stack__ is an abstract data type that serves as a collection of elements, with two main principal operations: __Push__, which adds an element to the collection, and __Pop__, which removes the most recently added element that was not yet removed. This is know as __Last In First Out__ or __LIFO__.

# Use cases for STACK
* When we are calling a Function and then that Function calls another function internally then this is managed by __Stack__

* The Undo command in any editor uses __Stack__ to track down the last set of operations

* When you visit a website A and you open a page from A to B and then in B you open a certain page C. So the Go Back on Page C will take you back to B and then from B the back operation will take you to A. This is implemented using __Stack__.

# Implementing Stacks
* using __Dynamic Array__ but there is a problem with this . When you are inserting in a __Dynamic Array__ , first it will allocate a random continues memory location and when its gets filled it will again allocate double the size of memory location and then it will copy all old elements to the new location. Hence they are not recommended for implementing Stacks

* To overcome this we make use of __DEQUE__ in Python 