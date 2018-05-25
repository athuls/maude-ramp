if [ $# != 2 ]
then
	echo "Arguments needed: time to start, client ID"
	exit 1
fi

sleep_time=$1
client_id=$2

bash /users/nobi/ramp/maude-ramp/contrib/YCSB/ycsb_scripts/sleep_time.sh $sleep_time
retn_val=$?

if [ "$retn_val" == "0" ]
then
	echo "$client_id"
	echo "Killing"
	kill -9 $(ps aux | grep '[r]un_client'$client_id'.sh' | awk '{print $2}') &
	kill -2 $(ps aux | grep '[c]lient'$client_id'\.maude' | awk '{print $2}') &
	kill -9 $(ps aux | grep '[y]csb' | awk '{print $2}') &	
else
	echo "Couldn't kill YCSB client"
fi
