/*
# Array Methods in JavaScript
-- an Array is a special variable which can hold more than one value at a time.
-- an array can hold many values under a single name, and you can access the values by reffering to an index number

## The Length Property
-- the length property of an array returns the length of an array(the number of array elements)

## Changing the Elements of an Array
-- you can change an array element by referring to the index number

## Access the Elements of an Array
-- you can access an array element by reffering to the index number
-- remember: array index are started from 0

*/
let car = ['BMW', 'Honda', 'Volvo'];
console.log(car); // [ 'BMW', 'Honda', 'Volvo' ]
console.log(typeof(car)); // object

// length
console.log(car.length); // 3

// index
console.log(car[0]); // BMW
console.log(car[1]); // Honda
console.log(car[2]); // Volvo

// changing an element
car[0] = 'Renault';
console.log(car); // [ 'Renault', 'Honda', 'Volvo' ]

// accessing the last array element
console.log(car[car.length - 1]); // Volvo

/*
map

-- the map() method creates a new array populated with the return value of the callback function for each element in the array
*/
const numbers = [1, 2, 3, 4, 5];
const doubled = numbers.map(value => value * 2);
console.log(doubled); // [ 2, 4, 6, 8, 10 ]

/*
# forEach
-- the forEach() method executes a provided function once for each array element.
-- the callback function does not expect a return value, and the forEach() method itself also returns undefined
*/
const numbers = [1, 2, 3, 4, 5];
const allAboveThree = numbers.forEach(n => console.log(n)
); 

/*
# filter
-- the filter() method creates a new array containing only the elements that 'pass the test' implemented by the callback function.
-- we call this type of callback a predicate function
*/
const numbers = [1, 2, 3, 4, 5];
const even = numbers.filter(n => n % 2 === 0);
const odd = numbers.filter(n => n % 2 !== 0);
console.log(even); // [2, 4]
console.log(odd); // [1, 3, 5]

/*
# find
-- the find() method behaves similarly to the filter() method, but it only returns a single element.
-- this method will stop at the first element that 'pass the test' and return that. 
-- if none exists, it will return undefined
*/
const numbers = [1, 2, 3, 4, 5];
const even = numbers.find(n => n === 3);
console.log(even);

/*
# findIndex
-- the findIndex() method behaves similarly to the find() method, but it returns an index instead of the element.
-- this method will stop at the first element that 'pass the test' and return the index.
-- if none exists, it will return -1
*/
const numbers = [1, 2, 3, 4, 5];
const indexOfThree = numbers.findIndex(n => n === 3);
console.log(indexOfThree);

/*
# reduce
--  the reduce() method takes a callback with (at least) two arguments
-- an accumulator and the current element
-- for each iteration, the return value of the callback function is passed on as the accumulator argument of the next iteration
*/
const numbers = [1, 2, 3, 4, 5];
const sum = numbers.reduce((acc, n) => acc + n);
console.log(sum); // 15

/*
# some
-- the some() function takes a predicate function and return  true if any of the elemnts in the array 'passes the test'
*/
const numbers = [1, 2, 3, 4, 5];
const hasAboveThree = numbers.some(n => n > 3);
console.log(hasAboveThree); // true

/*
# every
-- the every() method takes a predicate function and returns true if all of the elemnts in the array 'pass the test'
*/
const numbers = [1, 2, 3, 4, 5];
const allAboveThree = numbers.every(n => n > 3);
console.log(allAboveThree); // false

/*
# includes
-- the includes() method checks if an array includes a certain value among its elements, returning true or false
*/
const numbers = [1, 2, 3, 4, 5];
const hasNumberFour = numbers.includes(4);
console.log(hasNumberFour);

/*
# fill
-- the fill() method replaces all the elemnts in an array to a given value
*/
const numbers = [1, 2, 3, 4, 5];
const populateWithFour = numbers.fill(4);
console.log(populateWithFour); 

/* 
# reverse
-- the reverse() method reverses the order of the elements in the array
*/
const numbers = [1, 2, 3, 4, 5];
const reversed = numbers.reverse();
console.log(reversed);

/*
# flat
-- the flat() method creates a new array with all sub-array elements flattened into it.
-- you can specify a depth. The default is 1
*/
const numbers = [[1], [2], [3], [4], [5]];
const flattened = numbers.flat(2);
console.log(flattened); // [ 1, 2, 3, 4, 5 ]

/*
# flatMap
-- the flatMap() method applies a callback to each element of the array and then flatten the result into an array.
-- it combines flat() and map() in one function
*/
const numbers = [[1], [2], [3], [4], [5]];
const flattenedDoubles = numbers.flatMap((n) => n * 2);
console.log(flattenedDoubles);

/*
# sort
-- the sort() method is used to sort the elements of an array and returning the sorting array.
-- NOTE: this method is mutating the original array
*/
const numbers = [2, 9, 3, 5, 1, 8];
numbers.sort((a, b) => a - b);
console.log(numbers);