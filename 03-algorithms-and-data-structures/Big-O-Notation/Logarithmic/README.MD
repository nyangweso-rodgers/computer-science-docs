# O(logN): Logarithmic

# Logarithms Definition
* _Recall_: 2³ = 2 * 2 * 2 = 8 — Here we multiply the number 2, 3 times.

* Logarithms are the flips of exponents.

* log₂8 answers the question: how many 2s do we multiply together to get 8? The answer is 3. i.e., if we keep dividing 8 by 2 until we end up to 1, how many 2s do we have in our equation?

# O(logN): Logarithmic
* Simply put, __O(logN)__ describes an algorithm that its number of operations increases by one each time the data is doubled.

* Logarithmic time complexities usually apply to algorithms that divide problems in half every time: 
    * _Example include_ Dictionary lookup (aka binary search) which involves:
    * Open the dictionary in the middle and check the first word.If our word is alphabetically more significant, look in the right half, else look in the left half.
    * Divide the remainder in half again, and repeat until we find our word.
    
* We can only pick one possibility per iteration, and our pool of possible matches gets divided by two in each iteration. This makes the time complexity of binary search O(logN). The number of steps barely increase, as the input grows (i.e. it takes just one additional step each time the data doubles):