# To run: bash run_client5.sh 44 9910 3
#!/bin/bash
if [ $# != 3 ]
then 
	echo "Provide 5 arguments: (1) IP address, (4) client ID, (5) #instances"
	exit 1
fi

current=/users/nobi/ramp/maude-ramp/contrib/YCSB/ycsb_scripts
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
ip=$1
clientid=$2
instance_id=$3

path=init-client${clientid}_${instance_id}.maude
cp init-client.maude.original $path

python $current/replace_run_client.py $path $ip $instance_id /users/nobi/tmp

