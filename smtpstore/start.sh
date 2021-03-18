#!/bin/sh



touch /var/log/smtpstore.log
chown -R vmail:vmail /var/log/smtpstore.log

chown -R vmail:vmail /opt/smtpstore
mkdir /var/spool/smtpstore 2>/dev/null
mkdir /var/spool/smtpstore/tmp 2>/dev/null
mkdir /var/spool/smtpstore/new 2>/dev/null
mkdir /var/spool/smtpstore/cur 2>/dev/null

chown vmail:vmail /var/spool/smtpstore
chown vmail:vmail /var/spool/smtpstore/tmp
chown vmail:vmail /var/spool/smtpstore/new
chown vmail:vmail /var/spool/smtpstore/cur

cd /opt/smtpstore/
./qpsmtpd-forkserver -l 127.0.0.1 -p 25587 -u vmail  -limit-connections 2000 -max-from-ip 1500 -d

