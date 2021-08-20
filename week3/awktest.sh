#!/bin/bash
awk ' {
print $7; '/[ /bin/bash/ ]/' /etc/passwd
}' input.txt

