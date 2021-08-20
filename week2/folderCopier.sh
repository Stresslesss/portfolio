#!/bin/bash
# Script copied from course material under instruction

read -p "Type the name of the folder you would like to copy: " folderName
if [ -d "$folderName" ]; then
read -p "type the name of the destination folder: " newFolderName
cp -r "$folderName" "$newFolderName"
else
echo "I couldn't find that folder"
fi
exit 0