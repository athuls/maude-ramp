if [ $# != 4 ]
then
	echo "Arguments needed: IP address, server instance ID, inital port for maude clients, #maude clients per node"
	exit 1
fi
current=`pwd`

# Update the server IP address
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
path=init-server$2.maude
cp init-server.maude.original $path

python $current/replace_run_server.py $path $1 $3 $4 /users/nobi/tmp

