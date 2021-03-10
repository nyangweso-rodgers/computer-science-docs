/*
# Function Expressions and Arrows
-- In JavaScript, a function is not a “magical language structure”, but a special kind of value.
-- Surely, a function is a special values, in the sense that we can call it like sayHi().
-- But it’s still a value. So we can work with it like with other kinds of values.

 */

function sayHi() {
   console.log( 'Hi' ); // you can use alrt
};
console.log(sayHi());

// There is another syntax for creating a function that is called a Function Expression.
let sayHi2 = function() {
    alert( 'Hi' );
    // Here, the function is created and assigned to the variable explicitly, like any other value. 
    // No matter how the function is defined, it’s just a value stored in the variable sayHi.
  };

 // The meaning of these code samples is the same: "create a function and put it into the variable sayHi".


  // We can copy a function to another variable:
  function sayHi3() { 
    // create (1)
      alert( 'Hello' );
  }

  let func = sayHi3; // copy (2)

  
func(); // Hello // run the copy (3); it works
// sayHi3(); // this one still works too ( why wouldn't it )




let sayHi4 = function() {
    alert( 'Hello' );
}

let func2 = sayHi4; 
// func2(); // Hello // Everything would work the same

// Why is there a semicolon at the end?
// You might wonder, why does Function Expression have a semicolon ; at the end, but Function Declaration does not:

function sayHi5() {
    alert( 'Hi' );
}

let sayHi6 = function() {
    alert( 'Hi');
};

/**
 * The answer is simple:
* There’s no need for ; at the end of code blocks and syntax structures that use them like if { ... }, for { }, function f { } etc.
* A Function Expression is used inside the statement: let sayHi = ...;, as a value. It’s not a code block, but rather an assignment. The semicolon ; is recommended at the end of statements, no matter what the value is. So the semicolon here is not related to the Function Expression itself, it just terminates the statement.
 */

// Callback functions

/* Let’s look at more examples of passing functions as values and using function expressions.
* We’ll write a function ask(question, yes, no) with three parameters:

* question: Text of the question
* yes: Function to run if the answer is “Yes”
* no Function to run if the answer is “No”
The function should ask the question and, depending on the user’s answer, call yes() or no():
**/

function ask(question, yes, no) {
    if (confirm(question)) yes()
    else no();
}

function showOk() {
    alert( 'You agreeed!');
}

function showCancel() {
    alert( 'You cancelled the execution!');
}

// usage: functions showOk and showCancel are passed as atguments to as
// ask( 'Do you agree?', showOk, showCancel);

/**
 * In practice, such functions are quite useful. 
 * The major difference between a real-life ask and the example above is that real-life functions use more complex ways to interact with the user than a simple confirm. 
 * In the browser, such function usually draws a nice-looking question window. But that’s another story.
 */

 /**
  * The arguments showOk and showCancel of ask are called callback functions or just callbacks.
* The idea is that we pass a function and expect it to be “called back” later if necessary. 
* In our case, showOk becomes the callback for “yes” answer, and showCancel for “no” answer.
  */

  // We can use Function Expressions to write the same function much shorter:
  function ask2(question, yes, no) {
      if(confirm(question)) yes()
      else no();
  }

  ask2(
      "Do you agree?",
      function() { alert("You agreed!") },
      function() { alertt( "You cancelled the execution" ); }
  );

  /**
   * Here, functions are declared right inside the ask2(...) call. 
   * They have no name, and so are called anonymous. Such functions are not accessible outside of ask2 (because they are not assigned to variables), but that’s just what we want here.
* Such code appears in our scripts very naturally, it’s in the spirit of JavaScript.
   */

// A function is a value representing an “action”
/**
 * Regular values like strings or numbers represent the data.
* A function can be perceived as an action.
* We can pass it between variables and run when we want.
 */



 // Function Expression vs Function Declaration
 // Let’s formulate the key differences between Function Declarations and Expressions.

// First, the syntax: how to differentiate between them in the code.

