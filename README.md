# addon-for-proxmox-mail-gateway
Addon For Proxmox Mail Gateway 7.x for More filter

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
 - net-tools, old style tools like ifconfig
 - php-cli, for easy and fast scripting tools
 - sendemail, a command line smtp sendemail
 - dos2unix, a command line tool to change MS-Windows/DOS copy paste content to Unix Format , i.e. without Ctrl-M char.
 - unbound, useful for internal DNS chaching 
 - dnsutils, dig like too for DNS troubleshooting
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
- MX Domain Check for FROM and TO from relay_domain
- Multiple FROM address in name & email-address
- From address not same Reply To
- From address not having common/same domain for Reply-To
- Also adding extra content filter from header/subject/body using ti-spam-filter

## locales setup to en_US.UTF-8
updated via 04-set-locales.sh in case you want en_US.UTF-8 
- LC_TYPE
- LC_LANG
- LC_ALL

## time server setup
updated via 05-time-server-setup.sh 
- update time via time-ntp
- update zone to Asia/Kolkata
- update also php to Asia/Kolkata 

## extra smtp-store MTA setup
updated via 06-smtpstore-services.sh using qpsmtpd
- useful to store all double bounce for review
- useful for honeypot scanning
- useful to avoid blacklist of MX IP
- useful to avoid delivery of double bounce to  wrong From/Sender getting failure due to spammers mis-use

## ip-to-location
 useful get country details via ip2location lite DB for blocking ip or range of country spamming.

## sample-files
sample eciar virus and spam content for checking filter service

## import-blacklist-tools
Add Blacklist of email,domain,IP, from console;
which is shown under PMG Admin Panel -> Mail-Filter -> Who Objects -> Blacklist
