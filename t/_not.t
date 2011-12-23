use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Not;

my $not = PNI::Node::Perlop::Not->new;

isa_ok $not, 'PNI::Node::Perlop::Not';
is $not->label, 'not', 'label';

my $in1 = $not->in(1);
my $out = $not->out;

$not->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = 0;
$c = not $a;

$in1->data($a);
$not->task;
is $out->data, $c, 'c = not a';

