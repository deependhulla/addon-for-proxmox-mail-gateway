#!/bin/sh

### Setup smtpstore a dummy SMTP MTA to accetp mail 
### on 127.0.0.1 on port 25587
### so that double bounce and auto-reply to fake or false from address
### are not blacklisting our MX IP and we are freeing our MX from unwanted huge queue of 
### non-important mail queue of double bounce
### https://help.campaignmonitor.com/bounced-email-types
### https://www.cisco.com/c/en/us/support/docs/security/email-security-appliance/118243-troubleshoot-esa-00.html
## useful for honeypot the from-address
## you need to make sure smart relay is configured to use 127.0.0.1 and port 25587 for other delivery.

## NOTE : only thing is people would not get bounce back for unknow receipt , they would feel like mail is devliered.

### you need to check folder periodicaly and clean them from /var/spool/smtpstore

groupadd -g 89 vmail 2>/dev/null
useradd -g vmail -u 89 -d /home/powermail vmail 2>/dev/null

cp -pR smtpstore /opt/

 /opt/smtpstore/start.sh
