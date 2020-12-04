#!/bin/bash

printf "\n"
echo "Pinging Google DNS server (8.8.8.8) ten times..."
printf "\n"

my_array=$(ping -c 10 8.8.8.8 | sed -n '2,12p'| tr '=' ' ' | tr '.' ' ' | awk '{print $13}')

#echo ${my_array[@]}

declare -i sum=0
declare -i count=0

for item in ${my_array[@]}
do
	((count++))
	echo "$count) $item ms"
	sum=$(( sum + item ))
done

declare -i average_ms
average_ms=$(( sum/count  ))

#echo "Count: $count"
#echo "Sum: $sum"

printf "\n"
echo "Average ping time: $average_ms milliseconds. "
printf "\n"

exit 0

