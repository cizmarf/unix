#!/bin/sh
predelej () {
    temp=$(mktemp) ;
    find "$1" ;
    find "$1" > "$temp" ;
    tac "$temp" | head -n -1 | while read line ; do
        name=`basename $line` ;
        if [ $2 = 0 ] ; then
            if [[ $name =~ ^[^a-z]*$ ]] ; then
                newname=`echo "$name" | tr [:upper:] [:lower:]` ;
                path=${line%/*} ;
                newpath="${path}/$newname" ; 
                mv "$line" "$newpath" ; 
            fi
        else
            if [[ $name =~ ^[^A-Z]*$ ]] ; then
                newname=`echo "$name" | tr [:lower:] [:upper:]` ;
                path=${line%/*} ;
                newpath="${path}/$newname" ;
                mv "$line" "$newpath" ;
            fi
        fi
    done
    rm "$temp";
}

r=0 ;
dir=0 ;
for arg in "$@" 
do
	if [ "$arg" = "-r" ] ; then
		r=1 ;
	else
		dir=1 ;
        	predelej "$arg" $r ;
	fi
done

if [ $dir = 0 ] ; then
    predelej . $r ;
fi
