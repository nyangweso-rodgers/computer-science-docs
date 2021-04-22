# Introduction to Computer Science
## Computer Science Concepts (Definition of Terms)
### 1 Payload
When data is sent over the Internet, each unit transmitted includes both header information and the actual data being sent. The header identifies the source and destination of the packet, while the actual data is referred to as the __payload__. Because header information, or overhead data, is only used in the transmission process, it is stripped from the packet when it reaches its destination. Therefore, the __payload__ is the only data received by the destination system.

#### References
_https://techterms.com/definition/payload_

### 2. Cookies
By example. __cookies__ are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_.

#### 2.1 Mechanism Behind Cookies
* server asks the browser to store this using a _Set-Cookie_ header.
* browser and server pass this info to and fro as part of request and response headers
* stores a name value pair and attributes like Expires, Domain, Path.
* Cookie in the header when communicating from Browser to server.
* Set-Cookie in the header when communicating from server to browser.
* These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
* It is used by numerous websites to track your online activities

#### 2.2 Types of Cookies
1. Session Cookies
2. Persistent/Permanent Cookies
3. Third Party Cookies

#### 2.3 Cookies vs. Session
__Session__ is a period with all the parameters that suggest you are active on the website. __Cookies__ help in recognising and managing the session.Cookies are primarily used to create session and related info for web application. They get deleted when the session expires. 

_Note_: not all cookies are related wit session, some remain persistent


### 3. IP Addresses
The __IP address__ is a fascinating product of modern computer technology designed to allow one connected computer (or “smart” device) to communicate with another device over the Internet. Because, in the same way you to need a mailing address to recieve a letter in the mail from a friend, a remote computer needs your __IP address__ to communicate with your computer.

#### 3.1 The IPv4 Address.
The common type of __IP address__ (is known as __IPv4__, for “__version 4__”). Here’s an example of what an __IP address__ might look like: __66.171.248.170__

An __IPv4__ address consists of __four numbers__, each of which contains one to three digits, with a single dot (.) separating each number or set of digits. Each of the four numbers can range from 0 to 255. This versatile group of segmented numbers create the addresses that lets you and everyone around the globe to send and retrieve data over our Internet connections. Without this numeric protocol, sending and receiving data over the World Wide Web would be impossible.

#### 3.2 IPv6 (Internet Protocol Version 6)
It’s called __IPv6__ and it offers a maximum number of __IP address__ for today and for the future. Whereas __IPv4__ supports a maximum of approximately 4.3 billion unique IP addresses, __IPv6__ supports, in theory, a maximum number that will never run out. An __IPv6__ address consists of __eight groups__ of four hexadecimal digits. If a group consists of four zeros, the notation can be shortened using a colon to replace the zeros. Here’s an example IPv6 address: __2001:0db8:85a3:0000:0000:8a2e:0370:7334__

__REMARK:__ _Your IP address is your passport to the Internet. But it also gives away your location and is used to profile your individual online activity. That’s why you might consider hiding it._

A main advantage of __IPv6__ is increased address space. The 128-bit length of IPv6 addresses is a significant gain over the 32-bit length of IPv4 addresses, allowing for an almost limitless number of unique IP addresses. The size of the IPv6 address space makes it less vulnerable to malicious activities such as IP scanning. IPv6 packets can support a larger payload than IPv4 packets resulting in increased throughput and transport efficiency.

#### References
__https://whatismyipaddress.com/ip-address_

### 4. Caching
__Caching__ is a common practice in different layers of technology to _improve application performance_. A __cache__ is a high speed data store which stores a part or the complete dataset so that future requests to the data are served faster. The data in a cache is stored on a fast access hardware like __RAM__. Caching allows us to _efficiently reuse previously retrieved data_. 

__Caching__ is leveraged at different layers of technology like:
* Operating systems
* CDN(Content Delivery Network)
* DNS(Domain Name Systems)
* Web Applications(APIs)
* Databases e.t.c.

__Caching__ information includes:
* database query results
* computationally intensive caclculations
* API requests/responses
* data files like HTML, images or
* any application data in general e.t.c

In _distributed applications_ there are various caching _strategies_:
* write-through
* write-around
* write-back

#### 4.1 write-through cache
in this policy, data is written to both the cache and the underlying data source. The order in which it is written is not important. The main idea is that the I/O operation is considered complete when the data is written to both the cache and the DB.

#### 4.2 write-around cache
in this policy, data is directly written to the underlying data source without disturbing the cache.

#### 4.3 write-back cache
in this policy, data is written only to the cache and the I/O operation is considered complete. Typically, data is written  to the underlying data source as well, but it is done asynchronously using a worker process.

#### 4.4 Benefits of caching
1. improves application performance
2. reduced load on servers
3. reduced load on databases
4. eliminates database hotspots
5. increases Read Throughput(IOPS)
6. reduces bandwidth consumption

### 5. LocalHost
__localhost__ refers to “_this computer_” or even more accurately “_the computer I’m working on_.”

#### References
_https://whatismyipaddress.com/localhost_

### 6. Collection Concurrency
__Concurrency__ is when multiple instructions execute at the same time(concurrently)

#### 6.1 Situations for Concurrency
##### 6.1.1 Multiple Threads
* multiple threads executing within a single process
* _Example_: Multi-threaded .NET application accessing a shared collection

##### 6.1.2 Multiple Processes
* Several processes executing on a single computer system
* _Example_: Multiple applications accessing a common file
##### 6.1.3 Multiple Systems
* Several systems, each accessing a common resource
* _Example_: Multiple processes accessing a common database table.

### 7. HTTP(S) (HyperText Transfer Protocol)
Fundamentally, HTTPS is the same protocol as HTTP but with the added implication that the communications are secure.

