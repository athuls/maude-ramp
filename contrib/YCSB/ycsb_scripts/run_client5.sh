# To run: bash run_client5.sh 44 9910 3
#!/bin/bash
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
if [ $# == 3 ] 
then
	ip=$1
	initial_port=$2
	num_clients=$3
	iter=0
	while [ "$iter" -lt "$num_clients" ]
	do
		port=`expr $initial_port + $iter`
		cp init-client5.maude init-client5_$iter.maude
		sed -i -- 's/self = "155.98.39.[0-9]*/self = "155.98.39.'$ip'/g' init-client5_$iter.maude
		sed -i -- 's/[0-9]*, 10) .  \*\*\* opened for txns/'$port', 10) .  \*\*\* opened for txns/g' init-client5_$iter.maude
		../maude-binaries/alpha118/maude init-client5_$iter.maude > /proj/Confluence/maude/debug_logs/temp/maude_client5_logs_$iter.txt 2>&1
		sleep 1
		iter=`expr $iter + 1`
	done
else
	echo "Provide 3 arguments: (1) IP address, (2) initial_port, (3) #instances"
fi
