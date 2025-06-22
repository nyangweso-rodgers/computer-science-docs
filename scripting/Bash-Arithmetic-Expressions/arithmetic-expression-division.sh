# division
expr 15 / 4 # 3

expr 16 / 4 # 4

# storing the result into a variable
sub=$((15/4))
echo $sub

# Division of two numbers without using expr
num1=10
num2=20
solution1=$((num2 / num1))
echo $solution1

# Division of two numbers using expr in shell script
num3=30
num4=40
solution2=`expr $num4 / $num3`
echo $solution2