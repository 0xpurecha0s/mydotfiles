#!/bin/bash

killall -q polybar

# for multiple monitors
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar parrot &
#done
polybar parrot
