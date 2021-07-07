#!/bin/bash

#Check if script was executed by root user, exit if true
if [ $UID -ne 0 ]
then
	echo "please run as sudo"
	exit
fi

#Define Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
execs=$(find /home -type f -perm 777 2> /dev/null)
cpu=$(lscpu | grep CPU)
disks=$(df -H | head -2)

#Define lists for later use
commands=(
	'date'
	'uname -a'
	'hostname -s'
)

files=(
	'/etc/passwd'
	'/etc/shadow'
)

#Create research directory if it does not exist
if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi

#Remove output file if already created
if [ -f $output ]
then
	rm $output
fi

##############################################
#Start Script

echo "A Quick System Audit Script" >> $output
echo ""  >> $output


for x in {0..2};
do
	results=$(${commands[$x]})
	echo "Results of \"${commands[$x]}\" command:" >> $output
	echo $results >> $output
	echo "" >> $output

done

#Display Machine Type
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output

#Display IP Address Info
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output

#Display Memory Usage
echo -e "\nMemory Info:" >> $output
free >> $output

#Display CPU Usage
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

#Display Disk Usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

#Display Current User Login Info
echo -e "\nCurrent User Login Information: \n $(who -a) \n" >> $output

#Display DNS Info
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

#List Exec Files
echo -e "\nExec Files:" >> $output
for exec in $execs;
do
	echo $exec >> $output
done


#Top 10 Processes
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output

#Check Permissions on Files
echo -e "\nThe Permissions for Sensitive /etc Files: \n" >> $output
for file in ${files[@]};
do
	ls -l $files >> $output
done
