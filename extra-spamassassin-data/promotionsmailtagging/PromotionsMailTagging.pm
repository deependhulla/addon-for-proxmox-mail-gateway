package PromotionsMailTagging;
1;

use strict;

use Mail::SpamAssassin;
use Mail::SpamAssassin::Plugin;
our @ISA = qw(Mail::SpamAssassin::Plugin);

sub new {
        my ($class, $mailsa) = @_;
        $class = ref($class) || $class;
        my $self = $class->SUPER::new( $mailsa );
        bless ($self, $class);
        $self->register_eval_rule ( 'check_for_promotions' );
        return $self;
}

## check for various header for promotions
sub check_for_promotions {
my $promsg="";
        my ($self, $msg) = @_;
my $filename = '/etc/mail/spamassassin/promotionsmailtagging/promotions.ini';
open(my $fh, '<:encoding(UTF-8)', $filename);
my @prorule=();my $pi=-1;my $pj=0;
while (my $row = <$fh>) {
  chomp $row;
my @words = split /\[/, $row;
#  print "$row\n";
my $wl=@words;
if($wl==2 && $words[0] eq "")
{
$pi++;$pj=0;$prorule[$pi]=();$prorule[$pi][$pj]=$row;
#print "\n0 [$wl]->".$words[1];
}

if($wl==1 && $words[0] ne "")
{
$pj++;
$prorule[$pi][$pj]=$row;
#print "\nKEY [$wl]->".$words[0];
}
}
close $fh ; 
## while over
my $foundtag=0;

#print "\n##################\n";
#use Data::Dumper;
#print Dumper(\%$msg->);
#print $msg->header_order;
#print "\n##################\n";

for(my $e=0;$e<@prorule;$e++)
{
#print "\n $e -> 0 ".$prorule[$e][0];
#print "\n ##### \n $e -> [rule key-value] ".$prorule[$e][1];
my $cval="";
my @bkv = split/: /,$prorule[$e][1];
my $bkvs=@bkv;
if($bkvs==2){$cval=$bkv[1];}
       my $xval = $msg->get( $bkv[0],'' );
#print "\n$bkvs -->".$xval."<--[CHECK : $cval] \n XXXXXXXXXXX \n";
if($xval ne "")
{
my $xval2="ABCXYZA".$xval."ABCXYZA";
my @cbkv = split/$cval/,$xval2;
my $cbkvs=@cbkv;

#print "\n  [FINAL: $cbkvs]";
if($cbkvs>1)
{
if($promsg ne ""){$promsg=$promsg.",";}
$promsg=$promsg.$prorule[$e][0];
$foundtag=1;
}
####
}

}


if($foundtag==0)
{
$msg->set_tag('PROMOTAGVAL', 'NO'); 
$msg->set_tag('PROMODETAILS', 'NONE'); 
}

# Mail::SpamAssassin::Plugin::dbg( "Promotions Check" );

if($foundtag==1)
{ 
$msg->set_tag('PROMOTAGVAL', 'YES'); 
$msg->set_tag('PROMODETAILS', $promsg); 
return 1;
}

        return 0;
}
