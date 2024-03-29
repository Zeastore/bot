#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########################
# COLOR VALIDATION
clear
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
Red='\033[0;91m'         # Red
RED='\033[0;91'          # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
Cyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
CYAN='\033[0;96m'        # Cyan
YELLOW='\033[0;93m'      # Yellow
NC='\e[0m'

UPDATE="https://raw.githubusercontent.com/Zeadxt/rzk/main/"
BOT="https://raw.githubusercontent.com/Zeadxt/rzk/main/"
ISP=$(cat /etc/xray/isp)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
rak=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%", $3*100/$2 }')")
vcp=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
Exp="LIFETIME"
Name="RizkiHdyt | Muslihudin"
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Zeadxt/kzl/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/Zeadxt/kzl/main/ip 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Zeadxt/kzl/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Zeadxt/kzl/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}


nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

haproxy=$( systemctl status haproxy | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_haproxy="${GREEN}ON${NC}"
else
    status_haproxy="${RED}OFF${NC}"
fi

ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
bmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

#KonZ
vlx=$(grep -c -E "^#vl# " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^#vm# " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#tr# " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2

clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                   ⇱ SERVER INFORMATION ⇲                     \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"                                                                      
echo -e " ${YELLOW}⇲ SYSTEM OS | CPU USE ${NC} : ${Cyan}$MODEL | CPU USE $vcp%${NC}"
echo -e " ${YELLOW}⇲ SERVER RAM | USAGE ${NC}  : ${Cyan}$RAM MB  | RAN USE $rak MB${NC}"
echo -e " ${YELLOW}⇲ SERVER UPTIME ${NC}       : ${Cyan}$SERONLINE${NC}"
echo -e " ${YELLOW}⇲ DATE & TIME ${NC}         : ${Cyan}$DATEVPS | $TIMEZONE${NC}"
echo -e " ${YELLOW}⇲ DOMAIN ${NC}              : ${Cyan}$domain${NC}"
echo -e " ${YELLOW}⇲ NS DOMAIN ${NC}           : ${Cyan}$NS${NC}"
echo -e " ${YELLOW}⇲ IP VPS ${NC}              : ${Cyan}$IPVPS${NC}"
echo -e " ${YELLOW}⇲ EXP SCRIPT ${NC}          : ${Cyan}$exp${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "     [ ${Cyan}XRAY:${NC} ${status_xray} ]      [ ${Cyan}NGINX:${NC} ${status_nginx} ]      [ ${Cyan}HAPROXY:${NC} ${status_haproxy} ]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "    ${BIRed}[ TODAY : $ttoday ]${NC}              ${BIRed}[ MONTH : $bmon ]${NC} "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ MENU SERVICE ⇲                         \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${BIRed} •${NC} ${CYAN}SSH MENU        $NC  ${BICyan}[${BIWhite}11${BICyan}]${BIRed} • ${NC}${CYAN}CHANGE DOMAIN $NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${BIRed} •${NC} ${CYAN}VMESS MENU      $NC  ${BICyan}[${BIWhite}12${BICyan}]${BIRed} • ${NC}${CYAN}CHANGE BANNER $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${BIRed} •${NC} ${CYAN}VLESS MENU      $NC  ${BICyan}[${BIWhite}13${BICyan}]${BIRed} • ${NC}${CYAN}RESTART SERVICE $NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${BIRed} •${NC} ${CYAN}TROJAN MENU     $NC  ${BICyan}[${BIWhite}14${BICyan}]${BIRed} • ${NC}${CYAN}RESTART SERVER $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${BIRed} •${NC} ${CYAN}S-SOCK MENU     $NC  ${BICyan}[${BIWhite}15${BICyan}]${BIRed} • ${NC}${CYAN}AUTOKILL  $NC"
echo -e " ${BICyan}[${BIWhite}06${BICyan}]${BIRed} •${NC} ${CYAN}RUNNING SERVICE $NC  ${BICyan}[${BIWhite}16${BICyan}]${BIRed} • ${NC}${CYAN}AUTO REBOOT $NC"
echo -e " ${BICyan}[${BIWhite}07${BICyan}]${BIRed} •${NC} ${CYAN}BACKUP & RESTORE$NC  ${BICyan}[${BIWhite}17${BICyan}]${BIRed} • ${NC}${CYAN}UPDATE SCRIPT $NC"
echo -e " ${BICyan}[${BIWhite}08${BICyan}]${BIRed} •${NC} ${CYAN}INFO PORT       $NC  ${BICyan}[${BIWhite}18${BICyan}]${BIRed} • ${NC}${CYAN}CLEAR EXP ACCOUNT $NC"
echo -e " ${BICyan}[${BIWhite}09${BICyan}]${BIRed} •${NC} ${CYAN}VPS INFO        $NC  ${BICyan}[${BIWhite}19${BICyan}]${BIRed} • ${NC}${CYAN}CLEAR LOG $NC"
echo -e " ${BICyan}[${BIWhite}10${BICyan}]${BIRed} •${NC} ${CYAN}SPEEDTEST       $NC  ${BICyan}[${BIWhite}20${BICyan}]${BIRed} • ${NC}${CYAN}EXIT FROM SCRIPT $NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m               ⇱ FREE TUNNELING PROJECT ⇲                     \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"                                                                      
echo -e "${BICyan}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC ${BICyan} │"
echo -e "${BICyan}│  \033[0m ${BICyan} $ssh1        $vma           $vla          $tra              $ssa   $NC    ${BICyan} │"
echo -e "${BICyan}└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 20 ] : " menu
case $menu in
1) clear ;
    ssh
    ;;
2) clear ;
    vmess
    ;;
3) clear ;
    vless
    ;;
4) clear ;
    trojan
    ;;
5) clear ;
    shadowsocks
    ;;
6) clear ;
    run
    ;;
7) clear ;
    get-backres
    ;;
8) clear ;
    portin
    ;;
9) clear ;
    gotop
    ;;
10) clear ;
    clear
    speedtest
    ;;
11) clear ;
    get-domain
    ;;
12) clear ;
    nano /etc/issue.net
    ;;
13) clear ;
    seres
    ;;
14) clear ;
    reboot
    ;;

15) clear ;
    autokill
    ;;
16) clear ;
    auto-reboot
    ;;
17) clear ;
    wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh
    ;;
18) clear ;
   xp
   ;;
19) clear ;
   clearlog
   ;;
20) clear ;
   exit
   ;;
*)
    exit
    ;;
esac
