#!/bin/sh
if [ ! -f /aria2/conf/aria2.conf ]; then
	cp /aria2/conf-temp/aria2.conf /aria2/conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /aria2/conf/aria2.conf
	fi
fi

if [ ! -f /aria2/conf/on-complete.sh ]; then
	cp /aria2/conf-temp/on-complete.sh /aria2/conf/on-complete.sh
	chmod +x /aria2/conf/on-complete.sh
fi

if [ ! -f /aria2/conf/update-tracker.sh ]; then
	cp /aria2/conf-temp/update-tracker.sh /aria2/conf/update-tracker.sh
	chmod +x /aria2/conf/update-tracker.sh
fi

if [ $UPDATETRACKER ]; then
	./aria2/conf/update-tracker.sh
fi

touch /aria2/conf/aria2.session
darkhttpd /aria-ng --port 80 &
aria2c --conf-path=/aria2/conf/aria2.conf
