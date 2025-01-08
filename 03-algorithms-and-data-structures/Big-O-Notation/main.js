// Time Complexity
function average(nums) {
    let total = 0;
    for(let i = 0; i < nums.length; i++) {
        total += nums[i]
    }
    return total / nums.length;
}
const start = new Date();
average([23, 51, 88, 49, 90, 7, 64, 77, 12, 8, 96]);
const end = new Date();

console.log(`Execution time: ${end - start}ms`);