#!/bin/bash

info="$(./ipInfo.sh)"                                       # Call ipInfo.sh and assign to variable
echo "$info" | sed -n '/IP/ { p }'                          # no output except lines containing IP
exit 0
