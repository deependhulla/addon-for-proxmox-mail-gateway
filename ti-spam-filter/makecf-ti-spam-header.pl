#!/usr/bin/perl

$filepath="ti-filter-body-and-header-data.txt";
open(SPAMCF,">/etc/mail/spamassassin/ti-header-spam-check.cf");


$ex=0;
open(ERTX,"<$filepath");
while(<ERTX>)
{

$headerline=$_;
$headerlinetest=$_;
$headerline =~ s/[\n|\r]//g;
$headerlinetest =~ s/[\n|\r]//g;
$headerlinetest =~ s/ //g;

$headerline =~ s/'/\\'/g;
$headerline =~ s/!/\\!/g;
$headerline =~ s/\./\\./g;
$headerline =~ s/\@/\\@/g;
$headerline =~ s/\~/\\~/g;
$headerline =~ s/\#/\\#/g;
$headerline =~ s/\$/\\\$/g;
$headerline =~ s/\%/\\%/g;
$headerline =~ s/\^/\\^/g;
$headerline =~ s/\&/\\&/g;
$headerline =~ s/\*/\\*/g;
$headerline =~ s/\(/\\(/g;
$headerline =~ s/\)/\\)/g;
$headerline =~ s/\_/\\_/g;
$headerline =~ s/\+/\\+/g;
$headerline =~ s/\|/\\|/g;
$headerline =~ s/\:/\\:/g;
$headerline =~ s/\;/\\;/g;
$headerline =~ s/\`/\\`/g;
$headerline =~ s/\"/\\"/g;
$headerline =~ s/\,/\\,/g;
$headerline =~ s/\{/\\{/g;
$headerline =~ s/\[/\\[/g;
$headerline =~ s/\}/\\}/g;
$headerline =~ s/\]/\\]/g;
$headerline =~ s/\</\\</g;
$headerline =~ s/\>/\\>/g;
$headerline =~ s/\?/\\?/g;
#$headerline =~ s/\@/\\@/g;


if($headerlinetest ne "")
{
$ex++;
$spamline="header TI_H".$ex." ALL =~/".$headerline."/i";
print SPAMCF $spamline;
print SPAMCF "\n";

$spamline="describe TI_H".$ex." header has content [".$headerline."] which look like spam";
print SPAMCF $spamline;
print SPAMCF "\n";

$spamline="score TI_H".$ex." 24.1";
print SPAMCF $spamline;
print SPAMCF "\n\n";
}


}
close(ERTX);
close(SPAMCF);



