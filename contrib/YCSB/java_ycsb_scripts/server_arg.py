import sys
args = []

for i in range(1, len(sys.argv)):
    args.append(sys.argv[i]+":"+"9810")
print(",".join(args))
