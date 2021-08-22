#!/bin/bash

read -p "Enter folder Name:" Folder      

    if [ ! -f "$Folder" ]; then
    mkdir $Folder
    fi

read -sp "Enter Password:" Password                 
echo $Password | sha256sum >./$Folder/secret.txt    

read -sp "Enter Password again:" var_spass          # second entry assigned to var_spass
var_hash=$(echo $var_spass | sha256sum)             # output to variable via hash to var_hash
hashfile="./$Folder/secret.txt"                     # take secret.txt hash and assign to hashfile variable
myvariable=$(cat $hashfile)                         # output hashfile variable to myvariable

if [ "$var_hash" = "$myvariable" ]                  # compare both hashed passwords
then
echo " Passwords match "                            # indicate match
fi

exit 0