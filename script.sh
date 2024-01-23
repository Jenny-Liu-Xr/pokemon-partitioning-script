#!/bin/sh
#This script asks for Pokemon's Type

#check if a file exists
if [ $# = 0 ]; then
	echo Error\: Missing Filename
	echo USAGE\: sh script.sh \<fileName\>
	exit
fi
if [ -f $1 ]; then
	echo FILE \"$1\" exits
	if [ -r $1 ]; then echo FILE is readable
	fi
fi


echo "Please enter the Pokemon Type(Capitalize the first letter)":
read TYPE1

#mkdir -p $TYPE1

#get header
sed -n '1p' pokemon.csv > $TYPE1.csv

#get data
cat pokemon.csv|grep $TYPE1 >> $TYPE1.csv

#create folder and move file into specific folder
for f in $TYPE1.csv
do
	subdir=${f%.csv*}
	mkdir -p "$subdir" #create folder
	mv "$f" "$subdir"  #move
	
	echo Data saved.
	echo A file called $TYPE1.csv is created.
	echo A folder called $subdir is created.
	
	
done






