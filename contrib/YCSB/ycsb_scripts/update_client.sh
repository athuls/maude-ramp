cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
rm /run/shm/*
sed -i -- 's/self = "155.98.38.[0-9]*/self = "155.98.38.'$1'/g' client1.maude
sed -i -- 's/addr1 = "155.98.38.[0-9]*/addr1 = "155.98.38.'$2'/g' client1.maude
../maude-binaries/maude.linux64 client1.maude > /run/shm/maude_client1_logs.txt
