cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
rm /run/shm/*
sed -i -- 's/155.98.38.[0-9]*/155.98.38.'$1'/g' init-server0.maude
../../../../../../alpha118/maude init-server0.maude >& /proj/Confluence/maude/debug_logs/temp/maude_server0_logs.txt
