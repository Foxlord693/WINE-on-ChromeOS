#!/bin/bash
sudo dpkg --add-architecture i386
bash <(curl -sL https://raw.githubusercontent.com/cknermann/WINE-on-ChromeOS/main/wine-on-chromeos.sh)
# Prepare temp directory
sudo mkdir /root/.gnupg
sudo chmod 700 /root/.gnupg

# Import repository keys
wget -O- https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | sudo tee /usr/share/keyrings/winehq.gpg

# Add repository
printf "deb [signed-by=/usr/share/keyrings/winehq.gpg] https://dl.winehq.org/wine-builds/debian/ bullseye main" | sudo tee -a /etc/apt/sources.list

# Update, install and configure
sudo apt update
sudo apt install --yes --install-recommends winehq-stable
winecfg
