#!/bin/bash
while read -p "Please enter a URL of a file to download or type exit    " weburl
if [ $weburl = exit ]; then
exit 0
fi
do ! [ $weburl = exit ];
read -p "Where would you like to store the file?" folder
wget $folder $weburl
done
 
exit 0