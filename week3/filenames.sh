#!/bin/bash


while read line; do

if ! [ -z $line ]; then                                           # -z if the string is empty, ! if the string is not empty? To exclude empty lines?
                                                                    # Also why two [[ ]] when the following only have one?
 

        if [ -f "$line" ]; then echo "$line     That file exists"            # if $line is a file echo such, what is a regular file as opposed to -e?

        fi

        if [ -d "$line" ]; then echo "$line     That's a directory"       # if $line is a directory echo such

        fi

        if [ ! -d "$line" ] && [ ! -f "$line" ] ; then echo "$line?     I dont know what that is!"     # If $line is not a directory and also not a valid file

        fi

fi

done < filenames.txt  # this sends filenames.txt into the while loop 