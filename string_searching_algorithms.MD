# String Searching Algorithms
1. Naive Search Algorithm

### Naive Search Performance
1. Average Performance
* O(n + m)
* n = length of string to search
* m = length of string to find

2. Worst Case Performance
* O(nm)

3. naive string search requires no pre-processing overhead
4. Appropriate when the string to search and find are both small


### Boyer-Moore-Horsepool Search
#### Boyer-Moore-Horsepool Performance
1. Performance improves with the length of the search string
* The larger the bad match table, the further the search string can be shifted.
* less overhead than Boyer-Moore because only one table is created.

2. Best Case
* O(n/m)
* n = length of string search
* m = length of string to find

3. Worst Case Performance
* O(nm)

4. Appropriate as a general purpose string search algorithm