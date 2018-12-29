import sys
import re

path = sys.argv[1]
ip = sys.argv[2]
port = int(sys.argv[3])
num = int(sys.argv[4])
tmp = sys.argv[5]

def parseLoad(FILE):
    pairs = []
    for line in open(FILE).readlines():
        if not line.startswith("[beg]") or  not line.endswith("[sep]\n"):
	    continue
       	tmp = re.findall("(user\d+)\[eok\](.*?)\[eov\]", line)
        pairs.extend(tmp)
    res1 =[]
    res2=[]
    for pair in pairs:
        res1.append("version(\"%s\",\"%s\",ts(dftOid,0),empty)" % (pair[0], pair[1]))
        res2.append("\"%s\" |-> ts(dftOid,0)" % pair[0])
    part1 = "( "+ ", ".join(res1) +" )"
    part2 = "( "+ ", ".join(res2) +" )"
    return part1, part2


content = open(path).read()

content = content.replace("$1", ip)
content = content.replace("$2", str(num))

res = parseLoad(tmp+"/"+ip)

content = content.replace("$3", res[0])
content = content.replace("$4", res[1])

c = "createServerTcpSocket(socketManager, l(self), %s, 10)\n"
create = ""
for i in range(0, num):
    new_port = port+i
    create+=  c % new_port

content = content.replace("$5", create)

f = open(path,"w")
f.write(content)
f.close()

