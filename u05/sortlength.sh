#!/bin/sh
while read line ;
do
	str=`echo "$line" | cut -f 1` ;
	echo ${#str}'\t'"$line";
done < $1 | 
sort -n | cut -d '	' -f 2-
