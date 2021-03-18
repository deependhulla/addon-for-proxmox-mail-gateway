#!/bin/sh

/bin/cp -pR extra-spamassassin-data/* /etc/mail/spamassassin/

cd ti-spam-filter
./makecf-ti-spam-content.sh
cd -
