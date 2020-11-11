#!/bin/bash

sudo apt install i3 feh i3blocks feh gpg git rofi i3lock

# install polybar
cd /tmp
sudo apt-get install g++ cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2
git clone https://github.com/jaagr/polybar.git
cd polybar
# git tag # see what version do you need
git checkout 3.4.1
./build.sh
