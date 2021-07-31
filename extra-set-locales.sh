#!/bin/sh

## for proper UTF-8 scanning , if in trouble
### https://www.thomas-krenn.com/en/wiki/Perl_warning_Setting_locale_failed_in_Debian

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

## run below command and and only select en_US.UTF-8

dpkg-reconfigure locales
