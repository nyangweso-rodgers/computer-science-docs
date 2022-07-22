# Algorithms

## Table of Contents
- [Introduction to Algorithms](#Introduction-to-Algorithms)
- [Sorting Algorithms](#Sorting-Algorithms)

# Introduction to Algorithms
__Algorithms__ refer to the detailed set of instructions that helps in the processing of data for a specific purpose.

# Sorting Algorithms
__Sorting__ involves arranging data in a collection based on a comparison algorithm. 

1. __Bubble Sort__: the simplest __sorting algorithm__. On each pass:
    * Compare each array item to its' right neighbor
    * if the right neighbor is smaller then Swap right and left
    * repeat the remaining array items.

2. __Insertion Sort__: Sorts each item in the array as they are encountered. As the current item works from left to right:
    * everything left of the item is known to be sorted.
    * everything t the right is unsorted.

3. __Merge Sort__: This is one of the divide and conqure algorithms. __Merge Sort__ works by recursively splitting the data in half. When the array is in group of 1, it is reconstructed in sort order. Each reconstructed array is merged with the other half.

4. __Selection Sort__: Sorts the data by finding the smallest item and swapping it into the array in the first unsorted location. The Algorithm:
    * Enumerate the array from the first unsorted item to the end
    * identify the smallest item
    * swap the smallest item with the first unsorted item.