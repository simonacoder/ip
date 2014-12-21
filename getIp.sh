#!/bin/bash
oldIP=$(cat address.txt)
echo This is old IP: $oldIP

#IP=$(curl ipecho.net/plain)
IP=$(curl ifconfig.me/ip)
echo This is my IP: $IP

size=${#IP}
echo IP length:$size

if [ "$size" -ne 15 ]
then
  echo "connection fail"
elif [ "$oldIP" = "$IP" ]
then
  echo "IP not changed"
else
  echo "IP changed"
  echo "$IP" >> /home/simon/ip/address.txt
  cd /home/simon/ip
  git pull origin master
  git add .
  git commit -m "ip changed"
  git push origin master
fi

#echo "$IP" >> /home/simon/ip/address.txt
