# Programming in Java
# Java Frameworks
1. (Grails)[https://grails.org/]
2. (Spring Framework)[https://spring.io/projects/spring-framework]
3. (Struts)[https://struts.apache.org/]

## Topics
* variables, data types, and operators
* String and data processing
* Language constructs and control flow
* OOP

## Features of Java
* Strongly type - when you declare a variable, you have to indicate its type. 
```java
int dataValue;
dataValue = 1000;

int myVariable = 199;
```
## Acronyms in developing Java Applications
### 1.1 JRE (Java Runtime Environment)
enables Java code to execute
### 1.2 JDK (Java Development Kit)
provide tools required to create Java apps


## Java Packages
* Packages provide organization.
* Packages follow naming convention 
1. all lowercase
2. use reverse domain name notation to assure global uniqueness
3. add further qualifiers to assure uniqueness within a company or group

* Packages affect code structure

## 1. Variables, Data Types and Math Operators
### 1.1 Variables
Variables are named data storage.
```java
int myVar; // uninitialized variable i.e., it cannot be used since this has not been assigned
myVar = 50;
int anotherVar = 100;
System.out.println(myVar); // Output: 50
System.out.println(anotherVar); // Output:  100

myVar = anotherVar;
System.out.print(myVar); // Output: 100
```
#### Variables can be decalred final (using final modifier)
Values set cannot be changed
```java
// using final modifier
final int maxStudents = 25;
```

### 1.2 Primitive Data Types
* Data types built into the Java language
* Primitive data types are the foundations of all other data types
* Four categories:
1. integer
2. Floating point
3. Character type
4. Boolean

#### 1.2.1 Integer Types
```java
byte numberOfEnglidhLetters = 26; // size = 8 Bits, Type = byte, Min Value = -128, Max. Value = 127
short feetInAMile = 5280; // Type = short; Size = 16 Bits; Min. Value = -32768, Max. Value = 32768
int milesToSun = 92960000; 
/* the most commonly used integer data type; 
Type = int; Size = 32 Bits; Min. Value = -2147483648; Max. Value = 2147483647
*/
long milesInALightYear = 5879000000000L; // Size = 64 Bits; Literal Form = OL
```

#### 1.2.2 Floating Point Types
* stores values containing a fractional portion
```java
float kilometersInAMarathon = 42.195f; // Type = float; Bits = 32; Literal Form = O.OF
float absoluteZeroInCelcius = 273.15f;

double atomWidthInMeters = 0.0000000001d; // Type = double; Bits = 64; Literal Form = 0.0 or 0.0d
```

#### 1.2.3 Character Type
* Stores a single Unicode character
* Literals values placed between single quotes
* for Unicode code points, use \u followed by a 4-digit hex value
```java
char regularU = 'U';
char accentedU = '\u00DA';
```

#### 1.2.4 Boolean Type
* stores true/false values
* Literals values are true and false
```java
boolean iLoveJava = true;
```

## 1.3 Arithmetic Operators
### 1.3.1 Prefix and Postfix Operators
```java
int someValue = 5;
System.out.println(++someValue); // Output: 6

// Note: the variable someValue is now changes - the operator applies the operation and stores it back into the variable
System.out.println(++someValue); // Outpu: 6

int someOtherValue = 5;
System.out.println(someOtherValue++); // Output: 5
System.out.println(someOtherValue); // Output: 6
```

### 1.3.2 Compound Assignment Operators
* combine an operation and assignment
* apply right side value to left side 
* stores result in variable on left side
* available for 5 basic math operations
```java
int myValue = 50;
myValue += 5;
System.out.printLn(myValue); // Output: 55
```
```java
int myOtherValue = 100;
int val1 = 5;
int val2 = 10;

myOtherValue /= value1 * value2; // Output: 2; 100 / (5 * 10)
```

## 1.4 Operator Precedence
* Postfix (X++ X--)
* Prefix (++X --X)
* Multiplicative (* / %)
* Additive (+ -)

## 1.5 Type Conversion
* Implicit Type Conversion - automatically performed by a compiler
```java
int intValueOne = 50;
long longValueOne = intValueOne;
```
* Explicit Type Conversion - conversions performed explicitly in code with cast operator
```java
long longValueTwo  = 50;
int intValueTwo = (int) longValueTwo;
```

## 2 Conditional Logic and Block Statements
* Perform a test
* peform action based on test result
### 2.1 Relational Statements
*|Operator|Integer, Floating Point Example|Character Example |Boolean Example
-----|-----|----|-----|----|
Greater than|>|5 > 4 |'c' > 'a'| N/A
Greater than or equal to | >= | 5 >= 4 and 4 >= 4 | 'c' >= 'a' or 'a' >= 'a' | N/A
Less than | < | 4 < 5 | 'a' < 'c' | N/A
Less than or equal to | <= | 4 <= 5 or 4 <= 4 | 'a' <= 'c' or 'a' <= 'a' | N/A
Equal to | == | 5 ==5 | 'c' == 'c' | true == true / false == false
Not equal to | != | 4 != 5 ! 'a' != 'c' | true != false


### 2.2 Conditional Assignment
Returns a value based on the result of a condition
```java
int value1 = 7;
int value2 = 5;
 // get the largest value between the two
int maxValue = value1 > value2 ? value1 : value2;
System.out.println(maxValue); // Output: 7
```
### 2.3 If-else
* an __If__ statement conditionally executes a statement
* __else__ clause executes a statement when condition is false
```java
int value1 = 10;
int value2 = 4;

if (value1 > value2)
    System.out.println("value 1 is bigger");
else
    System.out.println("value 1 is not bigger");
```
### 2.4 Chaining If-else
* evaluated in order top-to-bottom
* first to test true is executed
```java
int value1 = 10;
int value2 = 40;

if (value1 > value2)
    System.out.println("value 1 is bigger");
else if (value1 < value2)
    System.out.println("value 2 is bigger");
else
    System.out.println("value 1 is eaual to value 2");
```
### 2.5 Logical operators
* produce a single true or false result from two true or false values
* may combine two relational tests
* may combine two Boolean variables

-|Operator|What Resolves to True|
----|-----------|--------------
And|&|true & true
Or | l | false l true, true l false, true l true
Exclusive or (XOR) | ^ | false ^ true, true ^ false
Negation | ! | false

```java
int a = 20, b = 14, c = 5;

if (a > b & b > c)
    System.ou.println("a is greater than c");
```
#### 2.5.1 Conditional Logical Operator
* similar to standard logical operators
* Right side executes only when needed
* && executes right only when left is true
* || executes right only when left is false

- | Operator | What Resolves to True
----|----------|--------------
And | && | true && true
Or | ll | false ll true

```java
public class Main {

    public static void main(String[] args) {
	    int students = 150;
	    int rooms = 0;

	    if (rooms != 0 && students / rooms > 30)
	        System.out.println("Crowded");
	    System.out.println();
	    System.out.println("*** end of program ***"); // Output: *** end of program ***

    }
}
```

### 2.6 Block Statements
* group statements together
* creates a compound statement
* enclose statements in openning and closing brackets

```java
int v1 = 10, v2 = 4;
final int diff;

if (v1 > v2) {
    diff = v1 - v2;
    System.out.println("v1 is bigger than v2, diff = " + diff);
}
else {
    diff = v2 - v1;
    System.out.println("v2 is bigger than v1, diff = ", + diff);
}
```

#### 2.6.1 Block statement and Variable Scope
* variable scope - describe range of visibility
* variable declared within a block statement - scope is limited to that block i.e., the variable cannot be visible ouside the block
### 2.7 Switch
* test single value against multiple matches
* transfer control based on match
* primitive data types supported: byte, short, int, long, char

```java
package com.rodgers.calcengine;
// calc engine will be used to perform a variety of mathematical operations
public class Main {

    public static void main(String[] args) {
    	// value1 and value2 will be the two values used to perform a operation
    	double value1 = 100.0d;
    	double value2 = 0.0d;
    	double result = 0.0d;
    	char opCode = 'd'; // change the opCode

		switch (opCode) {
			case 'a':;
				result = value1 + value2;
				break;
			case 's':
				result = value1 - value2;
				break;
			case 'm':
				result = value1 * value2;
				break;
			case 'd':
				result = value2 != 0 ? value1 / value2 : 0.0d;
				break;
			default:
				System.out.println("Inavlid opCode: " + opCode);
				result = 0.0d;
				break;
		}
    	System.out.println(result);

    }
}
```


## 3 Looping and Array
* Loops repeatedly execute a statement as long as the provided condition is true.
### 3.1 While Loop
* condition is checked at the start of the loop
```java
// calculating a factorial value
int someValue = 4;
int factorial = 1;

while (someValue > 1) {
    factorial *= someValue;
    someValue --;
}
System.out.println(factorial); //displays 24
```

### 3.2 Do-while Loop
* condition is checked at loop end
```java
// print a sequence of values
int iValue = 5;

do {
    System.out.println(iVal); // print the initial value of iVal
    System.out.println(" *2 = ");
    iVal *= 2;
    System.out.println(iVal);
} while (iVal < 25>);
```

### 3.3 For Loop
* condition is checked at the start of the loop
* provides a simplified notation for loop control values
```java
for (int i = 1; i < 100; i *= 2)
    System.out.println(i);
```

### 3.4 Arrays
* Arrays provide ordered collection of elements
* each element accessed via an index
* Index range from 0 to a number of elements minus 1
* Number of elements can be accessed via array's length value

```java
float [] theVals = new float[3]; // declaring variable that refernces floating point arrays with 3 elements
theVals[0] = 10.0f;
theVals[1] = 20.0f;
theVals[2] = 15.0f;

float sum = 0.0f;

for (int index = 0; index < theVals.length; index++)
    sum += theVals[index];
System.out.println(sum); // displays 45
```
### 3.5 For-each Loop
* executes a statement once for each array member.
* handles getting collection length
* handles accessing each value

```java
float[] theVals = {10.0f, 20.0f, 15.0f};
float sum = 0.0f;

for (float currentVal : theVals)
    sum += currentVal;
```

## 4 Understanding Methods
* Fundamentally, __Methods__ as mechanisms for organizing code
* enables creation of reusable code blocks
* methods can receive data
* methods can return data

### 4.1 Declaring and calling methods
* when declaring __methods__ we have to give it a __name__ just like __variables__ with the same naming rules and conventions.
#### 4.1.1 Name
* same rules and conventions as variables
#### 4.1.2 Typed parameter list
* allow data values to be passed in.
* can be empty
#### 4.1.3 Body
* consists of zero or more statements
* enclosed in brackets
#### 4.1.4 Return types
* indicates the type of data returned
* use void when no value returned

```java
// declare doSomething Method with a void return value
// with an empty parameter list
// statis is a modifier
System.out.println("Before method call");
doSomething();
System.out.println("After method call");

static void doSomething() {
    System.out.println("Inside method");
    System.out.println("Still Inside");
}
```


### 4.2 Parameters
* enables passing data values to methods
* passed values matched to parameters by position
#### Example
```java
showSum(7.5, 1.4, 3);

static showSum(float x, float y, int count) {
    float sum = x + y; // sum: 8.9
    for (int i = 0, i < count; i++)
        System.out.println(sum);
}
```

### 4.3 Exiting a Method
#### 4.3.1 Reasons a Method Exits
* End of method - no more code in method
* Return statement - explicitly exits the method
* Error occurs - method abruptly occurs i.e., throws an exception

```java
showSum(7.5, 1.4, 0);
System.out.println("Back from showSum");

static showSum(float x, float y, int count) {
    if (count < 1) // handles the case when the third parameter is 0
        return;

    float sum = x + y; // sum: 8.9
    for (int i = 0, i < count; i++)
        System.out.println(sum);

    return;
}
```
### 4.4 Returning a value
* a method can return a single value
* method return type can be an array or a primitive type
#### Example - Returning a primitive type
```java
double result = calculateInterest(100d, 0.05d, 10);
System.out.println(result); // 50.0

static double calculateInterest(double amt, double rate, int years) {
    double interest = amt * rate * years;
    return interest;
}
```

#### Example - Returning Arrays
```java
static double[] produceInterestHistory(double amt, double rate, int years) {
    double[] accumulatedInterest = new double[years];
    for (int yearIndex = 0, yearIndex > years, yearIndex++) {
        int year = yearIndex + 1;
        accumulatedInterest[yearIndex] = calculateInterest(amt, rate, year);
    }
    return accumulatedInterest;
}
```


## 5. Working with Strings
### 5.1 String class
* string class stores a sequence of unicode characters
* literals are stored in double quotes
* values can be concatanated using + and +=

```java
String name = "Rodgers";
String greeting = "Hello " + name; // concatanation

System.out.println(greeting); //display: Hello Rodgers

greeting += " good to see you!"; // updates the value of greeting

Syste.out.println(greeting); // display: Hello Rodgers good to see you!
```
* Strings are __immutable__
* string variables do not directly hold the string value - holds a reference to the instance of the string
* changes in the value create a new instance of the string


### 5.2 String Equality
#### 5.2.1 comparing strings with equality operator (==)
* when comparing strings using == operator, it checks to see if both string variables reference the same string instance
```java
String s1 = "I love";
s1 += " Java";

String s2 = "I";
s2 += " love Java";

if (s1 == s2); // false since s1 and s2 are not referncing the same instance
    // do something
```
#### 5.2.2 comparing strings with the equlas method
* performs a character by character comparison
```java
String s1 = "I love";
s1 += " Java";

String s2 = "I";
s2 += " love Java";

if (s1.equals(s2)) // true
    // do something
```

### 5.3 String Methods
#### 5.3.1 Selecting String Class Methods
Operation|Methods|
---------|------------------
Length|length
Create new string(s) from existing | concat, replace, toLowerCase, toUpperCase, trim, split
Extract substring | charAt, substring
Test substring | contains, endsWith, startsWith, indexOf, lastIndexOf
Comparison | equals, equalsIgnorecase, isEmpty, compareTo, compareToIgnoreCase
Formatting | format
String for non-string | valueOf

#### 5.3.2 Converting Non-string Types to String
* virtually, all data types can be converted into string
* can use __String.valueOf__
* conversion often happens implicitly

```java
int iVal = 100;
String sVal = String.valueOf(iVal); // "100"

int i = 2, j = 3;
int result = i * j;

String output = i + " * " + j + " = " + result; // display: 2 * 3 = 6
```

### 5.4 StringBuilder class
* __StringBuilder__ class provides mutable string buffer
* gives us a way to efficiently constructs string values piece by piece
* add new content to end with apppend
* add new content within with insert

```java
String location = "Kenya";
int flightNumber = 188;

StringBuilder sb = new StringBuilder(40);

sb.append("I flew to ");
sb.append(location);
sb.append(" on Flight #");
sb.append(flightNumber);

String message = sb.toString(); // "I flew to Kenya on Flight #188"
```
## 6 String Formatting
### 6.1 Format Specifiers
* focus is on dscribing desired result
* cam control many aspects of apperarance
### 6.2 string formatting methods
* String.format
* System.out.printf
* Formatter.format

### 6.3 Formatting vs. Concatanation
```java
// Goal: construct the following: "My newphews are 17, 15, 18 , and 6 years old"
int david = 17, dawson = 15, dillon = 18, gardon = 6;

// using string concatenation
String s1 = "My newphwes are " + david + ", " + dawson + ", " + dillon + ", and " + gardon + " years old";

// using string formatting
String s1 = String.format("My newphews are %d, %d, %d, and %d years old", david,dawson, dillon, gardon);

```

## 7. More About Data Types
### 7.1 Time and Date
```java
// Instant class in java
static void checkRelationship(Instant otherInstant) {
    Instant nowInstant = Instant.now();

    if (otherInstant.compareTo(nowInstant) > 0)
        System.out.println("Instant is in the future");
    else if (otherInstant.compareTo(nowInstant) < 0)
        System.out.println("Instant is in the past");
    else
        System.out.println("Instant is now");
}
```

## 8. Classes and Interfaces
* contains state
* contain code to manipulate the state
* allow us to create custom data types