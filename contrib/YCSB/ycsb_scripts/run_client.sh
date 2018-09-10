# To run: bash run_client5.sh 44 9910 3
#!/bin/bash
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
if [ $# == 4 ] 
then
	ip=$1
	initial_port=$2
	clientid=$3
	num_client_instances=$4
	iter=0
	while [ "$iter" -lt "$num_client_instances" ]
	do
		port=`expr $initial_port + $iter`
		cp init-client.maude init-client"$clientid"_"$iter".maude
		sed -i -- 's/self = "155.98.39.[0-9]*/self = "155.98.39.'$ip'/g' init-client"$clientid"_"$iter".maude
		sed -i -- 's/[0-9]*, 10) .  \*\*\* opened for txns/'$port', 10) .  \*\*\* opened for txns/g' init-client"$clientid"_"$iter".maude
		sed -i -- 's/clientId = [0-9]*/clientId = '$iter'/g' init-client"$clientid"_"$iter".maude
		../maude-binaries/alpha118/maude init-client"$clientid"_"$iter".maude > /proj/Confluence/maude/debug_logs/temp/maude_client"$clientid"_logs_"$iter".txt 2>&1 &
		sleep 1
		iter=`expr $iter + 1`
	done
else
	echo "Provide 4 arguments: (1) IP address, (2) initial_txn_port, (3) client ID, (4) #instances"
fi
