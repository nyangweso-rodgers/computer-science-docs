# Sorting Algorithm
## Merge Sort
This is one of the divide and conqure algorithms. __Merge Sort__ works by recursively splitting the data in half. When the array is in group sof 1, it is reconstructed in sort order. Each reconstructed array is merged with the other half.

## Merge sort performance
Worst case perfprmance: O(n log n):
* appropriate for large data sets
* data splitting means that the algorithm can be made parallel

Average case performance: O(n log n)
* appropriate for large data sets

Best case performance: O(n log n)
* appropriate for large data sets

Merge sort is a very predictable algorithm which can be very desirable in an algorithm because the data size is the only factor that really influences the performance.

Space Required:
* Merge can be, but is often not, performed in-place. These extra allocations increase the memory footprint required to sort data.