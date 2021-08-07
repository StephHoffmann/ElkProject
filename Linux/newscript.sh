#!/bin/bash

filepath=~/scripts

if [ ! -d ~/research ]
then
	mkdir ~/research
	echo "new directory made"
fi

if [ -f ~/research/sys_info.txt ]
then
	rm ~/research/sys_info.txt

