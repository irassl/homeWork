# homeWork

sudo netstat -tunapl | awk '/firefox/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done


нужно было переделать скрип с запросами на программу или PID, количество обрабатываемых строк плюс добавить количество соединений к определенной организации

netstat -tunapl [--tcp|-t]
[--udp|-u]
[--numeric|-n]  
[--all|-a] 
[--program|-p] 
[--listening|-l]

awk '/firefox/ {print $5}' | cut -d: -f1
вывести из 5 столбца значение по имени, вырезать 1 часть из адреса

sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+'
сортировать, выбрать 5 последний уникальных  которые содержать числа разделенные точкой

 while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done
в цикл с помощью программы whois какой организации принадлежить ip-address
 

