/*
Data Types in JavaScript
-- a variable in JS can contain any data type. 
-- a variable can at one moment be a string and at another be a number.
-- programming languages that allow such things are called "dynamically typed"
-- meaning that there are data types, but variables are not bound to any of them.
*/

let message = 'hello!';
message = 123456;
console.log(message)


/*
# 7 Basic Data Types in JavaScript
-- 1. Number: 
-- number type represents both integer and floating point numbers. 
-- there are many operations for numbers, e.g., multiplication (*), division (/), addition (+), subtraction (-) and so on.

-- besides regular numbers, there are so-called "special numeric values" which also belong to this data type:
-- Infinity represents a number whose value is greater than any other number. we can get as a result of division by zero:

--  NaN 
-- NaN represents a computational error. it is a result of an incorrect or undefined mathematical operation, for instance:
-- NaN is sticky and any operation on NaN returns NaN
*/
let n = 35;
let m = 1/0;
let notNumber = 'not a number' / 2;
console.log(n);
console.log(m); // return Infinity
console.log(Infinity); // or just reference it directly
console.log(notNumber); // return NaN

/*
-- Mathematical Operations are safe
-- doing maths is 'safe' in javascript. 
-- we can do anything, divide by zero, treat non-numeric strings as number, e.t.c., 
-- the script will never stop with a fatal error ("die"). at worst, we'll get NaN as a result.
*/


/*

# 2. a String
-- a string in javascript must be surrounded by quotes:
-- double and single quotes are "simple" quotes. there is no difference between them in javascript
-- backsticks are "extended functionality" quotes
-- they allow us to embed variables and expressions into a string by wrapping them in ${...},

*/
let str = 'hello'; // Single Quotes
let str1 = "double quotes are ok too"; // Double Quotes
let phrase = `can embed ${str}`; // Backstick
let name = 'rodgers';
console.log(phrase);
console.log(`nyangweso, ${name}`);  // embed a variable
console.log(`the final result is ${30 * 3000}`); // embed an expression
// please note that this can only be done in backsticks. other quotes don't have this embeded functionality

/*

# REMARK: there is no character type
-- in some languages, there is a special "character" type of a single character.
-- for example, in the C language and in Java it is char.
-- in JS, there is no such type. there is only one type: string
-- a string may contain only one character or many of them. 

*/


/*

# 3. a Boolean (logical type)
-- a boolean type has only two values: true and false
-- this type is mostyly used to store yes/no values
-- boolean values also comes as a result of comparison

*/
let nameFieldChecked = true;
let ageFieldChecked = false;
let isGreater = 4 > 1;
console.log(nameFieldChecked); // true
console.log(ageFieldChecked); // false
console.log(isGreater); // true


/*
# 4. the "null" value
-- the special null value does not belong to any of the types described above
-- it forms a seperate type of its own which contains only the null value:

-- in JS, null is not a reference to "non-existing object" or a "null pointer" like in othere some languages
-- it's just a special value that represents "nothing", "empty", or a "value unknown"

*/

// the code below states that the age is unknown or empty for some reasons
let age = null;
console.log(age); // returns null


/*

# 5. the "undefined" value
-- the special value "undefined" also stands apart.
-- it makes a type of its own just like null
-- the meaning of "undefined" is "value not assigned"
-- if a variable is defined but not assigend, then its value is "undefined"

*/

let x;
console.log(x); // shows undefined

// technically, it is possible to assign undefined to any variable:
let y = 12346;
y = undefined;
console.log(y); // undefined
// ... but it's not recommended to do that. normally, you should use null to assign an "empty" or "unknown" value to a variable
// and we use "undefined" for checks like seeing if a variable has ben assigned 


/*
# 6. Objects and Symbols
-- the object type is special
-- all the other types are called "primitive" because their value can contain only a single thing(be it a string, a number or whatever)
-- in contrast, objects are used to store collections of data and more complex entities
-- the symbol type is used to create a unique identifier for objects 

*/

/*
# the typeof operator
-- the typeof operator returns the type of an argument 
-- it supports two types of syntax:
-- 1. as an operator: typeof x
-- 2. as a function: typeof(x)
-- in other words, it works with parenthese or without them. the result is the same
     
*/
console.log(typeof undefined); // undefined
console.log(typeof 0); // number
console.log(typeof true); // boolean
console.log(typeof "foo"); // string
console.log(typeof Symbol("id")); // symbol
console.log(typeof Math); // Object
console.log(typeof null); // object
console.log(typeof alert); // function

