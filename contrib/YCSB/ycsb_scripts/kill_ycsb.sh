#!/bin/bash
if [ $# != 1 ]
then
	echo "Arguments needed: time to start"
	exit 1
fi

sleep_time=$1

cd /users/nobi/ramp/maude-ramp/contrib/YCSB/ycsb_scripts
bash sleep_time.sh $sleep_time
retn_val=$?

if [ "$retn_val" == "0" ]
then
	echo "Killing"
	kill -9 $(ps aux | grep '[y]csb' | awk '{print $2}') & 
	sh kill_client.sh
else
	echo "Couldn't kill YCSB client"
fi
