#!/bin/bash
echo "[+] Installation Script Starting Now."
echo "[+] Adding Sublime Repos"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "[+] Downloading Updates"
echo "[+] Adding Nextcloud Repository"
sudo add-apt-repository ppa:nextcloud-devs/client
echo "[+] Nextcloud Repository Added"
sudo apt-get update -y
echo "[+] Downloading Packages"
sudo apt-get install nmap cherrytree lxappearance vim sublime-text vim python python2.7 i3 i3blocks feh rofi python-virtualenv docker docker.io git tmux openvpn* yadm -y
echo "[+] Installing Nextcloud Application"
sudo apt-get install nextcloud-client -y
mkdir /home/$USER/.temp
echo "[+] Downloading Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --progress="bar" -O /home/$USER/.temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i /home/$USER/.temp/google-chrome-stable_current_amd64.deb
echo "[+] Downloading VSCode"
wget https://az764295.vo.msecnd.net/stable/f46c4c469d6e6d8c46f268d1553c5dc4b475840f/code_1.27.2-1536736588_amd64.deb --progress="bar" -O /home/$USER/.temp/code_1.27.2-1536736588_amd64.deb
sudo dpkg -i /home/$USER/.temp/code_1.27.2-1536736588_amd64.deb
echo "[+] Removing Temporary Folder."
code &
google-chrome-stable &
rm -rvf /home/$USER/.temp/
firefox https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/ https://addons.mozilla.org/en-US/firefox/addon/popup-blocker-ultimate/?src=recommended https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ &
rm -rvf $HOME/Documents $HOME/Pictures $HOME/Music $HOME/Public $HOME/Templates $HOME/Videos
mkdir /home/$USER/bin /home/$USER/Pentest /home/$USER/Project

#Docker 
sudo usermod -a -G docker $USER


# Setting VSCode
#code --install-extension rogalmic.bash-debug
#code --install-extension peterjausovec.vscode-docker
#code --install-extension ms-vscode.go
#code --install-extension pkief.material-icon-theme
#code --install-extension equinusocio.vsc-material-theme
#code --install-extension ms-vscode.powershell
#code --install-extension ms-python.python
#code --install-extension fabiospampinato.vscode-todo-plus

#echo "Add items to panel"
#echo "Change Font to Freesans"
#echo "Thunderbird Login"
#echo "Nextcloud Login"
sudo apt-get install tilix
echo "Tilix"
echo "https://gnunn1.github.io/tilix-web/"
#echo "[+] Firewall Rules"

#i3 ricing begins
#git clone the repos 

#git clone https://gitlab.com/slyrobot/dotfiles

#Firewall rules. Change.
#for ip in {2..255}; do
#	sudo ufw deny from 192.168.0.$ip
#	echo "192.168.0.$ip"
#done
