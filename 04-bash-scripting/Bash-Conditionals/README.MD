# Bash Conditionals

## Table Of Contents
- [if statement]()

# Conditional Statements
* The keywords used to write conditional statements in bash are:
  * __if [ logical operation ]__: represents the condition that must be evaluated before proceeding
  * __then__: indicates that the following commands must be executed when the if-condition (or elif-condition) is satisfied
  * __elif [ logical operation ]__: in case that the if-condition was not satisfied, evaluate the logical operation in the brackets before proceeding
  * __else__: if neither of the if- or elif-conditions were satisfied, evaluate the following commands
  * __fi__: end of the conditional statement
  
# General Syntax
```sh
    if [ condition ]
        then
            ...commands
    elif [ condition ]
        then 
            ...commands
    else 
        ...commands
    fi
```
* Note the space surrounding each bracket