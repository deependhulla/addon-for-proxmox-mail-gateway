#!/bin/sh

apt-get update
## first let system up-to-date , check your subscription is configured.
apt-get -y upgrade
apt-get -y dist-upgrade
## basic extra package for troubleshooting and data copy and mangement
apt-get -y install git mc iptraf screen vim ethtool net-tools sshfs wget elinks dos2unix unbound dnsutils

## php only cli tool for fast and easy scrpting
apt-get -y install php-cli

#command line sendemail tool
apt-get -y install sendemail

## copy pfHandle tool and etc-backup script
cp extra-tools/etc-config-backup.sh /bin/
cp extra-tools/pfHandle /bin/
echo "Taking Backup of etc folder";
/bin/etc-config-backup.sh

echo "Done.";
## clamav-unofficial-sigs
## you can install via apt-get install but please checkout
## https://github.com/extremeshok/clamav-unofficial-sigs/blob/master/guides/ubuntu-debian.md
## The clamav-unofficial-sigs script provides a simple way to download, test, and update third-party signature databases 
## provided by Sanesecurity, FOXHOLE, OITC, Scamnailer, BOFHLAND, CRDF, Porcupine, Securiteinfo, MalwarePatrol, 
## Yara-Rules Project, urlhaus, MalwareExpert, interServer etc.

