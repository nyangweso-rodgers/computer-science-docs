# Bash Variables

## Table Of Contents

# Creating Variables in Bash
```sh
    #Example: 
    name:"Rodgers"
```
* There should be no spaces on both sides of the equal sign!
* Also, you cannot use single quotations marks to wrap the string!
* To refer to the variable you use __$__:

    ```sh
        name="Rodgers"
        echo $name # output: Rodgers
    ```

* You can even embed variables in strings:
    ```sh
        name="Rodgers"
        echo "My name is $name"
    ```

# Setting default values for the variables
* The syntax is __variable_name=${arg_position:-"Default Value"}__

# Setting dynamic variables
* In case you want to calculate the value of a variable during runtime, you could use the __$(( expression ))__ syntax.