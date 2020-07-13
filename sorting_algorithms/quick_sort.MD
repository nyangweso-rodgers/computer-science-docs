# Sorting Algorithms
## Quick Sort
__Quick sort__ is a divide and conquer algorithm and is one of the most commonly used general purpose sorting algorithm in Computer Science. This is how it works:
* pick a pivot value and partition the array
* put all values before the pivot on the left and above to the right. -  The pivot point is now sorted. Everything right is larger, everything left is smaller.
* perform pivot and partition algorithm on the left and right partitions.
* repeat until sorted.

## Quick Sort performance
* Worst case perfprmance: O(n<sup>2</sup>): not appropriate for large pathologically sorted (inverse sorted) data sets.
* Average case performance: O(n log n): appropriate for large data sets.
* best case performance: O(n log n): very good best case performance and can efficiently sort small and nearly sorted data sets.
* space required: O(n) - as a recursive algorithm, the array space as well as the stack space must be considered.there exists optimizations to reduce space usage further.
