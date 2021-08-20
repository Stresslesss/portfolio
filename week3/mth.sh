#!/bin/bash
number=20
func()
{
    number=5
}
func
(( number++ ))
echo $number
