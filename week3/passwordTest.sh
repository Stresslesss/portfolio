#!/bin/bash

echo "enter the password"

read password

len="${#password}"

if test $len -ge 8 ; then

    echo "$password" | grep -q [0-9]

    if test $? -eq 0 ; then

    echo "$password" | grep -q [A-Z]

    if test $? -eq 0 ; then

    echo "$password" | grep -q [a-z]

    if test $? -eq 0 ; then

    echo "$password" | grep -q [$,@,'#',%]

    if test $? -eq 0 ; then

    echo "Strong password"

        else

        echo "weak password include special chars"; exit 1;

        fi

    else

    echo "weak password include lower case char"; exit 1;

    fi

    else

    echo "weak password include capital char"; exit 1;

    fi

    else

    echo "please include the numbers in password it is weak password"; exit 1;

    fi

else

echo "password length should be greater than or equal 8 hence weak password"; exit 1;

fi

