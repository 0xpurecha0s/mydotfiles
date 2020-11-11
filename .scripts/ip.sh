#!/bin/bash

# curl 'https://api.ipgeolocation.io/ipgeo?include=hostname&ip=103.149.192.94' -H 'authority: api.ipgeolocation.io' -H 'accept: application/json' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36' -H 'origin: https://ipgeolocation.io' -H 'sec-fetch-site: same-site' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://ipgeolocation.io/' -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8' --compressed 2>/dev/null | jq '.city'

for i in $(cat /tmp/list)
do
	# echo $i
	echo -ne "$i : " && curl "https://api.ipgeolocation.io/ipgeo?include=hostname&ip=$i" -H 'authority: api.ipgeolocation.io' -H 'accept: application/json' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36' -H 'origin: https://ipgeolocation.io' -H 'sec-fetch-site: same-site' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://ipgeolocation.io/' -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8' --compressed 2>/dev/null | jq '.city'
done
