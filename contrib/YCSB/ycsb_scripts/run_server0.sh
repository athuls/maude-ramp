cd /users/nobi/ramp/maude-ramp/contrib/YCSB/maude-middleware/maude_server_side
sed -i -- 's/155.98.39.[0-9]*/155.98.39.'$1'/g' init-server0.maude
../maude-binaries/alpha118/maude init-server0.maude > /proj/Confluence/maude/debug_logs/temp/maude_server0_logs.txt 2>&1
