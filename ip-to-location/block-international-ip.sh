#!/bin/sh


iptables -F

## single example of china ip block 
iptables -A INPUT -s 111.44.44.44/32 -j DROP

## single example of china ip block of 1-254 (/24) range
iptables -A INPUT -s 111.44.44.0/24 -j DROP

