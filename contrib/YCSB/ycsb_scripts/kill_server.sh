kill -USR1 $(ps aux | grep '[i]nit-server' | awk '{print $2}')
#kill -USR1 $(ps aux | grep '[i]nit-server'$1'.maude' | awk '{print $2}')
kill -9 $(ps aux | grep '[r]un_server.sh' | awk '{print $2}')
kill -9 $(ps aux | grep '[i]nit-server' | awk '{print $2}')
#kill -9 $(ps aux | grep '[i]nit-server'$1'.maude' | awk '{print $2}')
