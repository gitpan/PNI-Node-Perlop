use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Or;

my $or = PNI::Node::Perlop::Or->new;

isa_ok $or, 'PNI::Node::Perlop::Or';
is $or->label, 'or', 'label';

my $in1 = $or->in(1);
my $in2 = $or->in(2);
my $out = $or->out;

$or->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = 0;
$b = 1;
$c = ( $a or $b );

$in1->data($a);
$in2->data($b);
$or->task;
is $out->data, $c, 'a or b = c';

