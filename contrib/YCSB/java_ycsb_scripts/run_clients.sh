#!/bin/bash
source config.sh

if [ $# -lt 3 ]
then
	echo "Arguments needed: #of instances, time_to_start, ip1, ip2,..."
	exit 1
fi

num_client_instances=$1
iter=0

while [ "$iter" -lt "$num_client_instances" ]
do
	echo "Run $iter"
	./run_client2.sh $iter $2 $3 $4 $5 $6 $7 & 
	iter=`expr $iter + 1`
done
