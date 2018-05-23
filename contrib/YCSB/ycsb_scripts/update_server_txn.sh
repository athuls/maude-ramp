cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
if [ $# != 4 ]
then
	echo "Arguments needed: ServerID, #clients, initialPort, backlog#"
	exit 1 
fi

portcount=`expr $2 / $4`
echo "$portcount"
socketcount=`expr $portcount + 3`
sed -i -- 's/numberOfServerSockets = [0-9]*/numberOfServerSockets = '$socketcount'/g' server$1.maude
#sed -i '/createServerTcpSocket/d' server$1.maude
sed -i '/START AUTOMATICALLY/,/END AUTOMATICALLY/{/START AUTOMATICALLY/!{/END AUTOMATICALLY/!d}}' server$1.maude

port=`expr $3 + $portcount - 1`
iter=-1
final_iter=`expr $portcount - 1`
echo "$final_iter $iter $port"
while [ "$final_iter" -gt "$iter" ]
do
	gawk -i inplace '/START AUTOMATICALLY/{print;print "\t    createServerTcpSocket(socketManager, l(self), '$port', 5)";next}1' server$1.maude

	port=`expr $port - 1`
	final_iter=`expr $final_iter - 1`
done

#sed -i -- 's/addr1 = "155.98.38.[0-9]*/addr1 = "155.98.38.'$2'/g' client$1.maude
#../maude-binaries/maude.linux64 client2.maude > /run/shm/maude_client2_logs.txt
