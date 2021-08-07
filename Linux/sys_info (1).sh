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

echo "A Quick System Audit Script" >> $output
date >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
echo "Hostname: $(hostname -s) " >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo "Memory Info: " >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who) \n" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
