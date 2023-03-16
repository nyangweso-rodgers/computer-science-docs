# Bash - Arithmetic Expressions

## Table Of Contents
- [Arithmetic Expressions in Bash](arithmetic-expression-addition.sh)
- [Basic Math](#basic-math)
  - [Addition](arithmetic-expression-addition.sh)
  - [Division](arithmetic-expression-division.sh)
  - [Modulo](arithmetic-expression-modulo.sh)
  - [Multiplication](arithmetic-expression-multiplication.sh)
  - [Subtraction](arithmetic-expression-subtraction.sh)

# Arithmetic Expressions in Bash
* Below are the operators supported by bash for mathematical calculations:
    - additon, +
    - subtraction, -
    - multiplication, *
    - division, /
    - exponentiation, **
    - modulus, %

* Numerical expressions can also be calculated and stored in a variable using the syntax below:
    ```sh
        var=$((expression))
    ```

* For __decimal calculations__, we can use __bc__ command to get the output to a particular number of decimal places. __bc__ (__Bash Calculator__) is a command line calculator that supports calculation up to a certain number of decimal points.

    ```sh
        echo "scale=2;22/7" | bc
    ```

# Basic Math
* The command for basic math is __expr__. Example:
  
    ```sh
        expr 5 + 5
    ```
* The spaces between arguments are important!