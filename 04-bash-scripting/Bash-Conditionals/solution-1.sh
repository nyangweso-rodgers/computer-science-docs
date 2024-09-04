# sample script
# write a script to compare two numbers
# method 1
echo "Enter first number"
read first_number

echo "Enter second number"
read second_number

diff=$((first_number-second_number))

if [ $diff -gt 0 ]
    then
        echo "$first_number is bigger than $second_number"
elif [ $diff -lt 0 ]
    then
        echo "$first_number is less than $second_number"
else
    echo "$first_number equals $second_number"
fi