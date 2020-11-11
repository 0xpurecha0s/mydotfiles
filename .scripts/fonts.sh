#!/bin/bash

sudo apt install font-manager -y
sudo apt-get install -y fonts-font-awesome -y
wget https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip -O /tmp/fira.zip
cd /tmp
unzip -d fira fira.zip
font-manager
sudo font-manager
