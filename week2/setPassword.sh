#! /bin/bash
# credit "Learning the bash Shell, Third
# Edition, by Cameron Newham and Bill Rosenblatt.
# Copyright 2005 and Simply Explained - Savjee. (2018, April 3) Youtube.com."

read -p "Enter folder Name:" Folder                 # allow input on same line
read -sp "Enter Password:" Password                 # hide response
echo $Password | sha256sum >./$Folder/secret.txt    # hash password and add output to file

exit 0


