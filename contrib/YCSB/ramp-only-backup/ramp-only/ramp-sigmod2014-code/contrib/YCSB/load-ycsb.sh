# cd /users/nobi/ramp-only/ramp-sigmod2014-code/contrib/YCSB
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/ramp-only-backup/ramp-only/ramp-sigmod2014-code/contrib/YCSB
if [ "$#" = "1" ]
then
	bin/ycsb load kaiju -p hosts=$1:8080 -p port=8080 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=1 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "2" ]
then
	bin/ycsb load kaiju -p hosts=$1:8080,$2:8080 -p port=8080 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=2 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "3" ]
then
	bin/ycsb load kaiju -p hosts=$1:8080,$2:8080,$3:8080 -p port=8080 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=3 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "4" ]
then
	bin/ycsb load kaiju -p hosts=$1:8080,$2:8080,$3:8080,$4:8080 -p port=8080 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=4 -p time=10000 -p valuesize=1 -s
elif [ "$#" = "5" ]
then
	bin/ycsb load kaiju -p hosts=$1:8080,$2:8080,$3:8080,$4:8080,$5:8080 -p port=8080 -P workloads/workloada_load -p operationcount=1 -p maxexecutiontime=30000 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=5 -p time=10000 -p valuesize=1 -s
else 
	echo "Fix your input arguments"
fi


#bin/ycsb run kaiju -p hosts=127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=2 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=1 -s
#bin/ycsb load kaiju -p hosts=127.0.0.1:9810,128.174.244.87:9810 -p port=9810 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -p threads=2 -s
#bin/ycsb load kaiju -p hosts=127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
#bin/ycsb load kaiju -p hosts=128.174.244.87:9910,127.0.0.1:9910 -p port=9910 -P workloads/workloada -p operationcount=1 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -postload -s
