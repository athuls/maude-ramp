#!/bin/bash
source config.sh
host=`hostname -s`

if [ $# -lt 2 ]
then
	echo "Arguments needed: client_id, time_to_start, ip1, ip2,..."
	exit 1
fi

cd ../ramp-only-backup/ramp-only/ramp-sigmod2014-code/contrib/YCSB


sleep_time=$2
client_id=$1
ARGS=( "$@" )
IPS=("${ARGS[@]:2}")

bash ${script_base}/sleep_time.sh $sleep_time
retn_val=$?
if [ "$retn_val" -eq "0" ]
then
	log_file=${host}_client_logs_${client_id}.txt 
	#./run-ycsb.sh $3 $4 > ${debug_log_dir}/${log_file} 2>&1
	./run-ycsb.sh ${IPS[*]} > ${script_base}/logs/${log_file} 2>&1
fi
