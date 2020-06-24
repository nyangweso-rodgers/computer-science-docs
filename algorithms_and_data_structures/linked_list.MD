# Linked List Data Structure

## The Node
This is the most basic building block for many common data structures. The node fulfills two functions:
1. _provides a mechanism to contain a piece of data_ e.g., an integer value 7.
2. _it provides a means of connecting itself to other nodes via object reference pointer_.This object reference point is referred to as _Next Pointer_.

## Singly Linked List
1. __Linked List__ is a single chain of nodes.
2. They have a well defined starting point known as the __List Head__
3. Also expose a pointer to the next node in the list i.e., the _tail_
4. Provids various operations that allow the the list items to be managed, searched and enumerated. e.g.,
* Add
* Find 
* Remove
* Enumerate

It is these operations that makes the list truly useful as a collection.

## Doubly Linked List
A __doubly linked list__ starts with the single node. _Note_ Singly Linked and Doubly Linked List are similar in implementation.

## Modern Implementations
1. .NET Framework  linked list class: LinkedList<T>
2. c++ standad language class: std::list<T>
