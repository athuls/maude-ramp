#!/bin/bash
source config.sh


if [ $# != 3 ]
then
	echo "Arguments needed: IP address, initial client_id, number of clients"
	exit 1
fi

if [ ! -d "$tmp" ]; then
    mkdir $tmp
fi

rm $tmp/*

ip=$1
initial_port=9810
client_id=$2
num_clients=$3
iter=0
while [ "$iter" -lt "$num_clients" ]
do
	port=`expr $initial_port + $iter`
        cd $YCSB_dir
	bin/ycsb load kaiju -p hosts=$ip:$port -p port=$port -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -p outpath=$tmp -s 
        echo "*********************************"
        cd $script_base
        ./replace_postload.sh $ip $client_id $iter         	
        iter=`expr $iter + 1`
done
