#!/bin/bash

printError()                                    # function to print in red ERROR

{

    echo -e "\033[31mERROR:\033[0m $1"

}

getNumber()

{

    read -p "$1: "


    while (( $REPLY != 42 )); do                                        # while the input is not equal to 42

    if (( $REPLY < 1 || $REPLY> 100 )); then                            # test whether within parameters

        printError "Input must be between 1 and 100"                    #  outside range error
    fi                  

if (( $REPLY < 42 )); then                                              #  test for lower than
    echo "Too low!"
    fi

if (( $REPLY > 42 )); then                                              # test for higher than
    echo "Too high!"     
    fi

    read -p "$1: "                            
                                done                # I am aware this while loop will print error function and also "Too low or Too high"
                                                    # If the user cannot enter between clearly defined parameters then they need all the help we can give them

}                   

echo "Start the guessing game."                                     #  Welcome

getNumber "please type a number between 1 and 100"                  #  Input and call getNumber function

echo "Right!"                                                     #  End

exit 0