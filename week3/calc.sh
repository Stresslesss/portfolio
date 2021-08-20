#!/bin/bash
# credit https://www.geeksforgeeks.org/simple-calculator-bash/ 

read -p "Enter first number: " one

read -p "Please enter                       
1: Addition
2: Subtraction
3: Multiplication
4: Division " action                        #  User input required action


read -p "Enter second number: " two

case $action in
1) echo -e "\033[34m"
        total=$( echo "$one + $two" | bc -l)

;; 
2) echo -e "\033[32m"
        total=$( echo "$one - $two" | bc -l)

;;
3) echo -e "\033[31m" 
        total=$( echo "$one * $two" | bc -l)

;;
4) echo -e "\033[35m"
        total=$( echo "scale=2;$one / $two" | bc -l)

;;
*) echo "invalid selection "  

;;

esac

echo "Result:  $total  "

exit 0