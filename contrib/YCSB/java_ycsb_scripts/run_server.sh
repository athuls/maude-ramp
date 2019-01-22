if [ $# -lt 1 ]
then
	echo "Arguments needed: server ID, IP address"
	exit 1
fi

id=$1
hosts=`python server_arg.py $@`

cd ~/ramp/maude-ramp/contrib/YCSB/ramp-only-backup/ramp-only/ramp-sigmod2014-code

# Copy dependencies fpr running server
sudo cp ../../libsigar-amd64-linux.so /usr/local/lib/

java -XX:+UseParallelGC -Djava.library.path=/usr/local/lib -Dlog4j.configuration=file:./src/main/resources/log4j.properties -jar target/kaiju-1.0-SNAPSHOT.jar -bootstrap_time 10000 -kaiju_port 9810 -id $id -cluster $hosts -thrift_port 8080 -isolation_level READ_ATOMIC -ra_algorithm KEY_LIST -max_object_size 16384 -drop_commit_pct 0 -check_commit_delay_ms -1 -outbound_internal_conn 1 -locktable_numlatches 1024
