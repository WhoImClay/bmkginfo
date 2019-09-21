#!/bin/bash
# Coded By VanGans | JANGAN DI RECODE GAN HARGAI PEMBUAT NYA!
GREEN=$(tput setaf 2) #HIJAU
RED=$(tput setaf 1) #MERAH
CYAN=$(tput setaf 6) #CYAN
WHITE=$(tput setaf 7) #PUTIH
NORMAL=$(tput sgr0) #NORMAL

clear;
IpInfo=$(curl -s "http://data.bmkg.go.id/autogempa.xml" | tr -d '\n')
wil=$(echo "${IpInfo}" | grep -Po '(?<=<Wilayah4>).*?(?=<)')
wil2=$(echo "{$IpInfo}" | grep -oP '(?<=<Wilayah5>).*?(?=<)')
jam=$(echo "${IpInfo}" | grep -Po '(?<=<Jam>).*?(?=<)')
ta=$(echo "${IpInfo}" | awk -F"[<>]" '{print $9'} RS="</Tanggal>\n")
ya=$(echo "${IpInfo}" |awk -F"[<>]" '{print $25}' RS="</Bujur>\n")
r=$(echo "${IpInfo}" | awk -F"[<>]" '{print $29}' RS="</Kedalaman>\n")
c=$(echo "${IpInfo}" |awk -F"[<>]" '{print $45}')
l=$(echo "${IpInfo}" | awk -F"[<>]" '{print $37}')
o=$(echo "${IpInfo}" | awk -F"[<>]" '{print $53}')
pon=$(echo "${IpInfo}" | grep -Po '(?<=<Potensi>).*?(?=<)')
printf " $RED
 ▄▀▀─ █▀▀ █▄─▄█ ▀ █▄─█ █▀ ▄▀▄
 █─▀▌ █▀▀ █─█─█ █ █─▀█ █▀ █─█ $WHITE
 ▀▀▀─ ▀▀▀ ▀───▀ ▀ ▀──▀ ▀─ ─▀─
    [ CREATE BY VanGans ] $WHITE
    [     BMKG INFO      ] $WHITE
"
echo "${CYAN}Tanggal => $ta"
echo "Lintang => $ya"
echo "Bujur => $r"
echo "${CYAN}Wilayah1 => $c"
echo "${CYAN}Kedalaman => $l"
echo "${NORMAL}Wilayah2 => $o"
echo "${CYAN}Wilayah4 => $wil"
echo "${CYAN}Wilayah5 => $wil2"
echo "${NORMAL}Potensi => $pon"
