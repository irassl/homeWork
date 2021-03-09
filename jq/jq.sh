#/bin/bash -x
#sudo apt-get install -y datamash
#xargs -n2 

# для того, чтобы урать grep -oP '\d+\.\d+', можно подставить 0 в массив
jq=`jq '.prices[][0]' -r  quotes.json  

#jq=`jq '.prices[][0] |= (. / 1000 | strftime("%Y-%m-%d"))' -r  quotes.json `
# преобразовывает в дату можно вытащить март осталось найти сумму
#jq=`jq '.prices[][0]' -r  quotes.json |  while read dt ; do  date -d@$(($dt / 1000)) ; done `
#| awk '{ print strftime("%Y-%m-%d", $1); }'`
# awk 'ORS=NR%2?FS:RS'
#awk '{ $1=strftime("%Y-%m-%d", (($1 / 1000))); if ($1 ~ "2015-03") print $2
# awk '{ "date -d@"(($1 / 1000)) | getline timestamp ; $1=timestamp; if ($1 ~ "Mar 2015")  print $2 }' 
#   | getline timestamp ; $1=timestamp; if ($1 ~ "Mar")  print $2 }

# if ($1 ~ "March") if(min==""){min=max=$2}; if($2>max) {max=$2}; if($2<min) {min=$2}; } END {print "avg " (max-min)/2," | max "max," | min " min } 

jq=`jq '.prices[][]' -r  quotes.json  | xargs -n2 | \
 awk '{ $1=strftime("%Y-%B-%d", (($1 / 1000)));  if ($1 ~ "Mar")  print $1 }'`

# для того, чтобы урать grep -oP '\d+\.\d+', можно подставить 
jq=`jq '.prices[][0]' -r  quotes.json  
echo $jq
# разделить по годам

# $(( $(( $max - $min )) / 2 ))


#date -d '2020-March-26` +%s

