# Foundations_of_JavaScript

__JavaScript__ was initially created to make "web pages alive". The programs in this langauge are called __scripts__. They can be written right in a web page's HTML and run automatically as the page loads. _Scripts_ are provided and executed as plain texts. they don't need special preparation or compilation to run. - in this aspect, JS is very different from another programming language called __Java__.

Today, JS can execute not only in the _browser_, but also on the _server_, or actually on any device that has a specal program called the _JavaScript Engine_. The browser has an embeded engine sometimes called a "__JavaScript virtual machine__". Different engines have different 'codenames'. For example:

1. V8 - in Chrome and Opera
2. SpiderMonkey - in Mozilla Firefox
3. there are other codenames like "Trident" and "Chakra" for different versions of Internet Explorer, "ChakraCore" for Microsoft Edge, "Nitro" and "SquirellFish" for Safari, e.t.c.

__JavaScript__ is a lightweight, interpreted programming language with object-oriented capabilities that allows you to build interactivity into otherwise static HTML pages.

## Difference between Java and Javascript
__Java__ is an OOP programming. It creates applications that run in a virtual machine or browser. __JavaScript__ is an OOP scripting language. The code is run on browser only.

## How do Engines work?
Engines are complicated but the basics are easy:
1. the engine (embeded if it's a browser) reads ('parses') the script
2. then it converts ('compiles') the scripts to the machine language
3. and then the machine code runs pretty fast.

The engine applies optimizations at each step of the process. it even watches the compiled scripts as it runs, analyzes the data that flows through it, and applies optimizations to the machine code based on that knowledge. when it's done, scripts run quite fast.


## What CAN in-browser JavaScript do?
Modern JS is a 'safe' programming language. it does not provide low-level access to memory or CPU, because it was initially created for browsers which do not require it. JS capabilities greatly depend on the environment it's running in. For example, __Node.js__ supports functions that allow JS to read/write arbitrary files , perform network requests e.t.c., In-browser JS can do anything related to webpage manipulation, interaction with the user, and the webserver.

For instance, in-browser JS is able to:
1. add new HTML to the page, change the existing content and modify styles.
2. react to users actions, run on mouse clicks, pointer movements, key presses.
3. send requests over the network to remove servers, download and upload files (so called __AJAX__ and __COMET__ technologies)
4. get and set cookies, ask questions to the visitor and show messages.
5. remember the data on the client side ('local storage')


## What CAN'T in-browser JavaScript do?
JS's abilities in the browser are limited for the sake of the user's safety. the aim is to prevent an evil webpage from accessing private information or harming the user's data. __Examples__ of such restrictions include:
1. JS on a webpage may not read/write arbitrary files on the hard disk, copy them or execute programs. it has not direct access to OS system functions.
2. Different tabs/windows generally do not know about each other. sometimes they do, for example when one window uses JS to open the other one. but even in this case, JS in from one page may not access the other if they come from different sites (from a different domain, protocol or port) This is called the "__Same Origin Policy__". To work around that, both pages must agree for data exchange and contain a special JS code that handles it.
3. JS can easily communicate over the net to the server where the current page came from. but its ability to receive data from other sites/domains is crippled. thouh possible, it requires explicit agreement (expressed in HTTP headers) from the remote side. once again, that's a safety limitation.

__REMARK__: such limits do not exist if JS is used outside of the browser, for example on a server. modern browsers also allow plugins/extensions which may ask for extended permissions.

## Features of JavaScript
* it is a lightweight, interpreted programming language
* it is designed for creating network-centric applications
* it is complementary to and integrated with Java
* it is open and cross-platform scripting language

## What makes JS unique?
There are at least 3 great things about JS:
1. full integraton with HTML/CSS
2. simple things are done simply
3. support all major browsers and enabled by default.

## Code Structure in JS
__Statements__  are syntax constructs and commands that perform actions. 
* _statement_ are seperated by semicolon(;)
* usually, statements are written on a seperate line to make the code more readable
* a semicolon may be ommitted in most cases when a line break exist. in this case, the JS interpret the line break as an 'implicit' semicolon. this is called automatic semicolon insertion
* in most cases, a new line implies a semicolon. but "in most cases" does not mean "always"

## The Modern mode, "use strict"
for a long time, __JavaScript__ evolved without __compatibility__ issues. new features were added to the language while old functionality didn't change that had the benefit of never breaking existing code. but the downside was that any mistake or an imperfect decision made by JS creators got stuck in the language forever. this was the case until __2009__ when __ECMAScript__ (ES5) appeared. it added new features to the language and modified the existing ones. to keep the old code working, most modifications are off by default. you need to explicitly enable them with a special directive "__use strict__"

### "use strict"
the directive looks like a string: __"use strict"__ or __'use strict'__. when it is located at the top of the script, the whole script works the "modern" way.

_NOTE_: 
* _looking ahead, lets just note that "use strict" can be put at the start of most kinds of functions instead of the whole script. doing that enables strict mode in that function only. but usually, people use it for the whole script._
* _please make sure that "use strict" is at the top of your scripts, otherwise strict mode may not be enabled._
* _only comments may appear above "use strict"_
* _there is no directive like "no use strict" that reverts the engine to old behavior._
* _once we enter strict mode, there's no return._

### Browser Console
for the future, when you use a _browser console_ to test features, please note that it doesn't _"use strict"_ by default.

## Always "use strict"
we have yet to cover the differences between the strict mode and the "default" mode. 
1. _the "use strict" directive switches the engine to the "modern" mode, changing the behavior of some of the built-in features._
2. _strict mode is enabled by placing the "use strict" at the top of the script or function. several language features like "classes" and "modules", enable strict mode automatically._
3. _strict mode is supported by all modern browsers_
4. _it's recommended to always start scripts by "use strict" _

## Data Types supported by JavaScript
* Undefined
* Null
* Boolean
* String
* Symbol
* Number
* Object


## Is JavaScript a case-sensitive language?
_JavaScript is a case-sensitive language. The language keywords, variables, function names, and any other identifiers must always be typed with a consistent capitalization of letters_

## Definign Variables in JavaScript
* var
* Const
* Let

## Creating an Object in JS
```js
var emp = {
    name: "Rodgers",
    age: 26
}
```

## What is Callback?
A __callback__ is a plain JavaScript function passed to some method as an argument or option. it is a function that is to be executed after another function has finished executing, hence the name _"call back"_

## What is Closure?
__Closers__ are created whenever a variable that is defined outside the current scope is accessed from within some inner scope. ot gives you access to an outer function's scope from an inner function.

## Ways an HTML element can be accessed in JavaScript code
* getElementById('idname')
* getElementByClass('classname')
* getElementByTagName('tagname')
* querySelector()

## Difference between '==' and '===' operator
The main difference between "==" and "===" operator is that formerly compares variable by making type correction.

## Difference between window  and document in JavaScript
JavaScript __window__ is a global object which holds variables, functions, history, location. The __document__ also comes under the window and can be considered as the property of the window.



## Languages "over" JavaScript
Recently, plethora of new languages appeared, which _transpiled_ (converted) to JS before they run in the browser. Modern tools makes the _transpilation_ very fast and transparent, actually allowing developers to code in another language and auto-converting it "under the hood". __examples of such languages__:
1. __CoffeeScript__ - is a "syntactic sugar" for JS. it intoduces shorter syntax, allowing us to write clearer and more precise code. usually, Ruby devs like it.
2. __TypeScript__ - is concentrated on adding "_strict data typing_" to simplify the development and support of complex systems. it's developed by __Microsoft__.
3. __Flow__ - also adds data typing but in a different way. it's developed by __Facebook__
4. __Dart__ - is a standalone language that has its own engine that runs in non-browser environments (like mobile-apps), but also can be transpiled to JS. it's developed by __Google__.

### Attaching a script to a Webpage
For server-side environments (like __Node.js__) you can execute the script by command like "node my.js"

### the "script" tag
JS programs can be attached to any part of an HTML document with an help of a < script > tag. the < script > tag contains JS code which is automatically executed when the browser processes the tag. The < script > tag has a few attributes that are rarely used nowadays but can still be found in old code.

#### the "type" attribute: < script type="...">
the old standard, HTML4 required a script to have a type. usually, it was a  type="text/javascript". it is not required anymore. also, the modern HTML standard, HTML5 totally changed the meaning of this attribute. now, it can be used for JavaScript modules. 

#### the "language" attribute: < script language="...">
this attribute was meant to show the language of the script. this attribute nolonger makes sense because JavaScript is the default language. there is no need to use it.

__NOTE__: only the simplest scripts are put into HTML. more complex ones reside in seperate files. the benefit of a seperate file is that the browser will download it and store it in its cache. other pages that reference the same script will take it from the cache instead of downloading it, so the file is actually downloaded once. this reduces traffic and makes pages faster.

*if src is set, the script content is ignored . a single < script > tag can't have both the src attribute and the code inside*