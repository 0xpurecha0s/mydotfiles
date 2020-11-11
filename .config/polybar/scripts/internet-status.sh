#!/bin/bash
#----------------------------------------------------------------------------------------------------
#Check internet connectivity through ping exit code
# source : https://github.com/UtkarshVerma/i3blocklets/blob/master/internet
# ping google DNS
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
	echo "";
# Ok Google failed, ping cloudflare DNS
elif ping -c 1 1.1.1.1 > /dev/null 2>&1; then
	echo ""
# ping my gateway
else
	# echo "☠";
	IP=$(/sbin/ip route | awk '/default/ { print $3 }')
	# echo $IP
	if ping -c 1 $IP > /dev/null 2>&1; then
	        echo "";
	else
		echo ""
	fi
	# echo "D"
fi
