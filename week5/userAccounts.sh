#!/bin/bash

cat /etc/passwd > passwd.txt

awk 'BEGIN {

    FS=":";

    print "| \033[34m Username        \033[0m | \033[34mUserID      \033[0m | \033[34mGroupID     \033[0m | \033[34mHome                   \033[0m | \033[34mShell            \033[0m |";
    print "|___________________|______________|______________|_________________________|___________________|";

}
/bash/ {        

    printf("| \033[33m%-16s\033[0m  | \033[35m%-10s\033[0m   | \033[35m%-10s\033[0m   | \033[35m%-23s\033[0m | \033[35m%-18s\033[0m|\n", $1, $3, $4, $6, $7);

}

END {

    print("_________________________________________________________________________________________________");

}'  passwd.txt

#  Modified line 13 to only display lines containing /bin/bash as per instruction