# Object Oriented Programming (OOP)

## Table Of Contents
- [Introduction to Object Oriented Programming](#Introduction-to-Object-Oriented-Programming)
- [Definition of Terms in OOP](#Definition-of-Terms-in-OOP)
    - attributes
    - Inheritance
    - Polymorphism
    - Concurrency
    - Parallelism
- [Object Oriented Programming with JavaScript](https://github.com/nyangweso-rodgers/JavaScript_Projects/tree/main/Object_Oriented_Programming_in_JavaScript)
- [Object Oriented Programming with Python]()
- [References](#References)

# Introduction to Object Oriented Programming
* __OOP__ is a programming technique that centers around thinking of code as __objects(entities)__ with _identities_, _attributes_, and _behaviours_. i.e., an ___object__ has a _name_, aa defined set of _attributes/characteristics_, and _behaviours_ or _actions_ the __object__ can perform. 

* In classical coding, __objects__ are instances of __classes__ and a ___class__ is the _blueprint that contains all attributes and behaviours of an object_.__Example__: an __object__ can be a dog. And, naturally, a dog has a _name_, _colour_ of its fur, and _breed_. These are __attributes__ of the dog. It's also a living creature, so it can _run_, _bark_, _sleep_, e.t.c., We can call these the __behaviours__ or __actions__ that can be performed by a dog.

# Definition of Terms in OOP
1. __attributes__: are used by _assigning variables in the class_ while __behaviours__ are _functions/methods (block of code used to perform a particular task) written in the same class_.

2. __Inheritance__: allows objects to derive _attributes_ and _functionality_ from other objects, creating a hierarchy moving from more general objects to more specific. For example, a Car and a Boat are both specific types of Vehicles. Objects can inherit their behavior from a single parent object or multiple parent objects, and are referred to as __child objects__ when they do.

3. __Polymorphism__: allows two or more objects to behave like one another, which allows them to be used interchangeably. For example, if a method or function knows how to paint a Vehicle object, then it can also paint a Car or Boat object, since they inherit their data and behavior from the Vehicle.

4. __Concurrency__ is when multiple instructions execute at the same time(concurrently). __Concurrency__ is the ability to run multiple tasks on the __CPU__ at the same time. Tasks can start, run, and complete in overlapping time periods. In the case of a single __CPU__, multiple tasks are run with the help of context switching, where the state of a process is stored so that it can be called and executed later. Situations for __Concurrency__ are as below:
    - __Multiple Threads__
        - multiple threads executing within a single process
        - Example_: Multi-threaded .NET application accessing a shared collection

    - __Multiple Processes__
        - Several processes executing on a single computer system
        - _Example_: Multiple applications accessing a common file

    - __Multiple Systems__
        - Several systems, each accessing a common resource
        - _Example_: Multiple processes accessing a common database table.
5. __Parallelism__, meanwhile, is the ability to run multiple tasks at the same time across multiple __CPU__ cores.

    _Remarks_:
    * Though they can increase the speed of your application, __concurrency__ and __parallelism__ should not be used everywhere. The use case depends on whether the task is __CPU-bound__ or __IO-bound__.
    * Tasks that are limited by the CPU are CPU-bound. For example, mathematical computations are __CPU-bound__ since computational power increases as the number of computer processors increases. __Parallelism__ is for __CPU-bound__ tasks. In theory, If a task is divided into n-subtasks, each of these n-tasks can run in parallel to effectively reduce the time to 1/n of the original non-parallel task. 
    * __Concurrency__ is preferred for __IO-bound__ tasks, as you can do something else while the IO resources are being fetched.
    * The best example of __CPU-bound__ tasks is in _data science_. Data Scientists deal with huge chunks of data. For data preprocessing, they can split the data into multiple batches and run them in parallel, effectively decreasing the total time to process. Increasing the number of cores results in faster processing.
    * _Web scraping_ is __IO-bound__. Because the task has little effect on the CPU since most of the time is spent on reading from and writing to the network. Other common __IO-bound__ tasks include _database calls_ and _reading_ and _writing files to disk_. Web applications, like _Django_ and _Flask_, are __IO-bound__ applications.

# How OOP Differ from Functional Programming and Possible Trade-Offs
1. __Approcah to Problem Solving__: In OOP, problems are broken down into objects that model real-world entities & their behaviors. In FP, problems are solved by defining functions that take inputs & return outputs. OOP is centered around objects & their interactions, while FP is centered around functions & their composition.

2. __State Management__: In OOP, objects have a state that can change over time, & their behavior depends on this state. In FP, functions are pure, meaning that they don't change state & their output depends solely on their inputs. OOP relies on mutable state, while FP emphasizes immutability.

3. __Modularity__: In OOP, modularity is achieved through the use of classes & objects that encapsulate data & behavior. In FP, modularity is achieved through the use of functions & higher-order functions that can be combined to solve problems.

4. __Debugging__: OOP can be more difficult to debug because the state of objects can change over time, making it harder to understand what's happening in the program. FP can be easier to debug because functions are pure, & their behavior is easy to understand based solely on their inputs.