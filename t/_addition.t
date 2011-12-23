use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Addition;

my $addition = PNI::Node::Perlop::Addition->new;

isa_ok $addition, 'PNI::Node::Perlop::Addition';
is $addition->label, '+', 'label';

my $in1 = $addition->in(1);
my $in2 = $addition->in(2);
my $out = $addition->out;

$addition->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = -rand(100);
$b = rand(100);
$c = $a + $b;

$in1->data($a);
$in2->data($b);
$addition->task;
is $out->data, $c, 'a+b=c';

