#!/bin/bash

# this will read aloud ips, using festival, for 2 minutes
# change the c max iteration, and or sleep timeout to adjust

c=1
while [ $c -le 2 ]
do
  echo "wired internet eye pee address" | festival --tts
  /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
  echo "wireless internet eye pee address" | festival --tts
  /sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
  (( c++ ))
  sleep 1m
done

# use analog out
sudo amixer cset numid=3 1
