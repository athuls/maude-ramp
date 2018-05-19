# To run: bash run_client1.sh 44 154 17:52:50.12345
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
rm /run/shm/*
sed -i -- 's/self = "155.98.38.[0-9]*/self = "155.98.38.'$1'/g' client2.maude
sed -i -- 's/addr1 = "155.98.38.[0-9]*/addr1 = "155.98.38.'$2'/g' client2.maude

current_epoch=$(date +%s.%N)
#target_epoch=$(date -d "17:50:00.12345" +%s.%N)
target_epoch=$(date -d "$3" +%s.%N)

sleep_seconds=$(echo "$target_epoch - $current_epoch"|bc)
echo $sleep_seconds

#if [[ $(echo "$sleep_seconds" | bc) -ne $(echo "0" | bc) ]]
if [[ $(bc -l <<< "$sleep_seconds" > 0) -eq 0 ]]
then
	echo "Sleep is fine"
	echo $sleep_seconds
	sleep $sleep_seconds
	../maude-binaries/maude.linux64 client2.maude > /run/shm/maude_client2_logs.txt
else
	echo "Sleep time is negative"
	exit 1
fi
