kill -USR1 $(ps aux | grep '[i]nit-client' | awk '{print $2}')
kill -9 $(ps aux | grep '[r]un_client.sh' | awk '{print $2}')
kill -9 $(ps aux | grep '[i]nit-client' | awk '{print $2}')
