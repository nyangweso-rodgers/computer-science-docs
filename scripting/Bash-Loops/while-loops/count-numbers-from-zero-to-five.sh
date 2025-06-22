# printing numbers between 0 and 5
num=0

while [ $num -le 5 ]
do
    # printing the number
    echo "$num"
    # adding one each iteration
    num=$(expr $num + 1)
done