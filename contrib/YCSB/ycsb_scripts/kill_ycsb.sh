#!/bin/bash
if [ $# != 2 -o $# != 3 ]
then
	echo "Arguments needed: time to start, client ID [, optional instance ID of client]"
	exit 1
fi

sleep_time=$1
client_id=$2

bash /users/nobi/ramp/maude-ramp/contrib/YCSB/ycsb_scripts/sleep_time.sh $sleep_time
retn_val=$?

if [ "$retn_val" == "0" ]
then
	echo "$client_id"
	echo "Killing"
	kill -9 $(ps aux | grep '[y]csb' | awk '{print $2}') & 
#	kill -9 $(ps aux | grep '[r]un_client'$client_id'.sh' | awk '{print $2}') &
	if [ $# == 2 ]
	then
		kill -USR1 $(ps aux | grep '[c]lient'$client_id'\.maude' | awk '{print $2}') &
	else
		kill -USR1 $(ps aux | grep '[c]lient'$client_id'\_'$3'\.maude' | awk '{print $2}') &
	fi
	#sleep 2
else
	echo "Couldn't kill YCSB client"
fi
