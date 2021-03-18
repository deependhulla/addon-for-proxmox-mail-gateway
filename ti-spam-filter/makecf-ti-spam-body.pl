#!/usr/bin/perl
$filepath="ti-filter-body-and-header-data.txt";
open(SPAMCF,">/etc/mail/spamassassin/ti-body-spam-check.cf");

$ex=0;
open(ERTX,"<$filepath");
while(<ERTX>)
{

$bodyline=$_;
$bodylinetest=$_;
$bodyline =~ s/[\n|\r]//g;
$bodylinetest =~ s/[\n|\r]//g;
$bodylinetest =~ s/ //g;

$bodyline =~ s/'/\\'/g;
$bodyline =~ s/!/\\!/g;

$bodyline =~ s/\./\\./g;

$bodyline =~ s/\~/\\~/g;
$bodyline =~ s/\#/\\#/g;
$bodyline =~ s/\$/\\\$/g;
$bodyline =~ s/\%/\\%/g;
$bodyline =~ s/\^/\\^/g;
$bodyline =~ s/\&/\\&/g;
$bodyline =~ s/\*/\\*/g;
$bodyline =~ s/\(/\\(/g;
$bodyline =~ s/\)/\\)/g;
$bodyline =~ s/\_/\\_/g;
$bodyline =~ s/\+/\\+/g;
$bodyline =~ s/\|/\\|/g;
$bodyline =~ s/\:/\\:/g;
$bodyline =~ s/\;/\\;/g;
$bodyline =~ s/\`/\\`/g;
$bodyline =~ s/\"/\\"/g;
$bodyline =~ s/\,/\\,/g;
$bodyline =~ s/\{/\\{/g;
$bodyline =~ s/\[/\\[/g;
$bodyline =~ s/\}/\\}/g;
$bodyline =~ s/\@/\\@/g;
$bodyline =~ s/\]/\\]/g;
$bodyline =~ s/\</\\</g;
$bodyline =~ s/\>/\\>/g;
$bodyline =~ s/\?/\\?/g;
#$bodyline =~ s/\@/\\@/g;

if($bodylinetest ne "")
{
$ex++;
$spamline="rawbody TI_B".$ex." /\\b".$bodyline."\\b/i";
print SPAMCF $spamline;
print SPAMCF "\n";

$spamline="describe TI_B".$ex." body has content [".$bodyline."] which look like spam";
print SPAMCF $spamline;
print SPAMCF "\n";

$spamline="score TI_B".$ex." 24.1";
print SPAMCF $spamline;
print SPAMCF "\n\n";
}


}
close(ERTX);
close(SPAMCF);


