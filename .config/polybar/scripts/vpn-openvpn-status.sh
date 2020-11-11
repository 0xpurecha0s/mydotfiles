#!/bin/sh

# printf "VPN: " && (pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 | rev | cut -d "/" -f1 | rev && echo ▼) | head -n 1
printf " : " && (pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 | rev | cut -d "/" -f1 | rev && echo ▼) | head -n 1

#done
# 
# 
