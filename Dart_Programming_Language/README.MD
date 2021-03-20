# Programming in Dart
__Dart__ is an open-source, general-purpose, object-oriented programming language with C-style syntax developed by Google in 2011. The purpose of __Dart programming__ is to create a frontend user interfaces for the web and mobile apps.

Since __Dart__ is a compiled language so you cannot execute your code directly; instead, the compiler parses it and transfer it into machine code.It supports most of the common concepts of programming languages like _classes_, _interfaces_, _functions_, unlike other programming languages. Dart language does not support arrays directly. It supports collection, which is used to replicate the data structure such as arrays, generics, and optional typing.

### Syntax
```dart
void main () {
  print("Hello World!"); 
}
```
In front of the “__main__” function is the “__void__” return type, which does not return anything. The __parentheses__ “()” indicate a function, and, within the __curly brackets__ “{…}”, the DART __code is executed__.

__NOTE:__ Just like with __Java__, __C__, or __PHP__, all __DART__ statements must be terminated with a semicolon.


## Defining and Using Variables
The __variables__ in DART take certain types. These can be __integers__ (“int”) or __floating-point__ numbers (“double”). The variable type “dynamic” can have different values and expressions in the program flow

```dart
void main() {
  // variable declaration
  var name = 'Rodgers Nyangweso';
  print('My name:' + name);

  var mySize = 100;
  print(mySize);

  int yourSize = 200;
  print(yourSize);

  double thisSize = 300.12;
  print(thisSize);

  dynamic oneSize = 'Four Hundred' + ':' + '174';
  print(oneSize);
}
```
Attempting to assign an incorrect value to a certain variable type generates an error message
```dart
void main(){
    int temp = 37.98;
    print(temp);
}
```
### Character strings in the DART tutorial
With character strings, the data type “__String__” (_Attention: with a capital S at the beginning_), any character can be processed in __DART__ programming
#### Example:
```dart
void main(){
    String text1 = 'this is a single line string';
    String text2 = '''this is a multiline
	line string with a break''';
print(text1);
print(text2);
}
```


## Data Type
__Dart__ is a __Strongly Typed__ programming language. It means, each value you use in your programming language has a type either _string_ or _number_ and must be known when the code is compiled.

## Variables and Functions
Variables are the namespace in memory that stores values.The name of a variable is called as identifiers. They are the data containers, which can store the value of any type. For example:
```dart
var myName = 'Rodgers'
```

### References
1. https://www.ionos.com/digitalguide/websites/web-development/dart-programming-tutorial/
2. https://www.javatpoint.com/flutter-dart-programming