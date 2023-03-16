echo "Enter first number"
read first_number

echo "Enter second number"
read second_number

if [[ $first_number -gt 0 && $first_number -gt $second_number ]]
    then
        echo "$first_number is positive and greater than $second_number"
elif [[ $first_number -gt 0 && $first_number -lt $second_number ]]
    then
        echo "$first_number is positive and less than $second_number"
else
    echo "$first_number is negative"
fi