# Object Oriented Programming (OOP)

## Table Of Contents
- [Introduction to Object Oriented Programming](#Introduction-to-Object-Oriented-Programming)

- [Concepts in OOP](#Definition-of-Terms-in-OOP)
    - attributes
    - Inheritance
    - Polymorphism
    - Concurrency
    - Parallelism

# Introduction to Object Oriented Programming
* __OOP__ is a programming technique that centers around thinking of code as __objects(entities)__ with _identities_, _attributes_, and _behaviours_. i.e., an ___object__ has a _name_, aa defined set of _attributes/characteristics_, and _behaviours_ or _actions_ the __object__ can perform. 

* In classical coding, __objects__ are instances of __classes__ and a ___class__ is the _blueprint that contains all attributes and behaviours of an object_.__Example__: an __object__ can be a dog. And, naturally, a dog has a _name_, _colour_ of its fur, and _breed_. These are __attributes__ of the dog. It's also a living creature, so it can _run_, _bark_, _sleep_, e.t.c., We can call these the __behaviours__ or __actions__ that can be performed by a dog.

# Definition of Terms in OOP
1. __attributes__: are used by _assigning variables in the class_ while __behaviours__ are _functions/methods (block of code used to perform a particular task) written in the same class_.


# How OOP Differ from Functional Programming and Possible Trade-Offs
1. __Approcah to Problem Solving__: In OOP, problems are broken down into objects that model real-world entities & their behaviors. In FP, problems are solved by defining functions that take inputs & return outputs. OOP is centered around objects & their interactions, while FP is centered around functions & their composition.

2. __State Management__: In OOP, objects have a state that can change over time, & their behavior depends on this state. In FP, functions are pure, meaning that they don't change state & their output depends solely on their inputs. OOP relies on mutable state, while FP emphasizes immutability.

3. __Modularity__: In OOP, modularity is achieved through the use of classes & objects that encapsulate data & behavior. In FP, modularity is achieved through the use of functions & higher-order functions that can be combined to solve problems.

4. __Debugging__: OOP can be more difficult to debug because the state of objects can change over time, making it harder to understand what's happening in the program. FP can be easier to debug because functions are pure, & their behavior is easy to understand based solely on their inputs.