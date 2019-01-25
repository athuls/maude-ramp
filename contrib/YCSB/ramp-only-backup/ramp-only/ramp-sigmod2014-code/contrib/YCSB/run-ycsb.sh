# We need to change the #threads in -threads parameter in order to change threads per client instancee

if [ "$#" = "1" ]
then
	bin/ycsb run kaiju -p hosts=$1:8080 -threads 1 -p port=8080 -P workloads/workloada -p operationcount=4000 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
elif [ "$#" = "2" ]
then
	bin/ycsb run kaiju -p hosts=$1:8080,$2:8080 -threads 1 -p port=8080 -P workloads/workloada -p operationcount=4000 -p maxexecutiontime=1 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
elif [ "$#" = "3" ]
then
	bin/ycsb run kaiju -p hosts=$1:8080,$2:8080,$3:8080 -threads 1 -p port=8080 -P workloads/workloada -p operationcount=4000 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
elif [ "$#" = "4" ]
then
	bin/ycsb run kaiju -p hosts=$1:8080,$2:8080,$3:8080,$4:8080 -threads 1 -p port=8080 -P workloads/workloada -p operationcount=4000 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
elif [ "$#" = "5" ]
then
	bin/ycsb run kaiju -p hosts=$1:8080,$2:8080,$3:8080,$4:8080,$5:8080 -threads 1 -p port=8080 -P workloads/workloada -p operationcount=4000 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
else 
	echo "Fix your input arguments"
fi

