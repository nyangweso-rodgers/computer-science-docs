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
5. [References]()
    - [Reference](https://towardsdatascience.com/the-big-o-notation-d35d52f38134)
    - [Big O, code efficiency analysis](https://dev.to/kerosz/big-o-code-efficiency-analysis-phk)

# Code Analysis
We can measure an algorithm complexity by:
1. time(_duration_)
2. space(_memory_)
# Introduction to Time Complexity
Instead of focusing on units of time, __Big-O__ puts the _number of steps_ in the spotlight. The hardware factor is taken out of the equation. Therefore we are not talking about _run time_, but about _time complexity_.

# Asymptotic Notations
__Asymptotic notations__ are mathematical tools used to represent the __complexities of algorithms__. There are three notations that are commonly used:
1. __Big Omega (Ω) Notation__, gives a lower bound of an algorithm (best case)
2. __Big Theta (Θ) Notation__, gives an exact bound of an algorithm (average case)
3. __Big Oh (O) Notation__, gives an upper bound of an algorithm (worst case)

_Remark_: _Sometimes is useful to look at the __average case__ to give you a rough sense of how the algorithm will perform in the long run, but when we talk about __code analysis__ we usually talk about worst case, because it usually defines the bottleneck we are after._

# Introduction to Big O Notation
An algorithm’s performance depends on the number of steps it takes. Computer Scientists have borrowed the term ‘__Big-O Notation__’ from the world of mathematics to accurately describe an _algorithm’s efficiency_. __Big O Naotation__ helps to analyze the __scalabiity__ and __efficiency__ of algorithms.

An algorithm’s __Big-O notation__ is determined by how it responds to different sizes of a given dataset. For instance how it performs when we pass to it 1 element vs 10,000 elements.__O__ stands for __Order Of__, so __O(N)__ is read “__Order of N__” — it is an _approximation of the duration of the algorithm given N input elements_. It answers the question: “How does the number of steps change as the input data elements increase?”

__Remark:__ 
* _O(N) describes how many steps an algorithm takes based on the number of elements that it is acted upon._

# Best vs Worst Scenario
Starting with a gentle __example__: 
* Given an input array[N], and a value X, our algorithm will search for the value X by traversing the array from the start until the value is found.
* Given this 5-element array: [2,1,6,3,8] if we were searching for X=8 the algorithm would need 5 steps to find it, but if we were searching for X=2 it would only take 1 step. So __best case scenario__ is when we look for a value that is in the first cell and __worst case scenario__ is when the value is at the last cell, or not there at all.
* The __Big-O notation__ takes a pessimistic approach to performance and refers to the worst case scenario. This is really important when we describe the complexities below, and also when you try to compute the complexity of your own algorithms: _Always think of the worst case scenarios_.

# Growth Hierarchy
The Big-O notation offers a consistent mechanism to compare any two algorithms and hence help us make our code faster and more scalable. Putting all of the complexities in a single graph, we can observe in a visual manner how they compare in terms of performance:

![Visualiaztion](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/blob/master/Images_and_Visualizations_for_Illustrations/big_o_notation.png)

_Remarks_:
* Algorithm speed is not measured in seconds but in terms of growth
* The Big-O Notation tells us how an algorithm scales against changes in the input dataset size
* O stands for Order Of — as such the Big-O Notation is approximate
* Algorithm running times grow at different rates:
* _O(1) < O(logN) < O(N) < O(N logN) < O(N²) < O(2ᴺ) < O(N!)_

# O(1): Constant
* __O(1)__ means that the algorithm takes the same number of steps to execute regardless of how much data is passed in. 
* i.e., the __output__ is constant and is not affected by the __input__.
* If we were to represent the number of steps (y-axis) vs the number of input elements (x-axis), __O(1)__ is a perfect __horizontal line__, 
* since the number of steps in the algorithm remains constant no matter how much data there is. This is why it is called __constant time__.

# O(N): Linear
* An algorithm that is __O(N)__ will take as many steps as there are elements of data. 
* So when an array increases in size by one element, an __O(N) algorithm__ will increase by one step. 
* i.e., the __output__ is directly proportional to the __input__.
* __O(N)__ is a perfect _diagonal line_, as for every additional piece of data, the algorithm takes one additional step. This is why it is also referred to as __linear time__.
* _Example include_: Traverse an array and print each element.

# O(N²):  Quadratic
* __O(N²)__ represents the _complexity of an algorithm_, whose performance is proportional to the square of the size of the input elements. 
* It is generally quite slow: If the input array has 1 element it will do 1 operation, if it has 10 elements it will do 100 operations, and so on.
* Adding more nested iterations through the input will increase the algorithm’s complexity: 
* e.g. if the number of iterations is 3 then its complexity will be O(N³) and so forth. Usually, we want to stay away from polynomial running times (quadratic, cubic, Nˣ, etc).
* The O(N²) line is a sharp curve
* _Examples include_: Find duplicates in an array

# O(logN): Logarithmic
* Simply put, __O(logN)__ describes an algorithm that its number of operations increases by one each time the data is doubled.
* _Recall_: 2³ = 2 * 2 * 2 = 8 — Here we multiply the number 2, 3 times.
* Logarithms are the flips of exponents.
* log₂8 answers the question: how many 2s do we multiply together to get 8? The answer is 3. i.e., if we keep dividing 8 by 2 until we end up to 1, how many 2s do we have in our equation?
* Logarithmic time complexities usually apply to algorithms that divide problems in half every time: 
* _Example include_ Dictionary lookup (aka binary search) which involves:
* Open the dictionary in the middle and check the first word.If our word is alphabetically more significant, look in the right half, else look in the left half.
* Divide the remainder in half again, and repeat until we find our word.
* We can only pick one possibility per iteration, and our pool of possible matches gets divided by two in each iteration. This makes the time complexity of binary search O(logN). The number of steps barely increase, as the input grows (i.e. it takes just one additional step each time the data doubles):

# O(N logN): Log-linear
* An algorithm of this complexity class is doing __log(N)__ work N times and therefore its performance is slightly worse than O(N). 
* Many practical algorithms belong in this category (from _sorting_, to _pathfinding_, to _compression_), so we are mentioning it for completeness. 
* _Example_: is a __Merge Sort__ it is a ‘__Divide and Conquer__’ algorithm: it divides the input array in two halves, calls itself for each one and then merges the two sorted halves. its __Scalability__ is Average.

# O(2ᴺ): Exponential
* _Exponential growth_ means that the algorithm takes twice as long for every new element added.
* _Example include_: Find all subsets in a dataset.
* _Scalability_: Poor.

# O(N!): Factorial
* This class of algorithms has a run time proportional to the factorial of the input size: n! = n * (n-1) * (n-2) * (n-3) * . . . * 1.
* _Example include_: Find all different permutations in a dataset.
* _Scalability_: Very Poor.