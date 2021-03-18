#!/bin/sh


## Make file for header and Body
## /etc/mail/spamassassin/ti-header-spam-check.cf
## /etc/mail/spamassassin/ti-body-spam-check.cf 
perl makecf-ti-spam-header.pl
perl makecf-ti-spam-body.pl
spamassassin --lint

systemctl restart pmg-smtp-filter

