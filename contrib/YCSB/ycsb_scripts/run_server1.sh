cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
rm /run/shm/*
sed -i -- 's/155.98.38.[0-9]*/155.98.38.'$1'/g' server1.maude
../maude-binaries/maude.linux64 server1.maude > ./logs/maude_server1_logs.txt
