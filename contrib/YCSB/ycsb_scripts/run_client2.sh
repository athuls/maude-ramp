cd ..
cd ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
rm /run/shm/*
../maude-binaries/maude.linux64 client2.maude > /run/shm/maude_client2_logs.txt
