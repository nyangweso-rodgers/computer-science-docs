# Linked Lists

## Table Of Contents

# Overview of Linked Lists
* A __linked list__ is a _linear collection of data elements , in which each element points to the next_. The first element contains the address of the second element and the second element contains the address of the third element and so on till the last element contains null. 

* It is a data structure consisting of a collection of __nodes__ which together represent a sequence.

* __Linked Lists__ are generally used as the fundamental building block for implementing data structure such as :
    * stacks
    * queues
    * trees
    * graphs

# Types Of Linked Lists

# Type 1: Singly Linked List
* __Linked List__ in a single chain of nodes.
* They have a well defined starting point known as the __List Head__
* Also expose a pointer to the next node in the list i.e., the _tail_
* Provids various operations that allow the the list items to be managed, searched and enumerated. e.g., _Add_, _Find_, _Remove_, _Enumerate_


# Type 2: Doubly Linked List
* A __doubly linked list__ is a linked data structure that consists of a set of sequentially linked records called __nodes__. Each node contains three fields: 
        * Two link fields(the first contains the address of previous element and the other contains the address of the next element) 
        * One data field/element field.

# Advantages of Linked Lists
* although __Linked List__ is similar to an array, it's not restricted to a declared number of elements

* Unlike __array__ which store data contiguesly in memory or on disk, a __linked list__ can easily __insert__ or __remove__ elements without reallocation or reorganization of the entire structure because the data items need not be stored contiguously.

# Linked Lists Drawbacks
* Random access is not allowed - we must access nodes sequentially starting from the first one. Therefore, we cannot do a __binary search__ on a __linked list__

* Extra memory space for a link is required for each element of the list.