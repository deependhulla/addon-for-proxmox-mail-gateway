#!/bin/sh
echo "";
mkdir /etc-backup-files/ 2>/dev/bull
chmod 600 /etc-backup-files
## for safety purpose backup of orginal config
FOLDERX=`date +%Y_%m_%d_%H_%M_%S`
echo -n copying in /etc-backup-files/etc-bk-$FOLDERX ...
/bin/cp -pR /etc /etc-backup-files/etc-bk-$FOLDERX
echo -n .done.
echo "";