HTTPS doesn’t rewrite any of the HTTP fundamentals on which it’s built. Instead, HTTPS consists of regular HTTP sent over an encrypted connection. Typically, this encrypted connection is provided by either TLS or SSL, which are cryptographic protocols that encrypt the information before it’s sent over a network.

_Note:_ _TLS and SSL are extremely similar protocols, though SSL is on its way out, with TLS to take its place. It’s enough to know that TLS is the newer, better version of SSL._

Again, HTTPS is just HTTP over TLS or SSL. TLS is designed to provide privacy from eavesdroppers. It can also provide authentication of both the client and the server.
#### 7.1 HTTP Request? 
HTTP requests contain the following elements:
* The __method__ describes what action the client wants to perform. The method for static content is typically __GET__, though there are others available, like __POST__, __HEAD__, and __DELETE__.
* The __path__ indicates to the server what web page you would like to request. For example, /python-https.
* __The version__ is one of several HTTP versions, like 1.0, 1.1, or 2.0. The most common is probably 1.1.
* __The headers__ help describe additional information for the server.
* __The body__ provides the server with information from the client. Though this field is not required, it’s typical for some methods to have a body, like a POST.

These are the tools your browser uses to communicate with a server. The server responds with an HTTP response. The HTTP response contains the following elements:
#### 7.2 HTTP Response
* __The version__ identifies the HTTP version, which will typically be the same as the request’s version.
* __The status code__ indicates whether a request was completed successfully. There are quite a few status codes.
* __The status message__ provides a human-readable message that helps describe the status code.
* __The headers__ allow the server to respond with additional metadata about the request. These are the same concept as request headers.
* __The body__ carries the content. Technically, this is optional, but typically it contains a useful resource.


#### References
_1. https://realpython.com/python-https/_

### 8. The Big O Notation
An algorithm’s performance depends on the number of steps it takes. Computer Scientists have borrowed the term ‘__Big-O Notation__’ from the world of mathematics to accurately describe an _algorithm’s efficiency_. 
#### 8.1 Time Complexity
Instead of focusing on units of time, __Big-O__ puts the _number of steps_ in the spotlight. The hardware factor is taken out of the equation. Therefore we are not talking about _run time_, but about _time complexity_.

#### 8.2 Big-O Definition
An algorithm’s __Big-O notation__ is determined by how it responds to different sizes of a given dataset. For instance how it performs when we pass to it 1 element vs 10,000 elements.__O__ stands for __Order Of__, so __O(N)__ is read “__Order of N__” — it is an _approximation of the duration of the algorithm given N input elements_. It answers the question: “How does the number of steps change as the input data elements increase?”

_O(N) describes how many steps an algorithm takes based on the number of elements that it is acted upon._

#### 8.3 Best vs Worst Scenario
Starting with a gentle __example__: Given an input array[N], and a value X, our algorithm will search for the value X by traversing the array from the start until the value is found.
Given this 5-element array: [2,1,6,3,8] if we were searching for X=8 the algorithm would need 5 steps to find it, but if we were searching for X=2 it would only take 1 step. So best case scenario is when we look for a value that is in the first cell and worst case scenario is when the value is at the last cell, or not there at all.

The Big-O notation takes a pessimistic approach to performance and refers to the worst case scenario. This is really important when we describe the complexities below, and also when you try to compute the complexity of your own algorithms: _Always think of the worst case scenarios_.

#### 8.4.1 O(1) — Constant
__O(1)__ means that the algorithm takes the same number of steps to execute regardless of how much data is passed in.

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

#### 8.4.2 O(N) — Linear
An algorithm that is __O(N)__ will take as many steps as there are elements of data. So when an array increases in size by one element, an __O(N) algorithm__ will increase by one step.

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

#### 8.4.3 O(N²) — Quadratic
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

#### 8.4.4 O(logN) — Logarithmic
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

#### 8.4.5 O(N logN) — Log-linear
An algorithm of this complexity class is doing __log(N)__ work N times and therefore its performance is slightly worse than O(N). Many practical algorithms belong in this category (from _sorting_, to _pathfinding_, to _compression_), so we are mentioning it for completeness.

##### 8.4.5.1 Example_: Merge Sort 
* it is a ‘__Divide and Conquer__’ algorithm: it divides the input array in two halves, calls itself for each one and then merges the two sorted halves.
* __Scalability__: Average.

#### 8.4.6 O(2ᴺ) — Exponential
__Exponential growth__ means that the algorithm takes twice as long for every new element added.
##### 8.4.6.1 Example_: 
* Find all subsets in a dataset.
* _Scalability_: Poor.

#### 8.4.7 O(N!) — Factorial
This class of algorithms has a run time proportional to the factorial of the input size: n! = n * (n-1) * (n-2) * (n-3) * . . . * 1.

##### 8.4.7.1 Example_: 
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


__Reference__:
_1. https://towardsdatascience.com/the-big-o-notation-d35d52f38134_

### 9. Recursion - Programming Technique
In its simplest form, __recursion__ is when a _function calls itself from within its own code_.

There are a few crucial things to keep in mind when it comes to recursion. For one, a __recursive function__ must actually terminate and return at some point. This is called the __breaking condition__. This prevents infinite loops from happening and the program from crashing so that the computer does not run out of memory trying to keep track of all the function calls.

Each time the function is called, the values of the arguments of the previous calls are stored aside instead of being overwritten by the new call. This is accomplished by what is called a “__call stack__” which, as the name suggests, is implemented through the __stack__ data structure.

#### 9.1 Example1: Building a Countdown Function
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

#### 9.2 Example2: Building the Power Function
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
#### 9.3 Example3: Building the Factorial Function
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