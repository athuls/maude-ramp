bin/ycsb load kaiju -p hosts=127.0.0.1:8810 -p port=8810 -P workloads/workloada -p operationcount=1000 -p maxexecutiontime=30 -p isolation_level=READ_ATOMIC -p read_atomic_algorithm=KEY_LIST -s
