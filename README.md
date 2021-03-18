# addon-for-proxmox-mail-gateway
Addon For Proxmox Mail Gateway for More filter

## Extra Packages 
updated via 01-extra-packages.sh for easy management & troubleshooting
 - Git tool
 - MC File-Manager and Editor
 - VIM Editor
 - SSHFS to mount file-system over ssh for config-backups.
 - screen tool for background terminal session work
 - ethtool to check ethernet
 - iptraf for bandwidth and traffic monitoring
 - elinks for console browsing
 - net-tools , old style tools like ifconfig
 - php-cli , for easy and fast scripting tools
 - sendemail , a command line smtp sendemail
 - clamav-unofficial-sigs ..optional
 
 ## extra bash script and tools
updated via 02-update-bash-tools.sh For better console performance
- interactive shell like RHEL/CentOS
- rc.local setup , in case to work out something after bootup.
- vim config update for copy-paste via console , by disabling visual feature.
- Perl Cpan auto-commit for cpan use.
- SSH keeplive update to avoid quick disconnection
 
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
