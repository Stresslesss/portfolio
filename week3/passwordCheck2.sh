#! /bin/bash
# credit "Learning the bash Shell, Third
# Edition, by Cameron Newham and Bill Rosenblatt.
# Copyright 2005 O'Reilly Media, Inc., 0-596-00965-8."

read -p "Enter folder name: " Folder
read -sp "Enter Password: " Password                 # hide response
echo $Password | sha256sum >./$Folder/secret.txt    # hash password and add output to file
read -sp "Enter Password again: " var_spass          # second entry assigned to var_spass
var_hash=$(echo $var_spass | sha256sum)             # output to variable via hash to var_hash
hashfile="./$Folder/secret.txt"                     # take secret.txt hash and assign to hashfile variable
myvariable=$(cat $hashfile)                         # output hashfile variable to myvariable
if [ "$var_hash" = "$myvariable" ]                  # compare both hashed passwords
then
echo "Access Granted "    
exit 0                                           
else echo "Access Denied "
exit 1
fi
