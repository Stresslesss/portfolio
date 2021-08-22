#!/bin/bash
# CYB6004.2021 Scripting Languages Assessment task - software based solution

                                    #   Credit "Learning the bash Shell", Third
                                    #   Edition, by Cameron Newham and Bill Rosenblatt.
                                    #   Copyright 2005


function securefolder() {

echo $Password | sha256sum >./$Folder/secret.txt                            # Store hashed password

read -sp "Enter Password again:" var_spass                                  # second entry assigned to var_spass

var_hash=$(echo $var_spass | sha256sum)                                     # assign values to variables
hashfile="./$Folder/secret.txt"                                         
myvariable=$(cat $hashfile)                                                  

    if [ "$var_hash" = "$myvariable" ]                                          # compare both hashed passwords
    then
echo " Passwords match "                                                    # indicate match
    else
echo " Passwords do not match" ; passwordtest ;                             # No match start again
    fi


}

function passwordtest() {

          

    if [ ! -d "$Folder" ]; then                                           # Test if folder exists and create if not
    mkdir $Folder
    fi  

read -sp "Enter Password:" Password                                        # Request Password

len="${#Password}"                                                         # Test password for length and upper, lower case letters, numbers and special characters

if test $len -ge 8 ; then

    echo "$Password" | grep -q [0-9]

    if test $? -eq 0 ; then

    echo "$Password" | grep -q [A-Z]

    if test $? -eq 0 ; then

    echo "$Password" | grep -q [a-z]

    if test $? -eq 0 ; then

    echo "$Password" | grep -q ['\!,@,#,$,%,^,&,*,(,),-,_,=,+']

    if test $? -eq 0 ; then

    echo "Strong password" ; securefolder ;                                 # If password is strong go to matching function

        else

        echo "weak password include special chars"; passwordtest ;          # Otherwise loop back

        fi

    else

    echo "weak password include lower case char"; passwordtest ;

    fi

    else

    echo "weak password include capital char"; passwordtest ;

    fi

    else

    echo "please include the numbers in password it is weak password"; passwordtest ;

    fi

else

echo "password length should be greater than or equal 8 hence weak password"; passwordtest ;

fi

}

                                    # Scrape website section

curl=$(which curl)                                                          # credit https://www.youtube.com/watch?v=DZ0WKRmUTm4 
outfile="output.txt"
url="https://purplesec.us/resources/cyber-security-statistics/"


function scrapeurl() {

    curl -o $outfile $url                                                   #  scrape the website
}
function cleanscrape() {
                                                                            # edit data with sed commands
    grep "<li>" $outfile | sed '{
        s/<[^>]*>//g 
        s/..8211.//g
        }' > clean.txt                                                      # send to clean.txt file
    
}
function totalmalware() {                                                   # use awk with head parameter
    cleantxt="clean.txt"
    awk '
    BEGIN {
        print "\033[31m The total malware infections worldwide rose significantly 2009 - 2018 \n \033[37m"
    }
    /^201/' $cleantxt | head -10
    mainmenu
}

function largest() {                                                        # use awk with tail parameter
    cleantxt="clean.txt"                                                
    echo -e "\033[31m  Some of the largest breaches which have compromised millions of user accounts \033[33m  "
    awk '
    /^201/' $cleantxt | tail -18 
    mainmenu
}

function generalcost() {                                                    # use grep with 20 lines after match
    echo -e "\033[31m  The growing cost of protection and larger cost of security breaches \033[36m  "
    cleantxt="clean.txt"
    grep "2017, cyber" -A 20 $cleantxt
    mainmenu
}

function ransom() {                                                         # use awk for match only
    cleantxt="clean.txt"
    awk '
    BEGIN {
        print "\033[31m Some information on ransomware \n \033[32m"
    }
    /ransomware/' $cleantxt
    mainmenu
}

function smallbiz() {                                                       # Different colours used for each function output
    cleantxt="clean.txt"
    awk '
    BEGIN {
        print "\033[31m Not only big business are targets!! \n \033[1;34m"
    }
    /small/' $cleantxt
    mainmenu
}

function financial() {
    cleantxt="clean.txt"
    awk '
    BEGIN {
        print "\033[31m Financial Institutions are compelling targets \n \033[35m"
    }
    /financial institutions/' $cleantxt
    mainmenu
}

function healthcare() {
    cleantxt="clean.txt"
    awk '
    BEGIN {
        print "\033[31m The healthcare industry is targeted heavily \n \033[36m"
    }
    /healthcare/' $cleantxt
    mainmenu
}

function goodbye() {                                                        # Exit option with message
    echo -e "\033[1;32m Thanks for visiting, we hope what you learnt will be useful in keeping your business information secure"
}

function mainmenu() {                                                   #####    Main Menu function   ####
    exitCode1=$?                                                        # set exitCode1 variable as per last script exit

if test $exitCode1 -eq 0                                                # if equal to 0 (completed successfully)
then echo -e "\033[1;36m Please make a selection for more detailed information on;       
1. Rise in Malware: 
2. Some of the largest breaches: 
3. Costs associated with breaches: 
4. Ransomware: 
5. Small business: 
6. Financial Institutions: 
7. Healthcare: 
8. Exit program"                                                        # Display menu options

else test $exitCode1 -eq 1                                              # if equal to 1
echo "Access Denied"; exit 1;                                           # Deny access, exit value 1
fi

read -p "make a selection; " selection                                  # Request input
                    
case $selection in                                                      # Case statement
    1)
    selection1=totalmalware
    "$selection1"
    ;;
    2)
    selection2=largest
    "$selection2"
    ;;
    3)
    selection3=generalcost
    "$selection3"
    ;;
    4)
    selection4=ransom
    "$selection4"
    ;;
    5)
    selection5=smallbiz
    "$selection5" 
    ;;
    6)
    selection6=financial
    "$selection6"  
    ;;
    7)
    selection7=healthcare
    "$selection7"
    ;;
    8)
    selection8=goodbye
    "$selection8"
    ;;
    esac                                                            # End case statement

exit 0
}


                    ######    Main Section    #####
read -p "Please create your user name  " Folder                    # Create folder to store passwords for filtering and checking
passwordtest
scrapeurl
cleanscrape
mainmenu