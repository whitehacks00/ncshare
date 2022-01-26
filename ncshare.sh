#!/bin/bash
#
# NCShare: Open Source
# License: General Public License
# System: GNU/linux
# Date: 26-01-2022
#
# Facebook: https://www.facebook.com/whitehacks00
# Telegram: https://t.me/whitehacks_bot
# GitHub: https://github.com/whitehacks00
#
# Invite me a coffee $ PayPal: https://www.paypal.me/Darkmux
#
# This tool was created in honor of @thelinuxchoice.
#
# ==============================================
#                   Variables
# ==============================================
operatingSystem=$(uname -o)
deviceArchitecture=$(uname -m)
showPath=$(pwd)
host=$(ifconfig | grep "inet 192.168" | cut -d " " -f 10)
port="44444"
file="null.txt"
showDate=$(date)
# ==============================================
#                  Light colors
# ==============================================
black="\e[1;30m"
blue="\e[1;34m"
green="\e[1;32m"
cyan="\e[1;36m"
red="\e[1;31m"
purple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"
# ==============================================
#                  Dark colors
# ==============================================
blackDark="\e[0;30m"
blueDark="\e[0;34m"
greenDark="\e[0;32m"
cyanDark="\e[0;36m"
redDark="\e[0;31m"
purpleDark="\e[0;35m"
yellowDark="\e[0;33m"
whiteDark="\e[0;37m"
# ==============================================
#               Background colors
# ==============================================
blackBack=$(setterm -background black)
blueBack=$(setterm -background blue)
greenBack=$(setterm -background green)
cyanBack=$(setterm -background cyan)
redBack=$(setterm -background red)
yellowBack=$(setterm -background yellow)
whiteBack=$(setterm -background white)
# ==============================================
#             Checking dependencies
# ==============================================
function dependencies() {
    command -v nmap > /dev/null 2>&1 || { echo >&2 "I require nmap but it's not installed. Install it. Aborting."; exit 1; }
    command -v nc > /dev/null 2>&1 || { echo >&2 "I require netcat-openbsd but it's not installed. Install it. Aborting."; exit 1; }
    command -v netcat > /dev/null 2>&1 || { echo >&2 "I require netcat but it's not installed. Install it. Aborting."; exit 1; }
    chmod 777 *.sh
}
# ==============================================
#                 Banner NCShare
# ==============================================
function ncshare() {
    sleep 0.5
    clear
    echo -e ${red}"
          _   _  ____ ${green}____  _${red}
         | \ | |/ ___${green}/ ___|| |__   __ _ _ __ ___${red}
         |  \| | |   ${green}\___ \| '_ \ / _' | '__/ _ \ ${red}
         | |\  | |___ ${green}___) | | | | (_| | | |  __/ ${red}
         |_| \_|\____${green}|____/|_| |_|\__,_|_|  \___| ${red}

  ${yellow}.:.:. ${white}Remote File Transfer Tool coded by: @Darkmux ${yellow}.:.:.${white}

${redBack}:: Disclaimer: Developers assume no liability and are not  ::${blackBack}
${redBack}:: responsible for any misuse or damage caused by NCShare. ::${blackBack}"${white}
}
# ==============================================
#             Invalid option message
# ==============================================
function invalid() {
    echo -e ${yellow}"
[${red}!${yellow}] ${red}Invalid option!"${white}
    sleep 0.5
}
function notFound() {
    echo -e ${yellow}"
[${red}!${yellow}] ${red}Image not found!"${white}
    sleep 0.5
}
# ==============================================
#         Requesting data from the user
# ==============================================
function transferOption() {
    echo -e ""
    echo -e -n ${red}"[${green}*${red}] ${yellow}IP or Host (Default:${white} ${host}${yellow}): "${white}
    read -r newhost
    if [ "${newhost}" == "" ]; then
        host="${host}"
    else
        host="${newhost}"
    fi
    echo -e -n ${red}"[${green}*${red}] ${yellow}Local Port (Default:${white} ${port}${yellow}): "${white}
    read -r newport
    if [ "${newport}" == "" ]; then
        port="${port}"
    else
        port="${newport}"
    fi
    echo -e -n ${red}"[${green}*${red}] ${yellow}File Path: (Default:${white} ${file}${yellow}): "${white}
    read -r newfile
    if [ "${newfile}" == "" ]; then
        file="${file}"
    else
        file="${newfile}"
    fi
    echo -e ${red}"
[${green}*${red}] ${green}Run the command to transfer:${white}

nc -N ${host} ${port} < ${file}"
    echo -e ${red}"
[${green}*${red}] ${green}Waiting for File Transfer...
"${white}
    nc -vlp ${port} > ${file}
}
# ==============================================
#              Declaring functions
# ==============================================
dependencies
ncshare
transferOption
# ==============================================
#    Created by: @Darkmux - WHITE HACKS ©2022
# ==============================================