// for null it retuns "object" - this is an error in the language, it's not actually an object
// it is an officially recognized error in typeof, kept for compatibility
// of course, null is not an object, it is a special value with a seperate type of its own. 
// so again, this is an error in the language


/*
#  Types Conversions
-- most of the time, operators and functions automatically converts the values given to them to the right type
-- for example, alert automatically converts any value to a string to show it
-- mathematical operations converts values to numbers 
-- there are also cases where we have to explicitly convert a value to an expected type.  
 */


/*
# ToString
-- string conversion happens when we need the string form of a value
-- for example, alert(value) does it to show the value
-- we can also call the String(value) function to convert a value to a string

*/
let value = true;
console.log(typeof value); // boolean
value = String(value); // now value is a string true
console.log( typeof value); // string


/*
# ToNumber
--  numeric conversion happens in mathematial functions and expressions automatically
-- for example, when division is applied to non-numbers 

-- we can use the Number(value) function to explicitly convrt a value to a number
-- explicit conversion is usually required when we read a value from a string-based source like a text form but expect a numner to be entered
-- if the string is not a valid number, the result if such conversion is NaN

*/

// strings are converted to numbers
console.log("78" / "45"); // 1.7333333333333334
let str = "123456";
console.log(typeof str); // string
let num = Number(str); // becomes number 123456
console.log(typeof num);

// if the string is not a valid number, the result if such conversion is NaN
// exampel
let age = Number("an arbitrary string intead of a number");
console.log(age); // NaN, conversion failed.

/*
# Numeric Conversion rules:
 -- undefined --> NaN
 -- true and false  --> 1 and 0
 -- string  --> whitespaces from the start and end are removed. if the remaining string is empty, the result is 0. otherwise the number is "read" from the string. an error gives NaN

 -- Examples
 */
console.log(Number(  "1233")); // 123
console.log( Number("123a")); // NaN
console.log( Number(true)); // 1
console.log( Number(false)); // 0
console.log( Number(undefined)); // NaN
console.log( Number(null)); // 0

/*
#  Addition '+' concatenates strings
-- almost all mathematical operations converts values to numbers.
-- a notable exception is the addition "+" 
-- if one of the added vales is a string, the other one is also converted to a string, then, it concatenates (join) them
-- this only happens if atleast one of the arguments is a string, otherwise values are converted to numbers

*/
console.log("1" + 2); // 12
console.log(1 + "2"); // 12
console.log('1' + "2"); // 12
console.log(1 + 2); // 3
console.log(10 * "2"); // 20

/*
# ToBoolean
-- Boolean conversion is the simplest one
-- it happens in logical operations but can also be performed explicitlywith a call to Boolean(value)

# the conversion rules:
 -- values that are intutively "empty", like 0, an empty string, null, undefined, and NaN becomes false
 -- other values becomes true
*/


console.log(Boolean(1)); // true
console.log(Boolean(0)); // false
console.log(Boolean("hello")); // true
console.log(Boolean("")); // false

// NOTE: a string with zero "0" is true
// some languages like PHP treat "0" as false. but in JS, a non-empty string is always true
console.log(Boolean("0")); // true
console.log(Boolean(" ")); // spaces, is also true



// Operators

/*
# Terms: "unary", "binary", "operand"
-- an operand -- is what operators are applied to.
-- an operator is unary it has a single operand. for example, the unary negation - reverses the sign of a number 
 */
let x = 1;
let y = 1, z = 6;
let s = "my" + "string"; // string concatenation, binary +
x = -x; // unary operation
console.log(x); // -1, unary negation was applied
console.log(y - z); // an operator is binary if it has two operands
console.log(s);

/*
-- note that if one operand is a string, the other one is converted to a string too
-- so it doesn't matter if the first or second operand is a string. the rule is simple: 
-- if either operand is a string, the other one is converted into a string too
-- however, note that operations runs from left to right:

-- if there are two numbers folloed by a string, the numbers will be added before converted to a string
-- string concatenation and conversion is a special feature of the binary plus +.
*/
console.log("1" + 2); // 12
console.log(1 + "2"); // 12
console.log(3 + 5 + "1"); // 81 and not 351
console.log("1" + 3 + 5); // 135


