#! /bin/bash
# credit "Learning the bash Shell, Third
# Edition, by Cameron Newham and Bill Rosenblatt.
# Copyright 2005 O'Reilly Media, Inc., 0-596-00965-8."

read -p "Enter folder Name:" Folder                 # allow input on same line
read -sp "Enter Password:" Password                 # hide response
echo $Password | sha256sum >./$Folder/secret.txt    # hash password and add output to file
read -sp "Enter Password again:" var_spass          # second entry assigned to var_spass
var_hash=$(echo $var_spass | sha256sum)             # output to variable via hash to var_hash
hashfile="./$Folder/secret.txt"                     # take secret.txt hash and assign to hashfile variable
myvariable=$(cat $hashfile)                         # output hashfile variable to myvariable
if [ "$var_hash" = "$myvariable" ]                  # compare both hashed passwords
then
echo " Passwords match "                            # indicate match
fi
exit 0


