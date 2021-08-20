#!/bin/bash

scriptPath1="./passwordTest.sh"                 # set scriptpath variable
"$scriptPath1"                                  # execute passwordTest.sh
exitCode1=$?                                    # set exitCode1 as per last script exit

if test $exitCode1 -eq 0                        # if equal to 0
then echo "Access Granted       
1. Create a folder: 
2. Copy a folder: 
3. Set a password: "                            # display

else test $exitCode1 -eq 1                      # if equal to 1
echo "Access Denied"; exit 1;                   # deny access, exit value 1
fi

read -p "make a selection; " selection            # request input

case $selection in                              # case statement
    1)
    selection1="./folderCreator.sh"
    "$selection1"
    ;;
    2)
    selection2="./folderCopier.sh"
    "$selection2"
    ;;
    3)
    selection3="./setPassword.sh"
    "$selection3"
    ;;
    esac                                        # end case statement

exit 0