# addon-for-proxmox-mail-gateway6
Addon For Proxmox Mail Gateway for More filter

## extra spamassassin data
updated via 03-upate-spamassassin.sh
Adds marking & scoring for
- Promotional Tagging
- MX Domain Check for FROM and TO
- Multiple FROM address in name & email-address
- From address not same Reply To
- From address not having common/same domain for Reply-To
- Also adding extra content filter from header/subject/body using ti-spam-filter


## import-blacklist-tools
Add Blacklist of email,domain,IP, from console;
which is shown under PMG Admin Panel -> Mail-Filter -> Who Objects -> Blacklist
