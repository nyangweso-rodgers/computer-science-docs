
# Shell script for multiplication of two numbers
expr 2 \* 3 # 6

# Multiplication of two numbers without using expr
num1=10
num2=20

solution1=$((num1 * num2))
echo $solution1

# Multiplication of two numbers using expr in shell script
num3=30
num4=40

solution2=`expr $num3 \* $num4`
echo $solution2