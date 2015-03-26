#!/bin/bash

# this will read aloud ips, using festival, for 2 minutes
# change the c max iteration, and or sleep timeout to adjust

# use analog out always
sudo amixer cset numid=3 1

echo "wired internet eye pee address" | festival --tts
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
echo "wireless internet eye pee address" | festival --tts
/sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
sleep 10

echo "wired internet eye pee address" | festival --tts
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
echo "wireless internet eye pee address" | festival --tts
/sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
sleep 10

echo "wired internet eye pee address" | festival --tts
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
echo "wireless internet eye pee address" | festival --tts
/sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
sleep 10

echo "wired internet eye pee address" | festival --tts
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
echo "wireless internet eye pee address" | festival --tts
/sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
sleep 10

echo "wired internet eye pee address" | festival --tts
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts
echo "wireless internet eye pee address" | festival --tts
/sbin/ifconfig wlan0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | festival --tts