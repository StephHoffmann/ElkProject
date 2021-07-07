#!/bin/bash

#Variables
states=('Nebraska' 'Hawaii' 'California' 'Utah' 'Florida')
nums=$(echo {0..9})
ls_out=$(ls)

#states for loop
for state in ${states[@]}
do 
	if [ $state == "Hawaii" ];
	then
		echo "Hawaii is the best!"
	else
		echo "I'm not fond of Hawaii"
	fi
done
	

#numbers for loop
for num in ${nums [@]}
do
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
		echo $num
	fi
done

#ls for loop
for x in ${ls_out [@]}
do
	echo $x
done

