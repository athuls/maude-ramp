if [ $# != 3 ]
then
	echo "Arguments needed: client_id, #of instances, time_to_start"
	exit 1
fi


cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
script_dir=~/ramp/maude-ramp/contrib/YCSB/ycsb_scripts

clientid=$1
num_client_instances=$2
sleep_time=$3
iter=0

# Empty log directory for clients before starting client processes
rm -rf /proj/Confluence/maude/debug_logs/temp/client_logs"$clientid"
mkdir /proj/Confluence/maude/debug_logs/temp/client_logs"$clientid"

bash $script_dir/sleep_time.sh $sleep_time
retn_val=$?
if [ "$retn_val" -eq "0" ]
then 
	while [ "$iter" -lt "$num_client_instances" ]
	do
		echo "**********************************"
		../maude-binaries/alpha118/maude init-client"$clientid"_"$iter".maude > /proj/Confluence/maude/debug_logs/temp/client_logs"$clientid"/maude_client"$clientid"_logs_"$iter".txt 2>&1 &
		sleep 1
		iter=`expr $iter + 1`
	done	
else
	echo "Couldn't run the YCSB client"
fi
