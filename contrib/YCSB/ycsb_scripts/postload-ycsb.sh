#rm keyMappings.txt
#bin/ycsb load kaiju -p hosts=128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -s
#bin/ycsb run kaiju -p hosts=127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=2 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -s
#bin/ycsb load kaiju -p hosts=127.0.0.1:9810,128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=2 -s
cd /users/nobi/ramp/maude-ramp/contrib/YCSB
cat keyMappings1* > keyMappings.txt
if [ "$#" = "2" ]
then
	#bin/ycsb load kaiju -p hosts=155.98.39.$1:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$1:$2 -p port=$2 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
elif [ "$#" = "4" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:$2 -p port=$2 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$3:$4 -p port=$4 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
elif [ "$#" = "6" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:$2 -p port=$2 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$3:$4 -p port=$4 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$5:$6 -p port=$6 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
elif [ "$#" = "8" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:$2 -p port=$2 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$3:$4 -p port=$4 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$5:$6 -p port=$6 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$7:$8 -p port=$8 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
elif [ "$#" = "10" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:$2 -p port=$2 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$3:$4 -p port=$4 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$5:$6 -p port=$6 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$7:$8 -p port=$8 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
	bin/ycsb load kaiju -p hosts=155.98.39.$9:$10 -p port=$10 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p time=10000 -p valuesize=1 -postload -s &
else
	echo "Fix your input arguments"
fi
#bin/ycsb load kaiju -p hosts=128.174.244.87:9910,127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
