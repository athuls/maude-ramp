cd ~/ramp/maude-ramp/contrib/YCSB/ramp-only-backup/ramp-only/ramp-sigmod2014-code

if [ $# != 1 ]
then
	echo "Arguments needed: IP address"
	exit 1
fi

IP=$1

java -XX:+UseParallelGC -Djava.library.path=/usr/local/lib -Dlog4j.configuration=file:./src/main/resources/log4j.properties -jar target/kaiju-1.0-SNAPSHOT.jar -kaiju_port 9810 -id 0 -cluster $IP:9810 -thrift_port 8080 -isolation_level READ_ATOMIC -ra_algorithm KEY_LIST -max_object_size 16384 -drop_commit_pct 0 -check_commit_delay_ms -1