// Function Declaration: a function, declared as a separate statement, in the main code flow.
// Function Declaration
function sum( a, b ) {
    return a + b;
}

// Function Expression: a function, created inside an expression or inside another syntax construct. 
// Here, the function is created at the right side of the “assignment expression” =:
// Function Expression
let sum2 = function ( a, b) {
    return a + b;
};

// The more subtle difference is when a function is created by the JavaScript engine.

/**
 * A Function Expression is created when the execution reaches it and is usable only from that moment.
* Once the execution flow passes to the right side of the assignment let sum2 = function… – here we go, the function is created and can be used (assigned, called, etc. ) from now on.
 */

 /**
* Function Declarations are different.

*   A Function Declaration can be called earlier than it is defined.
* For example, a global Function Declaration is visible in the whole script, no matter where it is.
* That’s due to internal algorithms. 
* When JavaScript prepares to run the script, it first looks for global Function Declarations in it and creates the functions. 
* We can think of it as an “initialization stage”.

* And after all Function Declarations are processed, the code is executed. So it has access to these functions.

* For example, this works:
*/

// sayHi7( "John" ); // Hello,John

function sayHi7(name) {
    alert( `Hello, ${name}` );
}

// The Function Declaration sayHi7 is created when JavaScript is preparing to start the script and is visible everywhere in it.

// …If it were a Function Expression, then it wouldn’t work:
// sayHi8( "John" ); // error

let sayHi8 = function( name ) { // (*) no magic anymore
    alert( `Hello, ${name}` );
};

// Function Expressions are created when the execution reaches them. That would happen only in the line (*). Too late.

// Another special feature of Function Declarations is their block scope.


/**
 * In strict mode, when a Function Declaration is within a code block, it’s visible everywhere inside that block. But not outside of it.
 
 * For instance, let’s imagine that we need to declare a function welcome() depending on the age variable that we get during runtime. And then we plan to use it some time later.
 * If we use Function Declaration, it won’t work as intended:
 */

 let age = prompt("What is your age?", 18); 

 // conditionally, declare the function
 if (age < 18) {
     function welcome() {
         alert("Hello!");
     }
 } else {
     function welcome() {
         alert("Greetings!")
     }
 }

 // ... use it later
//  welcome(); //error: welcome not defined
 // That’s because a Function Declaration is only visible inside the code block in which it resides.

 // Here is another example:

let age2 = 16; // take 16 as an example

if (age2 < 18) {
  welcome();               // \   (runs)
                           //  |
  function welcome() {     //  |
    alert("Hello!");       //  |  Function Declaration is available
  }                        //  |  everywhere in the block where it's declared
                           //  |
  welcome();               // /   (runs)

} else {

  function welcome() {
    alert("Greetings!");
  }
}

// Here we're out of curly braces,
// so we can not see Function Declarations made inside of them.

welcome(); // Error: welcome is not defined

/**
 * What can we do to make welcome visible outside of if?
* The correct approach would be to use a Function Expression and assign welcome to the variable that is declared outside of if and has the proper visibility.
* This code works as intended:
 */

let age = prompt("What is your age?", 18);

let welcome;

if (age < 18) {

  welcome = function() {
    alert("Hello!");
  };

} else {

  welcome = function() {
    alert("Greetings!");
  };

}

welcome(); // ok now

// Or we could simplify it even further using a question mark operator ?:

let age3 = prompt("What is your age?", 18);

let welcome = (age3 < 18) ?
  function() { alert("Hello!"); } :
  function() { alert("Greetings!"); };

welcome(); // ok now


// When to choose Function Declaration versus Function Expression?

/**
 * As a rule of thumb, when we need to declare a function, the first to consider is Function Declaration syntax. 
 * It gives more freedom in how to organize our code, because we can call such functions before they are declared.
* That’s also better for readability, as it’s easier to look up function f(…) {…} in the code than let f = function(…) {…}. 
* Function Declarations are more “eye-catching”.
…But if a Function Declaration does not suit us for some reason, or we need a conditional declaration (we’ve just seen an example), then Function Expression should be used.
 */


// Arrow Functions