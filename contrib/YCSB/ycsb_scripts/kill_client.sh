kill -USR1 $(ps aux | grep '[r]un_client'$1'.sh' | awk '{print $2}')
kill -9 $(ps aux | grep '[r]un_client'$1'.sh' | awk '{print $2}')
#kill -2 $(ps aux | grep '[c]lient'$1'\.maude' | awk '{print $2}')
