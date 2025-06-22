# same program using expr

#shell script to print numbers 1 to 100
#using while loop and expr

i=1
while [ $i -lt 100 ]
do
    echo $i
    i=`expr $i + 1`
done