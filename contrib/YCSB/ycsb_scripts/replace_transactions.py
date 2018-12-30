import sys
import re
import os



path=sys.argv[1]
ip=sys.argv[2]
tmp=sys.argv[3]
MAPPING=sys.argv[4]

def all_keys_in_mapping(keys):
    for key in keys:
        if key not in mappings:
            return False
    return True

def parseTxns(FILE):
    txns = []
    for line in open(FILE).readlines():
        if not line.startswith("[beg]") or  not line.endswith("[sep]\n"):
	    continue
        if "[eor]" in line:
	    keys = re.findall("(user\d+)\[eor\]", line)
	    keys2 = ["read(\"%s\")" % key for key in keys]
        elif "[eok]" in line:
            pairs = re.findall("(user\d+)\[eok\](.*?)\[eov\]", line)
	    keys = [x[0] for x in pairs]	
    	    keys2 = ["write(\"%s\",\"%s\")" % (pair[0], pair[1]) for pair in pairs]
    	if not all_keys_in_mapping(keys):
            continue
        txns.append(" ".join(keys2))

    res = []
    for i in range(0, len(txns)):
        id = i+1
        r = "< tid(l(self,clientId),%s) : Txn | operations : %s, latest : empty, txnSqn : %s, readSet : empty >" % (id, txns[i], id)
        res.append(r)
    part1 = len(res)
    part2= "( "+" ;; ".join(res)+" )"
    return (part1, part2)

import os
def merge_files(path, ip):
    res = ""
    for name in os.listdir(path):
        if name.startswith(ip+"_"):
            res += open(path+"/"+name).read()
    f = open(path+"/"+ip, "w")
    f.write(res)
    f.close()

mappings = set()

for line in open(MAPPING).readlines():
    parts = line.split(",")
    mappings.add(parts[0])


content = open(path).read()
merge_files(tmp, ip)
res = parseTxns(tmp+"/"+ip)

content = content.replace("$p4$", str(res[0]))
content = content.replace("$p5$", res[1])

f = open(path,"w")
f.write(content)
f.close()
