import sys
import re

path = sys.argv[1]
ip = sys.argv[2]
id = sys.argv[3]
tmp=sys.argv[4]

def parsePostLoad(FILE):
    pairs = []
    for line in open(FILE).readlines():
        if not line.startswith("[beg]") or  not line.endswith("[sep]\n"):
	    continue
       	tmp = re.findall("(user\d+)\[eok\](.*?)\[eoa\]", line)
        pairs.extend(tmp)
    res=[]
    for pair in pairs:
        res.append("\"%s\" |-> \"%s\"" % (pair[0], pair[1]))
    return "( "+ ", ".join(res) +" )"

import os
def merge_files(path, ip):
    res = ""
    for name in os.listdir(path):
        if name.startswith(ip+"_"):
            res += open(path+"/"+name).read()
    f = open(path+"/"+ip, "w")
    f.write(res)
    f.close()


content = open(path).read()

content = content.replace("$1", ip)
content = content.replace("$2", id)

merge_files(tmp, ip)
res = parsePostLoad(tmp+"/"+ip)

content = content.replace("$3", res)

f = open(path,"w")
f.write(content)
f.close()

