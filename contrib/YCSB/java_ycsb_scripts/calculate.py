import sys
import os

if len(sys.argv)<1:
    print("Usage: folder_path")
    sys.exit(0)

folder = sys.argv[1]
count=0
res_sum = 0

for name in os.listdir(folder):
    lines = open(folder+"/"+name).readlines()
    for line in lines:
        if "[OVERALL]" in line and "Throughput" in line:
            value = line.split(",")[2]
	    count+=1
            res_sum+=float(value)


print("Count:%s" % count)
print("Total:%s" % res_sum)
