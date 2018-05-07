kill -9 $(ps aux | grep '[y]csb' | awk '{print $2}')
