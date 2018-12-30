#!/bin/bash
source config.sh

if [ $# != 6 ]
then
        echo "Arguments needed: ip, client_id, #of instances, op_count ,time_to_start, time_to_end"
        exit 1
fi


./postload-ycsb.sh $1 $2 $3

#./run-ycsb.sh $1 $2 $3 $4

#./run_client.sh $2 $3 $5 & 

#./kill_ycsb.sh $6 &
