read -p "Count to: " count_to

i=0
while [ $i -le $count_to ] ; do
    echo "$i"
    (( i += 1 ))
done