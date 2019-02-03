
cd /home/ubuntu/efs/maude-ramp
mvn package

cd /home/ubuntu/efs/maude-ramp/contrib/YCSB
mvn package

sh install-kaiju-jar.sh 