// other arithmetic operators work only with numbers and always convert their operands to numbers
console.log(2 - '1'); // 1
console.log(2 / '4'); // 0 .5


/*
# Numeric conversion, unary +
-- the plus + exist in two forms: the binary form that we've used above and the unary form
-- the unary plus or, in other words, the plus operator + applied to a single value doesn't do anything to numbers 
-- but if the operand is not a number, the unary plus converts it into a number
*/


 // no effect on numbers 
let v = 1;
let w = -2;
console.log(+v); // 1
console.log(+w); // -2

// converts non-numbers
console.log(+true); // 1
console.log(+""); // 0
// it actually does the same thing as Number(...) but its shorter

/*
# REMARK:
-- the need to convert strings to numbers arises very often . for example if we are getting values from HTML form fields, they are usually strings
-- what if we want to sum them? -- the binary plus would add them as strings:
*/
let apples = "2";
let oranges = "3";
console.log(apples + oranges); // the binary plus concatenates the strings

// if we want to treat them as numbers, we have to convert and sum them
// both values converted to numbers before the binary plus
console.log(+apples + +oranges); // 5
console.log(Number(apples) + Number(oranges)); // the longer variant


/*
# REMARK
-- from the mathematician's standpoint, the abundance of pluses may seem strange
-- but from the programer's standpoint, there's nothing special:
-- unary pluses are applied first, they convert strings to numbers and then the binary plus sums them up.

-- why are unary pluses applied to values before the binary ones? 
-- as we are going to see, that's because of their higher precedence
*/



/*
# Operator Precendence
 -- if an expression has more than one operator, the execution order is defined by their precedence, 
 -- or in other words, the default priority order of operators
 -- e.g., the multiplication (*) has a higher precedence than addition +
 
 -- parentheses () overrides the precedence
 
 -- there are many operators in JS. every operator has a corresponding precedence number
 -- the one with the larger one executes first
 -- if the precedence is the same, the execution is from left ro right

 # Assignment
-- let's note that the assignment  (=) is also an operator. 
-- it's listed on the precedence table with a very low priority of 3.
-- that's why when we assign a variable like x = 2 * 2 + 1, the calculations are done first and then = is evaliated, storing the result in x
 */

let h = 6 * 6 + 1;
console.log(h); // 37
// it is possible to chain assignments
let a, b, c;
a = b = c = 2 + 2; // chained assignment evaluates from right to left:
// firts the right most expression 2 + 2 is evaluated and then assigned to the variable c, b and a. at the end, all the variables share the same value
console.log(a);
console.log(b);
console.log(c);


/*
# Remainder (%): 
-- the result of a % b is the remainder of integer division of a and b

# Exponentiation (**):
-- exponentiation is a recent addition to the language

#  Increment/Decrement:
-- increasing or decreasing a number is one among the most  common numerical operations
-- so, there are special operators for it 
*/

 // Increment ++ increases a variable by 1:
 let counter = 2;
 counter++; // works the same as counter = counter + 1 but shorter
 console.log(counter); // 3



// Decrement -- decreases a variable by 1:
let counter2 = 3;
counter2--;
//counter2--; // works the same as counter2 = counter2 - 1, but shorter
console.log(counter2); // 2

/*
# REMARK
-- Increment/Decrement can only be applied to variables. trying to use it on a value like 8++ causes an error
-- the opertor ++ and -- can be placed either before or after a variable

-- when the operator goes before a variable it is in the 'prefix form': ++counter
-- when the operator goes after a variable it is the 'postfix form': counter++
-- both of these stements do the same thing, increase counter by 1
 
-- is there any difference? Yes but we can only see it if we use the returned value of ++/--

-- let's clarify. as we all know, all operators return a value. Increment/Decrement is no exception
-- the prefix form returns the new value (prior to increment/decrement)
-- the postfix form returns the old value(prior to incemrnt/decrement)

-- to see the difference, here is an example: 
*/

 let counter3 = 1;
 let d = ++counter3; // the prefix form ++counter3 increments counter3 and returns the new value 2. so the alert shows 2
 console.log(d); // 2

 let counter4 = 1;
 let e = counter4++; // the postfix form counter4++ also increments counter4 but returns the old value (prior to increment). so the alert shows 1
 console.log(e); // 1



