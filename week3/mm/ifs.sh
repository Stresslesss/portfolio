#!/bin/bash
IFS=','
words.txt="there,can,be,only,one"
for text in (cat $words.txt); do
echo -n "$text"
done
