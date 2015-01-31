#!/bin/bash
oldIP=$(cat /home/simon/ip/address.txt)
echo This is old IP: $oldIP

#IP=$(curl ipecho.net/plain)
IP=$(curl ifconfig.me/ip)
echo This is my IP: $IP

size=${#IP}
echo IP length:$size

if [ $size -le 5 ]
then
  echo "connection fail"
elif [ "$oldIP" = "$IP" ]
then
  echo "IP not changed"
else
  echo "IP changed"
  echo "$IP" > /home/simon/ip/address.txt
  echo $IP | mail -s "IP changed" 116981414@qq.com
  cd /home/simon/ip
  git pull origin master
  git add .
  git commit -m "ip changed"
  git push origin master
fi

#echo "$IP" >> /home/simon/ip/address.txt
#http://192.168.1.1/userRpm/StatusRpm.htm?Disconnect=%B6%CF%20%CF%DF&wan=1

