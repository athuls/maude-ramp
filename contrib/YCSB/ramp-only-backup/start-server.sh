java -XX:+UseParallelGC -Djava.library.path=/usr/local/lib -Dlog4j.configuration=file:./src/main/resources/log4j.properties -jar target/kaiju-1.0-SNAPSHOT.jar -kaiju_port 9810 -id 0 -cluster 155.98.38.114:9810 -thrift_port 8080 -isolation_level READ_ATOMIC -ra_algorithm KEY_LIST -max_object_size 16384 -drop_commit_pct 0 -check_commit_delay_ms -1
