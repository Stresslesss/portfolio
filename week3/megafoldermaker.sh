#!/bin/bash 
      
#If there aren't two arguments to the script 
      
          if (( $#!=2 )); then 
      
# Ask user for input
      
  echo "Error, provide two numbers" && exit 1
      
          fi 
      
#For every number between the first argument and the last 
      
     for (( i = $1; i <= $2; i++ )) 
      
     do 
      
echo "Creating directory number $i" 
      
mkdir "week$i" 
      
     done 
# Credit course material 3.3