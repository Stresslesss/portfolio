#!/bin/bash

myfile=$(cat "filenames.txt" | grep .)


IFS=$'\n'

for i in $( cat < "$myfile" );
do
echo " tt"

if [ -d "$i" ];then
echo "$i is  directory";
else

if [ -f "$i" ];then
echo "$i is a file";
else

echo "$i is not valid";
exit 1
fi
fi
done