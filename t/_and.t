use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::And;

my $and = PNI::Node::Perlop::And->new;

isa_ok $and, 'PNI::Node::Perlop::And';
is $and->label, 'and', 'label';

my $in1 = $and->in(1);
my $in2 = $and->in(2);
my $out = $and->out;

$and->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = 1;
$b = 0;
$c = ($a and $b);

$in1->data($a);
$in2->data($b);
$and->task;
is $out->data, $c, 'a and b = c';

