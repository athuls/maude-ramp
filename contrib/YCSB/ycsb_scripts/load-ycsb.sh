cd /users/nobi/ramp/maude-ramp/contrib/YCSB
rm keyMappings*
if [ "$#" = "1" ]
then
	bin/ycsb load kaiju -p hosts=155.98.38.$1:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "2" ]
then
	bin/ycsb load kaiju -p hosts=155.98.38.$1:9810,155.98.38.$2:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=2 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "3" ]
then
	bin/ycsb load kaiju -p hosts=155.98.38.$1:9810,155.98.38.$2:9810,155.98.38.$3:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=3 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "4" ]
then
	bin/ycsb load kaiju -p hosts=155.98.38.$1:9810,155.98.38.$2:9810,155.98.38.$3:9810,155.98.38.$4:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=4 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "5" ]
then
	bin/ycsb load kaiju -p hosts=155.98.38.$1:9810,155.98.38.$2:9810,155.98.38.$3:9810,155.98.38.$4:9810,155.98.38.$5:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=5 -p time=10000 -p valuesize=1 -s
else 
	echo "Fix your input arguments"
fi


#bin/ycsb run kaiju -p hosts=127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=2 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -s
#bin/ycsb load kaiju -p hosts=127.0.0.1:9810,128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=2 -s
#bin/ycsb load kaiju -p hosts=127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
#bin/ycsb load kaiju -p hosts=128.174.244.87:9910,127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
