#!/bin/bash

secret='shhh'#Don't tell anyone!
read -s -p "what's the secret code?" REPLY                   # I moved this line up to define the variable REPLY before the IF statement begins on line 7
#if the user types in the correct secret, tell them they got it right!

if [ "$secret" = $REPLY ]; then

    echo "  You got it right!"

    correct=true

else     echo "  You got it wrong :("

    correct=false

fi



echo

case $correct in

false)

    echo "Go Away!" #people who get it wrong need to be told to go away!
exit 0
    ;;

true)

    echo "you have unlocked the secret menu!"

    read -p "enter 1,2 or 3: " smenu
    #TODO: add a secret menu for people in the know.

    ;;

esac
if [ $smenu = 1 ]; then 
echo " You chose 1 but there is no prize for you" 
fi

if [ $smenu = 2 ]; then
echo " You chose 2 but there is no also prize for you"
fi

if [ $smenu = 3 ]; then
echo " You chose 3 but really there are no prizes at all!"
fi

exit 0
