# Big O Notation
## Table of Contents
1. [Code Analysis](#Code-Analysis)
    - [Introduction to Time Complexity](#Introduction-to-Time-Complexity)
    - [Asymptotic Notations](#Asymptotic-Notations)
2. [Introduction to Big O Notation](#Introduction-to-Big-O-Notation)
3. [Growth Hierarchy](#Growth-Hierarchy)
4. [Best vs Worst Scenario](#Best-vs-Worst-Scenario)
    - [O(1): Constant]()
    - [O(N): Linear]()
    - [O(N²):  Quadratic]()
    - [O(logN): Logarithmic]()
    - [O(N logN): Log-linear]()
    - [O(2ᴺ): Exponential]()
    - [O(N!): Factorial]()

# Code Analysis
* We can measure an algorithm complexity by:
    1. time(_duration_)
    2. space(_memory_)
# Introduction to Time Complexity
* Instead of focusing on units of time, __Big-O__ puts the _number of steps_ in the spotlight. The hardware factor is taken out of the equation. Therefore we are not talking about _run time_, but about _time complexity_.

# Asymptotic Notations
* __Asymptotic notations__ are mathematical tools used to represent the __complexities of algorithms__. There are three notations that are commonly used:
    1. __Big Omega (Ω) Notation__, gives a lower bound of an algorithm (best case)

    2. __Big Theta (Θ) Notation__, gives an exact bound of an algorithm (average case)

    3. __Big Oh (O) Notation__, gives an upper bound of an algorithm (worst case)

* _Remark_: 
    * _Sometimes is useful to look at the __average case__ to give you a rough sense of how the algorithm will perform in the long run, but when we talk about __code analysis__ we usually talk about worst case, because it usually defines the bottleneck we are after._

# Introduction to Big O Notation
* An algorithm’s performance depends on the number of steps it takes. Computer Scientists have borrowed the term ‘__Big-O Notation__’ from the world of mathematics to accurately describe an _algorithm’s efficiency_. __Big O Naotation__ helps to analyze the __scalabiity__ and __efficiency__ of algorithms.

* An algorithm’s __Big-O notation__ is determined by how it responds to different sizes of a given dataset. For instance how it performs when we pass to it 1 element vs 10,000 elements.__O__ stands for __Order Of__, so __O(N)__ is read “__Order of N__” — it is an _approximation of the duration of the algorithm given N input elements_. It answers the question: “How does the number of steps change as the input data elements increase?”

* __Remark:__ 
    * _O(N) describes how many steps an algorithm takes based on the number of elements that it is acted upon._

# Best vs Worst Scenario
* Starting with a gentle __example__: 
    * Given an input array[N], and a value X, our algorithm will search for the value X by traversing the array from the start until the value is found.

    * Given this 5-element array: [2,1,6,3,8] if we were searching for X=8 the algorithm would need 5 steps to find it, but if we were searching for X=2 it would only take 1 step. So __best case scenario__ is when we look for a value that is in the first cell and __worst case scenario__ is when the value is at the last cell, or not there at all.
    
    * The __Big-O notation__ takes a pessimistic approach to performance and refers to the worst case scenario. This is really important when we describe the complexities below, and also when you try to compute the complexity of your own algorithms: _Always think of the worst case scenarios_.

# Growth Hierarchy
* The Big-O notation offers a consistent mechanism to compare any two algorithms and hence help us make our code faster and more scalable. Putting all of the complexities in a single graph, we can observe in a visual manner how they compare in terms of performance:

* ![Visualiaztion](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/blob/master/Images_and_Visualizations_for_Illustrations/big_o_notation.png)

* _Remarks_:
    * Algorithm speed is not measured in seconds but in terms of growth

    * The Big-O Notation tells us how an algorithm scales against changes in the input dataset size

    * O stands for Order Of — as such the Big-O Notation is approximate

    * Algorithm running times grow at different rates:

    * _O(1) < O(logN) < O(N) < O(N logN) < O(N²) < O(2ᴺ) < O(N!)_