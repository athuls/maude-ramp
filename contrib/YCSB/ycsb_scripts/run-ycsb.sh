#rm keyMappings.txt
#bin/ycsb load kaiju -p hosts=128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -s
cd /users/nobi/ramp/maude-ramp/contrib/YCSB
cp keyMappings.txt keyMappings_bak.bak
if [ $# != 5 ]
then
	echo "Arguments needed: IP address, initial port, number of clients, operation count, time to start"
	exit 1
fi

ip=$1
initial_port=$2
num_clients=$3
opcount=$4
sleep_time=$5
iter=0
bash ./ycsb_scripts/sleep_time.sh $sleep_time
retn_val=$?
if [ "$retn_val" == "0" ]
then 
	while [ "$iter" -lt "$num_clients" ]
	#while [ "$iter" -lt 15 ]
	do 
		port=`expr $initial_port + $iter` 
		echo `expr $port`
		bin/ycsb run kaiju -p hosts=155.98.38.$ip:$port -p port=$port -P workloads/workloada -p operationcount=$opcount -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -p time=10000 -p valuesize=1 &
		iter=`expr $iter + 1`
	done
else
	echo "Couldn't run the YCSB client"
fi

#bin/ycsb load kaiju -p hosts=127.0.0.1:9810,128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=2 -s
#bin/ycsb load kaiju -p hosts=128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
#bin/ycsb load kaiju -p hosts=128.174.244.87:9910,127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
