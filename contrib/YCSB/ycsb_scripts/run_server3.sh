cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
rm /run/shm/*
sed -i -- 's/155.98.38.[0-9]*/155.98.38.'$1'/g' server3.maude
../maude-binaries/maude.linux64 server3.maude > /run/shm/maude_server3_logs.txt
