# Sum of all digits - Shell Script

echo "Enter a Number"
read num

sum=0

while [ $num -gt 0 ]
do 
    mod=$((num % 10)) # it will split each digits
    sum=$((sum + mod)) # add each digit to sum
    num=$((num / 10)) #divide num by 10
done

echo $sum