#cd /users/nobi/ramp-only/ramp-sigmod2014-code
cd /users/nobi/ramp/maude-ramp/contrib/YCSB/ramp-only-backup/ramp-only/ramp-sigmod2014-code/
mvn clean package
cd contrib/YCSB
sh install-kaiju-jar.sh
mvn package
 
