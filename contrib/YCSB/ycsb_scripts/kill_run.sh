kill -9 $(ps aux | grep '[y]csb' | awk '{print $2}')
kill -9 $(ps aux | grep '[k]aiju' | awk '{print $2}')
