#!/bin/sh

echo "updating ..pelase wait"
## more useful for ONlY MX
#extra-spamassassin-data/FromNotReplyTo.cf
#extra-spamassassin-data/FromNotReplyToSameDomain.cf
#extra-spamassassin-data/MultipleFromAT-rules.cf
#extra-spamassassin-data/MXDomainCheckFromTo-rules.cf
## useful for filtering in dovecot or outlook based on custom flag
## X-Spam-Promotions: YES
#extra-spamassassin-data/promotions-mail-tagging.cf

/bin/cp -pR extra-spamassassin-data/* /etc/mail/spamassassin/

cd ti-spam-filter
./makecf-ti-spam-content.sh
cd -
echo "Done";