/*
 # SUMMARY:
-- if the result of increment/decrement is not used there is no differnce in which form to use
*/
let counter5 = 0;
console.log(counter5++); // 0
console.log(++counter5);

let counter6 = 0; // if we'd like to increase a value and immediately use the result of the operator, we need the prfix form:
console.log( ++counter6 );

let counter7 = 0; // if we'd like to increment a value but use its previous value, we need the postfix form
console.log( counter7++); // 0 

/*
# increment/decrement among other operators
-- the operators +++/-- can also be used inside expressions.
-- their precedence is higher than most other arithmetic operations

-- for instance:
*/
let counter8 = 1;
console.log(2** ++counter8); // 4

// compare with:
let counter9 = 1;
console.log(2 * counter9++); // 2, because counter9++ returns the old value

/*
# REMARK:
-- though technically okay, such notation usually makes code less readable. one line does multiple things- not good
-- while reading a code, a fast "vertical" eye-scan can easily miss something like counter++ and it won't be obvious that the variable increased
-- we advise a style of one-line one-action
*/


/*
# Bitwise Operators
--- bitwise operators treat arguments as 32-bit integer and work on the level of their binary representation
-- these operators are not JavaScript specific. they are supported in most programming languages

-- the list of operators:
 * AND (&)
 * OR (|)
 * XOR (^)
 * NOT (~)
 * LEFT SHIFT (<<)
 * RIGHT SHIFT (>>)
 * ZERO-FILL RIGHT SHIFT (>>>)
 * 
-- THESE operators are very rarely used. 
-- to understand them, we have to delve into low-level number representation   
*/
console.log(false & true);// 0
console.log(false | true);// 1
console.log(false^ true); // 1

/*
# Modify-in-place
-- we often need to apply an operator to a variable and store the new result in the same variable
-- for example:
*/
let n = 2;
n = n + 5;
n = n * 2;
console.log(n);// 14
// this notation can be shortened using the operators += and *=

let n1 = 2;
n1 += 5; // now n1 = 7 (same as n1 = n1 + 5)
n1 *= 2; // now n1 = 14 (same as n1 = n1 * 2)
console.log(n1); // 14

/*
# REMARK:
-- short "modify-and-assign" operators eixsts for all arithmetical and bitwise operators: /=, -=, e.t.c.
-- such operators have the same precedence as a normal assignment so they run after most other calculations
*/
let n2 = 2;
n2 *= 3 + 5;
console.log(n2); // 16 (right part evaluated first, same as n2 *= 8)


/*
# Comma
-- the comma operator (,) is one of the rarest and most unusual operators
-- it is used to write a shorter code.
--  the comma operator allows us to evaluate several expressions, dividing them with a comma ,.
-- each one of them is evaluated but only the result of the last one is returned
 
*/
let a1 = (1 + 2, 3 + 4);
console.log(a1); // 7 (the result of 3 + 4)
// here, the first expression 1 + 2 is evaluated and its result is thrown away.
// then, 3 + 4 is evaluated and returned as the result

/*
# REMARK:
--  comma has a very low precedence
-- comma has a very low precedence, lower than =, so parentheses are important in the example above
-- without them, a1 = 1 + 2, 3 + 4 evaluates + first, summing the numbers into a1 = 3, 7 then the assignment operator = assigns  a1 = 3, and the rest is ignored

-- why do we need an operator that throws away everything except the last expression?
-- sometimes, people use it in more complex constructs to put several actions in one line
*/

// for example:
// three operations in one line
for (a = 1, b = 3, c = a * b; a < 10; a++) {
    //
    // such tricks are used in JavaScript 
};
let a = (b=1, ++b);
console.log(b)

/*
# Comparisons
## Comparison Operators:

-- Greater/less than: a > b, a < b
-- Greater/less than or equals: a >= b, a <= b
-- Equals: a == b
-- Not equals: a != b 

*/

console.log( 2 > 1); // true
console.log( 2 == 1); // false
console.log( 2 != 1); // true

// a comparison result can be assigned to a variable, just like any other value
let result = 5 > 4;
console.log(result);

