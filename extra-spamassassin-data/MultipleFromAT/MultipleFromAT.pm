package MultipleFromAT;
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
        $self->register_eval_rule ( 'check_for_MultipleFromAT' );
       
        return $self;
}

# Often spam uses different From: and Reply-To:
# while most legitimate e-mails does not.
sub check_for_MultipleFromAT {
        my ($self, $msg) = @_;

        #my $from = $msg->get( 'From:addr' );
        my $from = $msg->get( 'From:' );
#        $from =~ s/.*@//;
        my $Toaddress = $msg->get( 'To:addr' );
        $Toaddress =~ s/.*@//;
my @fromx=split/\@/,$from;
my $fcount=@fromx;

my @fromx1=split/\> </,$from;
my $fcount1=@fromx1;
        Mail::SpamAssassin::Plugin::dbg( "MultipleFromAT: Comparing '$from'/'$Toaddress' Fcount: $fcount / $fcount1" );

        if ( $fcount >2 && $fcount1 >1) {
                return 1;
        }

        return 0;
}
