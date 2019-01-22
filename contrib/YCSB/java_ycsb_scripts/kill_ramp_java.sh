kill -9 $(ps aux | grep '[j]ava' | awk '{print $2}')
