cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
rm /run/shm/*
sed -i -- 's/155.98.38.[0-9]*/155.98.38.'$1'/g' server0.maude
../maude-binaries/maude.linux64 -interactive server0.maude > /users/nobi/ramp/maude-ramp/contrib/YCSB/ycsb_scripts/logs/maude_server0_logs.txt
