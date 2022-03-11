# Getting started with Computer Science
## Table of Contents
- [Introduction to Computer Science]()
    - [Computer Science vs. Software Engineering](#Computer-Science-vs-Software-Engineering)
    - [Computer Programming - Overview](#Computer-Programming-Overview)
        - [Operating System]()
        - LocalHost
        - Payload
        - IP Address
        - Caching
        - Computer Program
        - Algorithm
        - Source Code 
        - Bytecode
        - Translators
        - Common Bugs
        - Microservices
        - Software Development Methodologies

- [Object Oriented Programming (OOP)](#Object-Oriented-Programming)
    - [Object Oriented Programming in Python]()
    - [Object Oriented Programming in Java]()
    - [Inheritance and Polymorphism](#Inheritance-and-Polymorphism)

- [Concurrency vs Parallelism](#Concurrency-vs-Parallelism)
    - [Situations for Concurrency](##Situations-for-Concurrency)
- [Big - O - Notation](#8.-The-Big-O-Notation)
- [Recursion](#9.-Recursion)
    - [Countdown Function](##9.1-Example1:-Building-a-Countdown-Function)
    - [Power Function](##9.2-Example2:-Building-the-Power-Function)
    - [Factorial Function](##9.3-Example3:-Building-the-Factorial-Function)
-----------------------------------------------------------------------

# Introduction to Computer Science
# Computer Science vs Software Engineering
__Computer Science__ is the study of how computers work, mostly the theoratical and mathematical perspective. __Software Engineering__ is the study of how software systems are built, including topics such as Project Management, Quality Assurance, and Software Testing.

# Computer Programming Overview 
# Definition of Terms

2. __Secure Shell (SSH)__: open-source protocol used to secure network communication which is less expensive and complex than the hardware based __VPN__ solutions. i.e., it offers _authentication_, _encryption_ and _data integrity_ for securing network communicationsy. 

  By Implementing __SSH__, we get some of the capabilities like:
    - secure command-shell
    - secure file transfer
    - remote access to a variety of __TCP/IP__ applications via a secure tunnel
    
2. __LocalHost__: refers to “_this computer_” or even more accurately “_the computer I’m working on_.” 



    

6. __IP Addresses__: 
The __IP address__ is a fascinating product of modern computer technology designed to allow one connected computer (or “smart” device) to communicate with another device over the Internet. Because, in the same way you to need a mailing address to recieve a letter in the mail from a friend, a remote computer needs your __IP address__ to communicate with your computer.

    ```shell
    # run on command prompt
    # get the IP Address
    ipconfig
    ```

    ```shell
    # run on command prompt
    # get the IP Address
    ipconfig/all
    ```

    ```shell
    # run on command prompt
    # get the IP Address
    ipconfig/all!more
    ```

    __6.1 The IPv4 Address.__: The common type of __IP address__ (is known as __IPv4__, for “__version 4__”). Here’s an example of what an __IP address__ might look like: __66.171.248.170__. An __IPv4__ address consists of __four numbers__, each of which contains one to three digits, with a single dot (.) separating each number or set of digits. Each of the four numbers can range from 0 to 255. This versatile group of segmented numbers create the addresses that lets you and everyone around the globe to send and retrieve data over our Internet connections. Without this numeric protocol, sending and receiving data over the World Wide Web would be impossible.

    __6.2 IPv6 (Internet Protocol Version 6)__: It’s called __IPv6__ and it offers a maximum number of __IP address__ for today and for the future. Whereas __IPv4__ supports a maximum of approximately 4.3 billion unique IP addresses, __IPv6__ supports, in theory, a maximum number that will never run out. An __IPv6__ address consists of __eight groups__ of four hexadecimal digits. If a group consists of four zeros, the notation can be shortened using a colon to replace the zeros. Here’s an example IPv6 address: __2001:0db8:85a3:0000:0000:8a2e:0370:7334__

    __REMARK:__ _Your IP address is your passport to the Internet. But it also gives away your location and is used to profile your individual online activity. That’s why you might consider hiding it._

    A main advantage of __IPv6__ is increased address space. The 128-bit length of IPv6 addresses is a significant gain over the 32-bit length of __IPv4 addresses__, allowing for an almost limitless number of unique IP addresses. The size of the __IPv6 address__ space makes it less vulnerable to malicious activities such as IP scanning. __IPv6 packets__ can support a larger payload than __IPv4 packets__ resulting in increased throughput and transport efficiency.


    __6.3 using nslookup on the command line__
    * __nslookup__ allows you to do __DNS__ queries on the command line
    ```shell
    # returns the IP Addresses for Pluralsight.com
    nslookup pluralsight.com
    ```
    __6.4 DNS Caching__
    ```shell
    # display all the cached dns server on the local machine
    ipconfig/displaydns
    ```

    __6.5 DNS Record Types__
    ```shell
    nslookup
    set type=NS
    pluralsight.com
    ```
    __6.6 IP Routing__
    ```shell
    trecert
    trecert pluralsight.com
    ```

    ```shell
    pathping pluralsight.com
    ```


7. __Computer Program__ is a sequence of instructions written using a Computer Programming Language to perform a specified task by the computer. A __computer program__ is also called a __computer software__, which can range from  two lines to millions of lines of instructions.

8. An __algorithm__ is a step by step procedure to resolve a problem. It's an effective method expressed a finte set of well-defined instructions.
9. __Source Code__ is a code written in a particular programming language.
10. __Bytecode__ is a program that has been _compiled_ from a _source code_ into low-level code designed for a software __interpreter. It may be executed by a virtual machine (e.g., Java Virtual Machine) or further compiled into machine code, which is recognized by the processor. 
    - _Remark:_ __Bytecode__ is similar to __assembly language__ in that it is not a high-level language, but it is still somewhat readable, unlike __machine language__. Both may be considered "intermediate languages" that fall between source code and machine code. The primary difference between the two is that __bytecode__ is generated for a virtual machine (software), while __assembly language__ is created for a CPU (hardware).
11. __Translators__ are responsible for converting the __source code__ to a machine language (__binary__). __Translators__ can be any of:

    - __Interpreters__: processes the source code line by line and runs every line in the final program or app. Interpreted source code start running until it encounters an error. Then the interpreter stops to report such an error. _Python_ is a good example of an _interpreted programming language_
    - __Compilers__: convert the __source code__ in its entirety via a compilation process to binary. The __binary__ is then executed. If there were errors in the __source code__, they are detected during the compilation time and flagged. This interrupts the compilation process, and no binary is generated.

    - __Hybrid Translators__: combination of the __interpreter__ and __compiler__. A popular hybrid programming language is __Java__ which first compiles the source code to an intermediate format known as __Bytecode__. The __bytecode__ is then interpreted and executed by a runtime engine (also known an a __virtual machine__). This enables the __hybrid translators__ to run the __bytecode__ on various operating systems.

    - __Assemblers__: for translating low-level Assembly language to __binary__

12. __Common bugs__
    - __Syntactic Errors__: caused when one breaks the expected form or structure of the language.
    - __Semantic Errors (Logical Errors)__: the program fails to produce the desired output.
    - __Run - time Errors__: Unlike __semantic errors__, this type of error interrupt the program ad prevents it from executig further - they are usually  caused by unexpected result of some computation within the source code. e.g.,
        - ZeroDivisionError
        - StackOverflowError
        - IndexOutofBoundError
13. __Microservices__: generally meant to describe an approach to __software development__ that involves de-composing application functionality into individual components that can be deployed separately from each other, and typically communicate via __application programming interfaces__ or __APIs__. Common __characteristics of microservices__ include:
    - Support HTTP/REST protocols
    - Implement JSON or XML format for data exchange
    - Deployed via a containerization framework, such as Docker
    - Dynamically scaled on public or private cloud infrastructure
    - Often use noSQL or microSQL or key value stores to persist data

    __Benefits of a microservices__ architecture may include: 
    - Improved resilience and fault tolerance due to service function isolation
    - Improved scalability with the ability to individually scale services as needed
    - Extreme reusability with standardized interface definitions
    - Easier polyglot support since separate services can be built in different programming languages
    - Easier migration since services can be re-architected or re-built with different technologies while supporting the same API definition to minimize disruption

    The opposite of a __microservices__ approach would be a “__monolithic__” application where all functionality is part of a single program running in a single environment. __Problem in monolithic application__:
    - There is a team of developers working on the application : Modules dependency & every developer needs to understand each & every modules.
    - We need that new team members must quickly become productive
    - The application must be easy to understand and modify
    - We want to practice continuous deployment of the application
    - We must run multiple instances of the application on multiple machines in order to satisfy scalability and availability requirements
    - We not able to take advantage of emerging technologies (frameworks, programming languages, etc)



16. __Software Development Methodologies__
    - __Waterfall Development__: You figure out everything you need to do and document them (requirements). Like a _waterfall_, there's no way to go back up unless you start over again. You move on to the next phase when current phase is completed.
    
    - __Agile Development__: In __Agile Development__, you figure out some of the things you need to do at the beginning. Then continously improve, evolve, collaborate and adapt as the development goes on. Some of the popular implementations of __Agile Development__ methodology include:
        - Scrum
        - Extreme Programming
        - Kanban

17. __Object Oriented Programming__
__OOP__ is a programming technique that centers around thinking of code as __objects(entities)__ with _identities_, _attributes_, and _behaviours_. i.e., an ___object__ has a _name_, aa defined set of _attributes/characteristics_, and _behaviours_ or _actions_ the __object__ can perform.

In classical coding, __objects__ are instances of __classes__ and a ___class__ is the _blueprint that contains all attributes and behaviours of an object_.

__Example__:
an __object__ can be a dog. And, naturally, a dog has a _name_, _colour_ of its fur, and _breed_. These are __attributes__ of the dog. It's also a living creature, so it can _run_, _bark_, _sleep_, e.t.c., We can call these the __behaviours__ or __actiona__ that can be performed by a dog.

In programming, __attributes__ are used by _assigning variables in the class_ while __behaviours__ are _functions/methods (block of code used to perform a particular task) written in the same class_.

# Inheritance and Polymorphism
__Inheritance__ allows objects to derive _attributes_ and _functionality_ from other objects, creating a hierarchy moving from more general objects to more specific. For example, a Car and a Boat are both specific types of Vehicles. Objects can inherit their behavior from a single parent object or multiple parent objects, and are referred to as __child objects__ when they do.

__Polymorphism__ allows two or more objects to behave like one another, which allows them to be used interchangeably. For example, if a method or function knows how to paint a Vehicle object, then it can also paint a Car or Boat object, since they inherit their data and behavior from the Vehicle.


# Concurrency vs Parallelism
__Concurrency__ is when multiple instructions execute at the same time(concurrently). __Concurrency__ is the ability to run multiple tasks on the CPU at the same time. Tasks can start, run, and complete in overlapping time periods. In the case of a single CPU, multiple tasks are run with the help of context switching, where the state of a process is stored so that it can be called and executed later.

__Parallelism__, meanwhile, is the ability to run multiple tasks at the same time across multiple CPU cores.

Though they can increase the speed of your application, concurrency and parallelism should not be used everywhere. The use case depends on whether the task is __CPU-bound__ or __IO-bound__.

Tasks that are limited by the CPU are CPU-bound. For example, mathematical computations are CPU-bound since computational power increases as the number of computer processors increases. __Parallelism__ is for __CPU-bound__ tasks. In theory, If a task is divided into n-subtasks, each of these n-tasks can run in parallel to effectively reduce the time to 1/n of the original non-parallel task. __Concurrency__ is preferred for __IO-bound__ tasks, as you can do something else while the IO resources are being fetched.

The best example of __CPU-bound__ tasks is in _data science_. Data Scientists deal with huge chunks of data. For data preprocessing, they can split the data into multiple batches and run them in parallel, effectively decreasing the total time to process. Increasing the number of cores results in faster processing.

_Web scraping_ is __IO-bound__. Because the task has little effect on the CPU since most of the time is spent on reading from and writing to the network. Other common __IO-bound__ tasks include _database calls_ and _reading_ and _writing files to disk_. Web applications, like _Django_ and _Flask_, are __IO-bound__ applications.

## Situations for Concurrency
1. __Multiple Threads__
    - multiple threads executing within a single process
    - Example_: Multi-threaded .NET application accessing a shared collection

2. __Multiple Processes__
    - Several processes executing on a single computer system
    - _Example_: Multiple applications accessing a common file

3. __Multiple Systems__
    - Several systems, each accessing a common resource
    - _Example_: Multiple processes accessing a common database table.



# 8. The Big O Notation
An algorithm’s performance depends on the number of steps it takes. Computer Scientists have borrowed the term ‘__Big-O Notation__’ from the world of mathematics to accurately describe an _algorithm’s efficiency_. __Big O Naotation__ helps to analyze the __scalabiity__ and __efficiency__ of algorithms.
## 8.1 Time Complexity
Instead of focusing on units of time, __Big-O__ puts the _number of steps_ in the spotlight. The hardware factor is taken out of the equation. Therefore we are not talking about _run time_, but about _time complexity_.

## 8.2 Big-O Definition
An algorithm’s __Big-O notation__ is determined by how it responds to different sizes of a given dataset. For instance how it performs when we pass to it 1 element vs 10,000 elements.__O__ stands for __Order Of__, so __O(N)__ is read “__Order of N__” — it is an _approximation of the duration of the algorithm given N input elements_. It answers the question: “How does the number of steps change as the input data elements increase?”

_O(N) describes how many steps an algorithm takes based on the number of elements that it is acted upon._

## 8.3 Best vs Worst Scenario
Starting with a gentle __example__: Given an input array[N], and a value X, our algorithm will search for the value X by traversing the array from the start until the value is found.
Given this 5-element array: [2,1,6,3,8] if we were searching for X=8 the algorithm would need 5 steps to find it, but if we were searching for X=2 it would only take 1 step. So best case scenario is when we look for a value that is in the first cell and worst case scenario is when the value is at the last cell, or not there at all.

The Big-O notation takes a pessimistic approach to performance and refers to the worst case scenario. This is really important when we describe the complexities below, and also when you try to compute the complexity of your own algorithms: _Always think of the worst case scenarios_.

### 8.3.1 O(1) — Constant
__O(1)__ means that the algorithm takes the same number of steps to execute regardless of how much data is passed in. i.e., the __output__ is constant and is not affected bt the __input__.

_Example_:Determine if the i-th element of an array is an odd number.

```py
# Whether we access the 1st or 2nd or millionth item it doesn’t matter… We can access it directly by using the index operator array[i]
import numpy as np
array = np.array([0, 2, 3, 6, 0, 8, 5, 5, 2])
def isNthElementOdd(array, n):
    return bool(array[n] % 2)
isOdd = isNthElementOdd(array, 2)
print(isOdd) # Output: True
```
If we were to represent the number of steps (y-axis) vs the number of input elements (x-axis), O(1) is a perfect horizontal line, since the number of steps in the algorithm remains constant no matter how much data there is. This is why it is called __constant time__.

### 8.3.2 O(N) — Linear
An algorithm that is __O(N)__ will take as many steps as there are elements of data. So when an array increases in size by one element, an __O(N) algorithm__ will increase by one step. i.e., the __output__ is directly proportional to the __input__.

_Exampl_: Traverse an array and print each element.
```py
# Here, we need to access all the elements one by one, so the calculation time increases at the same pace as the input.
import numpy as np
array = np.array([0, 2, 3, 6, 0, 8, 5, 5, 2])
def displayAllItems(array):
    for i in array:
        print(i, end = ' ')
dsiplayAllItems(array)
```
__O(N)__ is a perfect _diagonal line_, as for every additional piece of data, the algorithm takes one additional step. This is why it is also referred to as __linear time__.

### 8.3.3 O(N²) — Quadratic
__O(N²)__ represents the _complexity of an algorithm_, whose performance is proportional to the square of the size of the input elements. It is generally quite slow: If the input array has 1 element it will do 1 operation, if it has 10 elements it will do 100 operations, and so on.

_Example_: Find duplicates in an array

```py
# This is a ‘naive’ implementation, but it traverses the array twice:
import numpy as np
array = np.array([0, 2, 3, 6, 0, 8, 5, 5, 2])
def containsDuplicates(array):
    for i, outter_element in enumerate(array):
        for j, inner_element in enumerate(array):
            if (i == j):
                continue
            if (outter_element == inner_element):
                return True
    return False
duplicates = containsDuplicates(array)
print(duplicates)
```
Adding more nested iterations through the input will increase the algorithm’s complexity: e.g. if the number of iterations is 3 then its complexity will be O(N³) and so forth. Usually, we want to stay away from polynomial running times (quadratic, cubic, Nˣ, etc).

The O(N²) line is a sharp curve

### 8.3.4 O(logN) — Logarithmic
Simply put, __O(logN)__ describes an algorithm that its number of operations increases by one each time the data is doubled.

__Recall__: 
You may not remember what logarithms are, but you probably know what exponents are:
* 2³ = 2 * 2 * 2 = 8 — Here we multiply the number 2, 3 times.
* Logarithms are the flips of exponents.
* log₂8 answers the question: how many 2s do we multiply together to get 8? The answer is 3.
* In other words, if we keep dividing 8 by 2 until we end up to 1, how many 2s do we have in our equation?
*  8 / 2 / 2 / 2 = 1. The answer is 3 again.

_Example_: Logarithmic time complexities usually apply to algorithms that divide problems in half every time: e.g., Dictionary lookup (aka binary search)
1. Open the dictionary in the middle and check the first word.
2. If our word is alphabetically more significant, look in the right half, else look in the left half.
3. Divide the remainder in half again, and repeat steps 2 and 3 until we find our word.
```py
sortedArray = ['bash', 'c', 'go', 'java', 'javascript', 'python', 'ruby', 'sq;']
def binarySearch(array, element):
    first = 0
    last = len(array) - 1
    index = -1

    while (first <= last) and (index == -1):
        mid = (first + last) // 2
        if array[mid] == element:
            return True
        elif element < array[mid]:
            last = mid -1
        else:
            first = mid + 1
        return False
found = binarySearch(sortedArray, 'python')
print(found)
```
We can only pick one possibility per iteration, and our pool of possible matches gets divided by two in each iteration. This makes the time complexity of binary search O(logN). The number of steps barely increase, as the input grows (i.e. it takes just one additional step each time the data doubles):

### 8.3.5 O(N logN) — Log-linear
An algorithm of this complexity class is doing __log(N)__ work N times and therefore its performance is slightly worse than O(N). Many practical algorithms belong in this category (from _sorting_, to _pathfinding_, to _compression_), so we are mentioning it for completeness.

##### 8.3.5.1 Example_: Merge Sort 
* it is a ‘__Divide and Conquer__’ algorithm: it divides the input array in two halves, calls itself for each one and then merges the two sorted halves.
* __Scalability__: Average.

### 8.3.6 O(2ᴺ) — Exponential
__Exponential growth__ means that the algorithm takes twice as long for every new element added.
##### 8.3.6.1 Example_: 
* Find all subsets in a dataset.
* _Scalability_: Poor.

### 8.3.7 O(N!) — Factorial
This class of algorithms has a run time proportional to the factorial of the input size: n! = n * (n-1) * (n-2) * (n-3) * . . . * 1.

##### 8.3.7.1 Example_: 
* Find all different permutations in a dataset.
* _Scalability_: Very Poor.

#### 8.5 Growth Hierarchy
The Big-O notation offers a consistent mechanism to compare any two algorithms and hence help us make our code faster and more scalable. Putting all of the complexities in a single graph, we can observe in a visual manner how they compare in terms of performance:

![Visualiaztion](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/blob/master/Images_and_Visualizations_for_Illustrations/big_o_notation.png)

#### 8.6 Conclusion
* Algorithm speed is not measured in seconds but in terms of growth
* The Big-O Notation tells us how an algorithm scales against changes in the input dataset size
* O stands for Order Of — as such the Big-O Notation is approximate
* Algorithm running times grow at different rates:

>> __O(1) < O(logN) < O(N) < O(N logN) < O(N²) < O(2ᴺ) < O(N!)__


[Reference](https://towardsdatascience.com/the-big-o-notation-d35d52f38134)

# 9. Recursion
In its simplest form, __recursion__ is when a _function calls itself from within its own code_.

There are a few crucial things to keep in mind when it comes to recursion. For one, a __recursive function__ must actually terminate and return at some point. This is called the __breaking condition__. This prevents infinite loops from happening and the program from crashing so that the computer does not run out of memory trying to keep track of all the function calls.

Each time the function is called, the values of the arguments of the previous calls are stored aside instead of being overwritten by the new call. This is accomplished by what is called a “__call stack__” which, as the name suggests, is implemented through the __stack__ data structure.

## 9.1 Example1: Building a Countdown Function
```py
def countdown(x):
    if x == 0:
        print('countdown completed')
    else:
        print(x)
        countdown(x -1)
print(countdown(3))
```
Notice that as long as the breaking condition is not satisfied, the function keeps executing the else statement which prints the number and calls the function itself again for the number minus one. It’s only until call 4 that the breaking condition is satisfied and the function returns. Always keep in mind that the values of previous calls are stored aside and not overridden by the values of new calls.

## 9.2 Example2: Building the Power Function
Recall that raising a number a to the power b means multiplying a by itself b-times. The special case for the power function is that anything to the power zero is equal to one. When building mathematical functions, it is always a good idea to think of special cases. These usually end up being the breaking condition for your recursion.

```py
## Example2 - Power Function
def power(a, b):
    # taking care of special cases first
    if b == 0:
        return 1
    else:
        return a * power(a, b-1)
power(2,10) #output: 1024
```
## 9.3 Example3: Building the Factorial Function
```py
# Factorial Function
def factorial(num):
    # taking care of special cases first
    if (num == 0):
        return 1
    else:
        return num * factorial(num-1)
```
Note that this makes a lot of sense since we can always rewrite n! as n(n-1)!


# References

1. [LocalHost](https://whatismyipaddress.com/localhost)
2. [Payload](https://techterms.com/definition/payload)
3. [IP Address](https://whatismyipaddress.com/ip-address)
4. [HTTPs](https://realpython.com/python-https/)
4. [Concurrency vs Parallelism](https://testdriven.io/blog/python-concurrency-parallelism/)