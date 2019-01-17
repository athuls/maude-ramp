#!/bin/bash
source config.sh

if [ $# -lt 2 ]
then
	echo "Arguments needed: time_to_start, ip1, ip2,..."
	exit 1
fi

cd ~/ramp/maude-ramp/contrib/YCSB/ramp-only-backup/ramp-only/ramp-sigmod2014-code/contrib/YCSB

sleep_time=$1

bash ${script_base}/sleep_time.sh $sleep_time
retn_val=$?
if [ "$retn_val" -eq "0" ]
then 
	./run-ycsb.sh $2 $3 $4 $5 $6 
fi
