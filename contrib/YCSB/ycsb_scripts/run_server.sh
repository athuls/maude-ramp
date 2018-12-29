if [ $# != 1 ]
then
	echo "Arguments needed: server instance ID"
	exit 1
fi


cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side

server_id=$1

# Clean up server logs directory
rm -rf /proj/Confluence/maude/debug_logs/temp/server_logs"$server_id"
mkdir /proj/Confluence/maude/debug_logs/temp/server_logs"$server_id"

# Run server
nohup ../maude-binaries/alpha118/maude init-server$server_id.maude > /proj/Confluence/maude/debug_logs/temp/server_logs$server_id/maude_server${server_id}_logs.txt 2>&1 &
