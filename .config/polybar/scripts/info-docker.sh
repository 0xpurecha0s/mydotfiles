#!/bin/sh

#STATUS="running exited dead"
STATUS="running"
for stat in $STATUS; do
    output="$output $(sudo docker ps -qf status="$stat" | wc -l)"
done

echo " :$output"
