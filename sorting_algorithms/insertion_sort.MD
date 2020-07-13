# Sorting Algorithm
## Insertion Sort
Sorts each item in the array as they are encountered. As the current item works from left to right:
* everything left of the item is known to be sorted.
* everything t the right is unsorted.

The current item is 'inserted' into place within the sorted section.

## Insertion Sert Performance
* Worst case performance: O(n<sup>2</sup>) - not appropriate for large unsorted data sets.
* Average case performance: O(n<sup>2</sup>) - not appropriate for large unsorted data sets.
* Best case performance: O(n) - very good best case performance can efficiently sort small and nearly sorted datasets.
* Space required: insertion sort operates directly on the input array meaning it is a candidate algorithm when minimising space is paramount.