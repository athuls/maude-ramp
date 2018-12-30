#!/bin/bash
source config.sh

cd $YCSB_dir

if [ $# != 4 ]
then
	echo "Arguments needed: IP address, id of client, number of clients, operation count"
	exit 1
fi

if [ ! -d "$tmp" ]; then
    mkdir $tmp
fi

rm $tmp/*

ip=$1
client_id=$2
num_clients=$3
opcount=$4
iter=0
retn_val=0
	while [ "$iter" -lt "$num_clients" ]
	do 
		port=`expr $initial_port + $iter` 
		bin/ycsb run kaiju -p hosts=$ip:$port -p port=$port -P workloads/workloada -p operationcount=$opcount -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -p time=10000 -p valuesize=1 -p outpath=$tmp -p close=true 
		file=${maude_client_side}/init-client${client_id}_${iter}.maude
                echo "***********************************"
                python $script_base/replace_transactions.py $file $ip $tmp $key_mapping 
		iter=`expr $iter + 1`
	done
