# Sorting Algorithm
## Selection Sort
Sorts the data by finding the smallest item and swapping it into the array in the first unsorted location. The Algorithm:
* Enumerate the array from the first unsorted item to the end
* identify the smallest item
* swap the smallest item with the first unsorted item.

## Selection Sort Performance
* Worst case performance: O(n<sup>2</sup>) - not appropriate for large unsorted data sets.
* Average case performance: O(n<sup>2</sup>) - not appropriate for large unsorted data sets. typicallpy performs better than __bubble__ but worse tha __insertion sort__.
* Best case performance: O(n) - not appropriate for large unsorted data sets.
* Space required: insertion sort operates directly on the input array meaning it is a candidate algorithm when minimising space is paramount.