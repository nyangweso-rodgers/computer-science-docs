# basic math
expr 5 + 5

# storing the result in a variable
add=$((2 + 3))
echo $add

# shell program to add 2 variables
var1=10
var2=20

sum=$((var1 + var2))
echo $sum

# Add two variables using expr in shell script
var3=30
var4=40
sum2=`expr $var3 + $var4`
echo $sum2