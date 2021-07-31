#!/bin/sh

cp -pRv extra-tools/header_checks /etc/postfix/

## for Extra info in log ..like from,to,subject
postconf -e "header_checks = regexp:/etc/postfix/header_checks"

