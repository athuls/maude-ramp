#!/bin/bash

initial_txn_count=0

for file in /proj/Confluence/maude/debug_logs/temp/client_logs/*; do
    result=$(cat $file | grep -o -P "Monitor \| count : \K[0-9]+")
    if [ $result ]
    then
    	echo $result
        initial_txn_count=`expr $initial_txn_count + $result`
    fi
done

echo "Sum of txns count across all maude client instances on this node is: "
echo $initial_txn_count
