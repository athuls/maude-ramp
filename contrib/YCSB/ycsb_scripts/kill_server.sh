#kill -9 $(ps aux | grep '[r]un_server'$1'.sh' | awk '{print $2}')
kill -2 $(ps aux | grep '[s]erver'$1'\.maude' | awk '{print $2}')
