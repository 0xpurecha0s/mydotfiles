#!/bin/bash

#Updates

sudo apt-get update
echo "Adding Repos"

# IP Indicator repo
#sudo apt-add-repository ppa:bovender/bovender
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Adding Brave Repo and installing it
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Adding repo for Java dependency for XDM
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install apt-transport-https -y
sudo apt-get remove transmission* parole* -y
sudo apt-get install build-essential gcc make indicator-ip perl -y
sudo apt-get install gedit firejail vlc qbittorrent proftpd brave-browser terminator -y

#Bitwarden install & download
#wget https://vault.bitwarden.com/download/?app=desktop&platform=linux

#Obsoulete repos
#XDMAN downloads
#wget https://netix.dl.sourceforge.net/project/xdman/old-releases/xdman.deb
#sudo dpkg -i xdman.deb

#indicator-ip &

#Firewall Rules for C0met
# echo "Setting firewall rules"
# sudo ufw disable
# for ip in {2..255}; do
# 	sudo ufw deny from 192.168.0.$ip
# done

sudo ufw enable
sudo apt-get autoclean && sudo apt-get autoremove

# Firefox addons
firefox https://bitwarden.com https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/ 

#if Chromium browser;;
if ! [ -x "$(command -v brave-browser)" ]; then
	sudo apt-get install brave-browser -y
fi

#Adding an alias for firejail 
mkdir $HOME/temp
mkdir $HOME/temp/asla
echo "alias sesfire='firejail --noroot --private=$HOME/temp/ --ignore=seccomp --ignore=protocol brave-browser'" >> ~/.bashrc
echo "alias sesasla='firejail --noroot --private=$HOME/temp/asla --ignore=seccomp --ignore=protocol brave-browser'" >> ~/.bashrc

if [ -d "/media/$USER/VB*" ]; then
    echo "VBox Mounted"
    sudo /media/alpha/V*/VBoxLinuxAdditions.run

elif [ ! -d "/media/$USER/VB*" ]; then
    echo "Mount VBoxLinuxAdditions"
    read -p "Press any key to continue"
    sudo /media/alpha/V*/VBoxLinuxAdditions.run
fi

# Set changes / extensions for Chromium Browser in Sandbox.
# Chrome bulk-media-downloader, turbo-download-manager, UblockOrigin

. .bashrc

firejail --noroot --private=$HOME/temp/ --ignore=seccomp --ignore=protocol brave-browser https://chrome.google.com/webstore/detail/bulk-media-downloader/ehfdcgbfcboceiclmjaofdannmjdeaoi?hl=en https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en https://chrome.google.com/webstore/detail/popup-blocker-pro/kiodaajmphnkcajieajajinghpejdjai?hl=en https://chrome.google.com/webstore/detail/turbo-download-manager/kemfccojgjoilhfmcblgimbggikekjip?hl=en
firejail --noroot --private=$HOME/temp/asla --ignore=seccomp --ignore=protocol brave-browser https://chrome.google.com/webstore/detail/bulk-media-downloader/ehfdcgbfcboceiclmjaofdannmjdeaoi?hl=en https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en https://chrome.google.com/webstore/detail/popup-blocker-pro/kiodaajmphnkcajieajajinghpejdjai?hl=en https://chrome.google.com/webstore/detail/turbo-download-manager/kemfccojgjoilhfmcblgimbggikekjip?hl=en

# TO-Do add tamper monkey to extensions list for sesfire and asla
brave-browser https://chrome.google.com/webstore/detail/bulk-media-downloader/ehfdcgbfcboceiclmjaofdannmjdeaoi?hl=en https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en https://chrome.google.com/webstore/detail/popup-blocker-pro/kiodaajmphnkcajieajajinghpejdjai?hl=en https://chrome.google.com/webstore/detail/turbo-download-manager/kemfccojgjoilhfmcblgimbggikekjip?hl=en

# Removing Directories
rm -rvf ~/Documents
rm -rvf ~/Music
rm -rvf ~/Templates
rm -rvf ~/Pictures
rm -rvf ~/Videos
rm -rvf ~/Public

# terminator config
# mkdir -p $HOME/.config/terminator
# wget https://gist.github.com/gaitonde-bhau/98799655b2c63fb785e918f2a51f6ce0/raw/a24734fd00d223f249a741e1018272bdbe3377e8/terminator-config -O $HOME/.config/terminator/config

# tmux configuration
# wget https://gist.github.com/gaitonde-bhau/98799655b2c63fb785e918f2a51f6ce0/raw/a24734fd00d223f249a741e1018272bdbe3377e8/.tmux.conf -O $HOME/.tmux.conf

# Install zsh
# sudo apt-get install -y zsh
## change shell.
# chsh -s $(which zsh)
# echo $SHELL
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# sudo apt-get install -y git
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# echo "Add this line to .zshrc"
# echo 'Do ENABLE_CORRECTION="true"'
# echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)'

# Call reboot action for making the changes permanent and make a snapshot
reboot
