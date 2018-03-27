#!/bin/sh
avg=0;
no=0;
cut -d ';' -f 11 $1 | while read line
do
	p=$(echo $line | egrep -o '^[0-9]+');
	if [ -n "$p" ] ; then
		no=$((no+1));
		avg=$((avg+p));
		echo $((avg/no));
	fi
	#echo $line;
done | tail -n1
