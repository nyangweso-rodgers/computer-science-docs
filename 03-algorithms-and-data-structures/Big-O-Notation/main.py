# Implementation of Big O Notation using Python

# Import various modules here
import numpy as np 
sample_array = np.array([0, 2, 3, 6, 0, 8, 5, 5, 2])

# O(1) - constant
## Example 1: Determine if the i-th element of an array is an odd number.
## Whether we access the 1st or 2nd or millionth item it doesn’t matter… We can access it directly by using the index operator array[i]
def isNthElementOdd(sample_array, n):
    return bool(sample_array[n] % 2)
isOdd = isNthElementOdd(sample_array, 2)
print(isOdd) # Output: True

# O(N) - Linear
## Example 2: Traverse an array and print each element.
## Here, we need to access all the elements one by one, so the calculation time increases at the same pace as the input.
def displayAllItems(array):
        for i in array:
            print(i, end = ' ')
displayAllItems(sample_array) # Output: 0 2 3 6 0 8 5 5 2

# O(N²):  Quadratic
## Example 3: Find duplicates in an array
## This is a ‘naive’ implementation, but it traverses the array twice:
def containsDuplicates(array):
    for i, outter_element in enumerate(array):
        for j, inner_element in enumerate(array):
            if (i == j):
                continue
            if (outter_element == inner_element):
                return True
        return False
duplicates = containsDuplicates(sample_array)
print(duplicates) # Output: True

# O(logN): Logarithmic
## Example 4: Binary search
sortedArray = ['bash', 'c', 'go', 'java', 'javascript', 'python', 'ruby', 'sql']
def binarySearch(array, element):
    first = 0
    last = len(array) - 1
    index = -1

    while (first <= last) and (index == -1):
        mid = (first + last) // 2
        if array[mid] == element:
            return True
        elif element < array[mid]:
            last = mid -1
        else:
            first = mid + 1
        return False
found = binarySearch(sortedArray, 'python')
print(found) # Output: False

# O(N logN): Log-linear
## Example 5: 

# O(2ᴺ): Exponential
## Example 6: 

# O(N!): Factorial
## Example 7: 