/* 
# String Comparison
--  to see whether a string is greater than another, JS uses the so-called "dictionary" or "lexicographical" order
-- in other words, strings are compared letter-by-letter

-- the algorithm to compare two strings is simple:
-- 1. Compare the first character of both strings
-- 2. if the first character from the first string is greater (or less) than the other string's, then the first string is greater (or less) than the second. we're done
-- 3. otherwise, if both string's first characters are the same, compare the second characters the same way
-- 4. Repeat until the end of either the string
-- 5. if both strings end either at the same length, then they are equal. otherwise the longer string is greater 

-- Not a real dictionary, but a Unicode order
-- the comparison algorithm given above is roughly equivalent to the one used in dictionaries or phone books, but's not exactly the same
-- for instance, case matters. a capital "A" is not equal to the lowercase "a".
-- which one is greater?
-- the lowercase "a"
-- Why?
-- because the lowercase character  has a greater index in the internal encoding table JavaScript uses (Unicode)
*/

console.log('Z' > 'A'); // true
console.log('Glow' > 'Glee'); // true
console.log('a' == 'A'); // false
console.log('a' > 'A'); // true

/*
# Comparison of different types
-- when comparing values of different types, JS converts the values to numbers
--  For boolean values, true becomes 1 and false becomes 0
*/
console.log('2' > 1); // true, string '2' becomes number 2
console.log( '01' == 1); // true, string '01' becomes number 1


console.log(true == 1); // true
console.log(false == 0); // true


/** A funny consequence:
 * if it's possible that at the same time:
 * Two values are equal
 * one of them is true as a boolean and the other one is false as a boolean
 * 
 for example:
 */
let a = 0;
console.log(Boolean(a)); // false

let b = "0";
console.log( Boolean(b)); // true

console.log( a == b); // true
// from JS standpoint, this result is quite normal
// an equality check converts values using the numeric conversion (hence '0' becomes 0), while the explicit Boolean conversion uses another set of conversion 


/*
# Strict Equality
-- a regular equality == has a problem, it cannot differentaite between 0 and false:
*/
console.log( 0 == false); // true

// the same thing happens with an empty string:
console.log( '' == false); // true

/*
## REMARK
-- this happens because the operands of different types are converted to numbers by the equality operator ==
-- an empty string, just like false becomes a zero

-- what to do if we want to differentiate 0 from false?
-- A strict equality operator === checks equality withot type conversion
-- i.e., if a and b are of different types, then a === b immediately returns false without an attempt to convert them 

-- there's also a "strict non-equality" operator !== analogous to !=
-- the strict equality operator is a bit longer to write, but makes it obvious what's going on and leaves less rom for errors

## Comparison with null and undefined
-- there is non-intuitive behavior when null or undefined are compared to other values 
-- for a strict equality check ===, these values are different because each of them is a different types

-- for a non-strict check ==, 
-- there's a special rule. these two are the "sweet couple": they equal each other (in the sense of ==), but not any other value

## For maths and other comparisons <> <= >=
-- null/undefined are converted to numbers: null becomes 0, while undefined become NaN
*/

console.log(0 === false); // false, because the types are different
console.log( null == undefined); // true for non-strict equality
console.log( null === undefined); // false for strict equality


 // Strange result: null vs 0
 // let's compare null with zero:
 console.log( null > 0); // false
 console.log( null == 0); // false
 console.log( null >= 0); // true

 /*
 ## REMARK:
-- mathematically, that's strange.
-- the last result states that "null" is greater than or equal to zero", so in one of the comparisons above it must be true, but they are both false.
-- the reason is that an equality check == and comparisons > < >= <= work differently.
-- comparisons convert null to a number, treating it as 0. that's why null > 0 is false.

-- on the other hand, the equality check == for undefined and null is defined such that without any conversions, they equal each other and don't equal anything else. that's why null == 0 is false.
*/


// An incomparable undefined
// the value undefined shouldn't be compared to other values:
console.log( undefined > 0); // false
console.log( undefined < 0); // false
console.log( undefined == 0); // false

/*
## REMARK
-- why does it dislike zero so much?
-- we get these results because:
-- undefined gets converted to NaN and NaN is a special numeric value which returns false for all comparisons

-- the equality check (149) returns false because undefined only equals null, undefined, and no other value.
 */