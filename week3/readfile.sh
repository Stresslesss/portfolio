#!/bin/bash

myfile=$1                   # create myfile var from command line var

IFS=$'\n'                   # set IFS to newline character

for line in $(cat < "$myfile"); # cat output
do
echo "$line "                   # check line output

if [ -d "$line" ];then 
echo "is a directory"        # if var is a directory

else
if [ -e "$line" ];then
echo "is a file "   # if var is a file

else
echo "  ? I don't know what that is! "       # otherwise is unknown

fi
fi

done
exit 0


