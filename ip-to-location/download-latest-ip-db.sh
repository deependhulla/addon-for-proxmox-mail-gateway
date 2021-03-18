##!/bin/sh
cd /usr/local/src/ip-to-location/
rm -rf IP2LOCATION-LITE-DB1.BIN.ZIP
wget -c https://download.ip2location.com/lite/IP2LOCATION-LITE-DB1.BIN.ZIP

unzip -o IP2LOCATION-LITE-DB1.BIN.ZIP

cd - 
