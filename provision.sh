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
# 
# can be used for re-provisioning:
# export REPROVISON=TRUE


# Install apt-get sources
if [ ! -z "$REPROVISON"]; then
  wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
fi

# Create sources.list
if [ ! -z "$REPROVISON"]; then
  sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/mopidy.list
fi

# Install stuff
sudo apt-get -y update
sudo apt-get -y install git
sudo apt-get -y install festival
sudo apt-get -y install mopidy
sudo apt-get -y install mopidy-spotify
sudo apt-get -y install python-pip

# install us
if [ ! -z "$REPROVISON"]; then
  git clone https://github.com/partify/mopidy-partify /home/pi/mopidy-partify
  git clone https://github.com/partify/osconfig /home/pi/partify-osconfig
fi

for f in /home/pi/partify-osconfig/*.sh
do
  echo "granting +x to $f"
  chmod +x $f
done

sudo pip install git+file:///home/pi/mopidy-partify

# enable ipv6
if [ ! -z "$REPROVISON"]; then
  sudo modprobe ipv6
  echo ipv6 | sudo tee -a /etc/modules

  # Mopidy config
  sudo bash -c "printf \"\n[spotify]\nusername = $(echo $SP_USERNAME)\npassword = $(echo $SP_PASSWORD)\n\n[http]\nhostname = ::\">> /etc/mopidy/mopidy.conf"

  # quick and dirty way to configure reboot.sh to run on reboot
  (crontab -l; echo "@reboot /home/pi/partify-osconfig/reboot.sh";) | crontab -
fi

# Force start
sudo service mopidy restart