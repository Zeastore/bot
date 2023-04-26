#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"
UPDATE="https://raw.githubusercontent.com/rizkihdyt6/scupdate/rizki/"
BOT="https://raw.githubusercontent.com/rizkihdyt6/scupdate/rizki/"
ISP=$(cat /etc/xray/isp)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
Exp="LIFETIME"
Name="RizkiHdyt | Muslihudin"
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)

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

clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m        ∆ PROJECT AUTOSCRIPT VPN  ∆       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m┌── RAM ──┐     ┌── CPU ──┐     ┌─MEMORY─┐\033[36m"
echo -e "\033[1;32m   $USAGERAM MB           $LOADCPU%            $MEMOFREE"
echo -e "\033[1;36m└─────────┘     └─────────┘     └────────┘\033[36m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "[ ${Blue}XRAY${NC}: ${status_xray} ] [ ${Blue}NGINX${NC}: ${status_nginx} ] [ ${Blue}HAPROXY${NC}: ${status_haproxy} ]"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "[ ${Blue}TODAY ${NC}: ${GREEN}$ttoday ] [ ${Blue}MONTH ${NC}: ${GREEN}$bmon ]"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                    ⇱ SERVER INFORMATION ⇲                       \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"                                                                      
echo -e " ${YELLOW}System OS${NC}     : ${Cyan}$MODEL${NC}"
echo -e " ${YELLOW}Server RAM${NC}    : ${Cyan}$RAM MB $NC"
echo -e " ${YELLOW}Uptime Server${NC} : ${Cyan}$SERONLINE${NC}"
echo -e " ${YELLOW}Date${NC}          : ${Cyan}$DATEVPS | $TIMEZONE${NC}"
echo -e " ${YELLOW}Domain${NC}        : ${Cyan}$domain${NC}"
echo -e " ${YELLOW}NS Domain${NC}     : ${Cyan}$NS${NC}"
echo -e " ${YELLOW}IP VPS${NC}        : ${Cyan}$IPVPS${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ MENU SERVICE ⇲                         \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH MENU        $NC  ${BICyan}[${BIWhite}11${BICyan}]${RED} • ${NC}${CYAN}CHANGE DOMAIN $NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${BICyan}[${BIWhite}12${BICyan}]${RED} • ${NC}${CYAN}CHANGE BANNER $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU      $NC  ${BICyan}[${BIWhite}13${BICyan}]${RED} • ${NC}${CYAN}RESTART SERVICE $NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${BICyan}[${BIWhite}14${BICyan}]${RED} • ${NC}${CYAN}RESTART SERVER $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU     $NC  ${BICyan}[${BIWhite}15${BICyan}]${RED} • ${NC}${CYAN}AUTOKILL  $NC"
echo -e " ${BICyan}[${BIWhite}06${BICyan}]${RED} •${NC} ${CYAN}RUNNING SERVICE $NC  ${BICyan}[${BIWhite}16${BICyan}]${RED} • ${NC}${CYAN}AUTO REBOOT $NC"
echo -e " ${BICyan}[${BIWhite}07${BICyan}]${RED} •${NC} ${CYAN}BACKUP & RESTORE$NC  ${BICyan}[${BIWhite}17${BICyan}]${RED} • ${NC}${CYAN}UPDATE SCRIPT $NC"
echo -e " ${BICyan}[${BIWhite}08${BICyan}]${RED} •${NC} ${CYAN}INFO PORT       $NC  ${BICyan}[${BIWhite}18${BICyan}]${RED} • ${NC}${CYAN}CLEAR EXP ACCOUNT $NC"
echo -e " ${BICyan}[${BIWhite}09${BICyan}]${RED} •${NC} ${CYAN}VPS INFO        $NC  ${BICyan}[${BIWhite}19${BICyan}]${RED} • ${NC}${CYAN}CLEAR LOG $NC"
echo -e " ${BICyan}[${BIWhite}10${BICyan}]${RED} •${NC} ${CYAN}SPEEDTEST       $NC  ${BICyan}[${BIWhite}20${BICyan}]${RED} • ${NC}${CYAN}EXIT FROM SCRIPT $NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\e[1;97;101m               NEWBIE TUNNEL              \e[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\033[1;36m   ${Blue}IP VPS${NC}        : \033[1;32m$IPVPS${NC}"
echo -e "\033[1;36m   ${Blue}Exp Script${NC}    : \033[1;32m$Exp${NC}"
echo -e "\033[1;36m   ${Blue}Name Author${NC}   : \033[1;32m$Name${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
read -p "Select From Options [ 1 - 20 ] : " menu
case $menu in
1)
    ssh
    ;;
2)
    vmess
    ;;
3)
    vless
    ;;
4)
    trojan
    ;;
5)
    shadowsocks
    ;;
6)
    run
    ;;
7)
    get-backres
    ;;
8)
    portin
    ;;
9)
    gotop
    ;;
10)
    clear
    speedtest
    ;;
11)
    get-domain
    ;;
12)
    nano /etc/issue.net
    ;;
13)
    seres
    ;;
14)
    reboot
    ;;

15)
    autokill
    ;;
16)
    auto-reboot
    ;;
17)
    wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh
    ;;
18)
   xp
   ;;
19)
   clearlog
   ;;
20)
   exit
   ;;
*)
    menu
    ;;
esac
