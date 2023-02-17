# Shell script to find greatest of two numbers
# Let's write a shell script to find the greatest of two numbers.

# Algorithm
## 1. Get two numbers. Say num1, num2
## 2. If num1 > num2, echo value of num1
## 3. Otherwise, echo value of num2

echo "Enter Num1"
read num1

echo "Enter Num2"
read num2

if [ $num1 -gt $num2 ]
then
    echo $num1

else
    echo $num2
fi