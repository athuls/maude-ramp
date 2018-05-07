cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_client_side
sed -i -- 's/numberOfServerSockets = [0-9]*/numberOfServerSockets = /g' client$1.maude
#sed -i -- 's/addr1 = "155.98.38.[0-9]*/addr1 = "155.98.38.'$2'/g' client$1.maude
#../maude-binaries/maude.linux64 client2.maude > /run/shm/maude_client2_logs.txt
