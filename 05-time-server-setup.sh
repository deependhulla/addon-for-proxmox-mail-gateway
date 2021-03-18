#!/bin/sh

echo "NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org" >> /etc/systemd/timesyncd.conf
timedatectl set-timezone 'Asia/Kolkata'
timedatectl set-ntp true 
timedatectl status

### changing timezone to Asia Kolkata
sed -i "s/;date.timezone =/date\.timezone \= \'Asia\/Kolkata\'/" /etc/php/7.3/cli/php.ini


systemctl restart  systemd-timedated systemd-timesyncd

## restart rsyslog show that mail.log shows proper time
/etc/init.d/rsyslog restart
