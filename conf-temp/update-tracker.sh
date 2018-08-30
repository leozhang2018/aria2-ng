#!/bin/bash
killall aria2c &>/dev/null
list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" ./aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /aria2/conf/aria2.conf
    echo add......starting
    sleep 2
    aria2c --conf-path=/aria2/conf/aria2.conf
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /aria2/conf/aria2.conf
    echo update......starting
    sleep 2
    aria2c --conf-path=/aria2/conf/aria2.conf
fi
