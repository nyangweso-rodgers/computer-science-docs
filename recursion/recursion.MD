# Recursion - Programming Technique
In its simplest form, __recursion__ is when a function calls itself from within its own code.

There are a few crucial things to keep in mind when it comes to recursion. For one, a __recursive function__ must actually terminate and return at some point. This is called the __breaking condition__. This prevents infinite loops from happening and the program from crashing so that the computer does not run out of memory trying to keep track of all the function calls.

Each time the function is called, the values of the arguments of the previous calls are stored aside instead of being overwritten by the new call. This is accomplished by what is called a “call stack” which, as the name suggests, is implemented through the __stack__ data structure.

### Example1: Building a Countdown Function
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

### Example2: Building the Power Function
Recall that raising a number a to the power b means multiplying a by itself b-times. The special case for the power function is that anything to the power zero is equal to one. When building mathematical functions, it is always a good idea to think of special cases. These usually end up being the breaking condition for your recursion.

```py
## Example2 - Power Function
def power(a, b):
    # taking care of special cases first
    if b == 0:
        return 1
    else:
        return a * power(a, b-1)
power(2,10)
## output: 1024
```

### Example3: Building the Factorial Function
```py
### Example 3 - Factorial Function
def factorial(num):
    # taking care of special cases first
    if (num == 0):
        return 1
    else:
        return num * factorial(num-1)
```
Note that this makes a lot of sense since we can always rewrite n! as n(n-1)!