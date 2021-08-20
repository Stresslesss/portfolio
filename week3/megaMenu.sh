#!/bin/bash

scriptPath1="./passwordCheck.sh"                 # set scriptpath variable
"$scriptPath1"                                  # execute passwordCheck.sh
exitCode1=$?                                    # set exitCode1 as per last script exit

if test $exitCode1 -eq 0                        # if equal to 0
then echo "Access Granted       
1. Create a folder: 
2. Copy a folder: 
3. Set a password: 
4. Calculator: 
5. Create week folders: 
6. Check file names: 
7. Download a file: "                            # display

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
    4)
    selection4="./calc.sh"
    "$selection4"
    ;;
    5)
    selection5="./megafoldermaker.sh"
    "$selection5" 
    ;;
    6)
    selection6="./filenames.sh"
    "$selection6"  
    ;;
    7)
    selection7="./webdownloader.sh"
    "$selection7"
    ;;
    esac                                 # end case statement

exit 0