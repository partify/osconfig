#!/bin/bash

# provisions the entire os
# requires internet connection
# gets the latest stable mopidy
# festival, git, mopidy-spotify
# and partify stuff
#
# configures spotify and http modules
# for mopidy, using env vars:
# SP_USERNAME
# SP_PASSWORD


# Install apt-get sources
wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -

# Create sources.list
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/mopidy.list

# Install stuff
sudo apt-get -y update
sudo apt-get -y install git
sudo apt-get -y install festival
sudo apt-get -y install mopidy
sudo apt-get -y install mopidy-spotify
sudo apt-get -y install python-pip

# install us
git clone https://github.com/partify/mopidy-partify /home/pi/mopidy-partify
git clone https://github.com/partify/osconfig /home/pi/partify-osconfig
sudo pip install git+file:///home/pi/mopidy-partify

# enable ipv6
sudo modprobe ipv6
echo ipv6 | sudo tee -a /etc/modules

# Mopidy config
echo "[spotify]\n username = $(SP_USERNAME)\n password = $(SP_PASSWORD)\n\n[http]\n hostname = ::">> /etc/mopidy/mopidy.conf

# quick and dirty way to configure reboot.sh to run on reboot
(crontab -l; echo "@reboot /home/pi/partify-osconfig/reboot.sh";) | crontab -

# Force start
sudo service mopidy start