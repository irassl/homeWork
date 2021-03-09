#!/bin/bash

netstat=`netstat -tunapl | less`

echo "show: ${netstat}"

read -p "Enter PID or Program name: " param
* 1 point for parametrization: you might want to enter PID or name of another process as an argument
netstat=`netstat -tunapl | less | awk ''/$param/' {print $5}' | cut -d: -f1 `
echo $netstat

sa=`awk -v var=${param} 'BEGIN {print var}'`
echo $sa
#| awk '/firefox/ {print $5}'

#| cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done


