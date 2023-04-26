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
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "[ ${Blue}TODAY ${NC}: ${GREEN}$ttoday ] [ ${Blue}MONTH ${NC}: ${GREEN}$bmon ]"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m               INFORMATION                \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m ${Blue}System OS${NC}     : \033[1;32m$MODEL${NC}"
echo -e "\033[1;36m ${Blue}Server RAM${NC}    : \033[1;32m$RAM MB $NC"
echo -e "\033[1;36m ${Blue}Uptime Server${NC} : \033[1;32m$SERONLINE${NC}"
echo -e "\033[1;36m ${Blue}Date${NC}          : \033[1;32m$DATEVPS | $TIMEZONE${NC}"
echo -e "\033[1;36m ${Blue}Domain${NC}        : \033[1;32m$domain${NC}"
echo -e "\033[1;36m ${Blue}NS Domain${NC}     : \033[1;32m$NS${NC}"

echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m              CREATE ACCOUNT              \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m   ${grenbo}1. ${NC} \033[1;36mSSH&OVPN ${NC}"
echo -e "\033[1;36m   ${grenbo}2. ${NC} \033[1;36mVMESS${NC}"
echo -e "\033[1;36m   ${grenbo}3. ${NC} \033[1;36mVLESS${NC}"
echo -e "\033[1;36m   ${grenbo}4. ${NC} \033[1;36mTROJAN${NC}"
echo -e "\033[1;36m   ${grenbo}5. ${NC} \033[1;36mSS${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m                  OTHER                   \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m   ${grenbo}6. ${NC} \033[1;36mRUNNING SYSTEM${NC}"     "\033[1;36m    ${grenbo}13.${NC} \033[1;36mRESTART SERVICE${NC}"
echo -e "\033[1;36m   ${grenbo}7. ${NC} \033[1;36mBACKUP & RESTORE${NC}"  "\033[1;36m  ${grenbo}14.${NC} \033[1;36mRESTART SERVER${NC}"
echo -e "\033[1;36m   ${grenbo}8. ${NC} \033[1;36mPORT VPS INFO${NC}"  "\033[1;36m     ${grenbo}15.${NC} \033[1;36mAUTO KILL${NC}"
echo -e "\033[1;36m   ${grenbo}9. ${NC} \033[1;36mLOAD VPS INFO${NC}"  "\033[1;36m     ${grenbo}16.${NC} \033[1;36mAUTO REBOOT${NC}"
echo -e "\033[1;36m   ${grenbo}10.${NC} \033[1;36mSPEEDTEST${NC}"   "\033[1;36m         ${grenbo}17.${NC} \033[1;36mUPDATE SCRIPT${NC}"
echo -e "\033[1;36m   ${grenbo}11.${NC} \033[1;36mCHANGE DOMAIN${NC}"  "\033[1;36m     ${grenbo}18.${NC} \033[1;36mCLEAR LOG${NC}"
echo -e "\033[1;36m   ${grenbo}12.${NC} \033[1;36mCHANGE BANNER${NC}" "\033[1;36m     ${grenbo}19.${NC} \033[1;36mCLEAR ALL AKUN EXP${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m               NEWBIE TUNNEL              \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36m   ${Blue}IP VPS${NC}        : \033[1;32m$IPVPS${NC}"
echo -e "\033[1;36m   ${Blue}Exp Script${NC}    : \033[1;32m$Exp${NC}"
echo -e "\033[1;36m   ${Blue}Name Author${NC}   : \033[1;32m$Name${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
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
   clearlog
   ;;
19)
   xp
   ;;
*)
    menu
    ;;
esac
