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