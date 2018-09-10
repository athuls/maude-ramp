if [ $# != 4 ]
then
	echo "Arguments needed: IP address, server instance ID, inital port for maude clients, #maude clients per node"
	exit 1
fi

# Update the server IP address
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
cp init-server.maude init-server$2.maude
sed -i -- 's/155.98.39.[0-9]*/155.98.39.'$1'/g' init-server$2.maude

# Update the socket count and create sockets for each of the clients
portcount=$4
socketcount=`expr $portcount + 1`
sed -i -- 's/numberOfServerSockets = [0-9]*/numberOfServerSockets = '$socketcount'/g' init-server$2.maude
sed -i '/START AUTOMATICALLY/,/END AUTOMATICALLY/{/START AUTOMATICALLY/!{/END AUTOMATICALLY/!d}}' init-server$2.maude

port=`expr $3 + $portcount - 1`
iter=-1
final_iter=`expr $portcount - 1`
echo "$final_iter $iter $port"
while [ "$final_iter" -gt "$iter" ]
do
	gawk -i inplace '/START AUTOMATICALLY/{print;print "\t    createServerTcpSocket(socketManager, l(self), '$port', 10)";next}1' init-server$2.maude

	port=`expr $port - 1`
	final_iter=`expr $final_iter - 1`
done
# End of updating server file

# Run server
../maude-binaries/alpha118/maude init-server$2.maude > /proj/Confluence/maude/debug_logs/temp/maude_server$2_logs.txt 2>&1
