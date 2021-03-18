package MXDomainCheckFromTo;
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
        $self->register_eval_rule ( 'check_for_MXDomainCheckFromTo' );
        return $self;
}

## check for various header for domains
sub check_for_MXDomainCheckFromTo {
my $promsg="";
        my ($self, $msg) = @_;
my $filename = '/etc/pmg/domains';
open(my $fh, '<:encoding(UTF-8)', $filename);
my @prorule=();my $pi=-1;my $pj=0;
while (my $row = <$fh>) {
  chomp $row;
#  print "$row\n";
if($row ne "")
{
$pj++;
$prorule[$pj]=$row;
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
my $Fromadd = $msg->get( 'From:' );
my $Toadd = $msg->get( 'To:addr' );
$Fromadd =~ s/\n//;
$Fromadd =~ s/\r//;

my $newfrom=lc("XZXZXZ ".$Fromadd." XZXZXZ");
my $newto=lc("XZXZXZ ".$Toadd." XZXZXZ");


for(my $e=0;$e<@prorule;$e++)
{

if(defined $prorule[$e] )
{
my $mxdomain=$prorule[$e];
my @fromx=split/$mxdomain/,$newfrom;
my $fcount=@fromx;
my @tox=split/$mxdomain/,$newto;
my $tcount=@tox;



# Mail::SpamAssassin::Plugin::dbg( "MXDomainCheckFromTo Log: ".$prorule[$e]." [".$fcount."/".$tcount."] -> ".$newfrom." ->".$newto );

if($fcount>1 && $tcount>1)
{ 
 Mail::SpamAssassin::Plugin::dbg( "MXDomainCheckFromTo Log: ".$prorule[$e]." [".$fcount."/".$tcount."] -> ".$newfrom." ->".$newto );
return 1;
}

## if value check over
}

## for loop over
}

        return 0;
}

