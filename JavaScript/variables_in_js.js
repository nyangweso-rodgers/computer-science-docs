/* VARIABLES
-- Variables are used to store information. 
-- A variable is a "named storage" for data
-- to create a variable in JS use the let keyword
*/

let message
message = 'Hello World'
console.log(message)

// we can also declare multiple variables in one line:
let user = 'john', sex = 'Male', age = 25, height = 45;

console.log(user)

// this might seem shorter but it is not recommended. for the sake of bettter readability, use a single line per variable
let user = 'john';
let sex = 'Male'
let age = 25;
let height = 45;

/* "var" instead of "let"
-- in older scripts you may also find another keyword: "var" instead of "let"
-- the "var" keyword is almost the same as "let". it also declares a variable but in an old fashioned way
-- there are subtle differences between "var" and "let"  
*/
var name = 'paul';

// when the value of a variable is changed, the old data is removed from the variable
let message1;
message1 = 'old variable';
message1 = 'new variable';
console.log(message1);

// we can also declare two variables and copy data from one into the other
let firstName = 'rodgers';
let secondName;
// copy 'rodgers' from firstName into secondName
secondName = firstName;
// now, two variabels hold the same data
console.log(firstName);
console.log(secondName);

/*
REMARK:
Functional languages
 -- it is intersting to note that there exist functional programming languages like Scala and Erlang that forbid changing variable values
 -- in such languages, once tha value is stored, it's there forever. if we need to store something else, the language forces us to create/declare a new variable. we can't reuse the old one
 -- though it may seem a little odd at first sight, these languages are quite capable of serious development 
 */


 /*
 # Variable Naming in JS
 * there are two limitations to naming varibales in JS:
 1. the name must contain only letters, digits, or the symbols $ and _
 2. the first character must not be a digit.

# Reserved Names
 -- there are a list of reserved words which cannot be used as variable name s because they are used by the language itself
 -- for example: let, class, return, and function are reserved
*/


/*
# An assignment without 'use strict'
 -- normally, we need to define a variable before using it.
 -- but in the old times, it was technically create a variable by a mere assignment of the value without using let.
 -- this still works now if we don't put 'use strict' in our scripts to maintain compatibility with old scripts
 */

 // note: no 'use script' in this example
 num = 5; 
// a variable 'num' is created if it didn't exist
// this is a bad practice and would cause an error in strict mode


/*
#  Constants:
-- to declare a constant(unchanging) variable, use const instead of let
-- variables declared using const are called "constants". they cannot be cahnged.
-- when a programmer is sure that a variable will never change, they can declare it with const to guarantee and clearly communicate the fact to everyone
*/
const myBirthDay = '25.03.1994';
console.log(myBirthDay)

// any atempt to change a contant would cause an error:
myBirthDay = '26.03.1994';
console.log(myBirthDay)
