cd /users/nobi/ramp/maude-ramp/contrib/YCSB
rm keyMappings*
if [ "$#" = "1" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=1 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "2" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:9810,155.98.39.$2:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=2 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "3" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:9810,155.98.39.$2:9810,155.98.39.$3:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=3 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "4" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:9810,155.98.39.$2:9810,155.98.39.$3:9810,155.98.39.$4:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=4 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "5" ]
then
	bin/ycsb load kaiju -p hosts=155.98.39.$1:9810,155.98.39.$2:9810,155.98.39.$3:9810,155.98.39.$4:9810,155.98.39.$5:9810 -p port=9810 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threadcount=5 -p time=10000 -p valuesize=1 -s
else 
	echo "Fix your input arguments: provide each server IP address as a separate argument"
fi
