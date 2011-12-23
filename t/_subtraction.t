use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Subtraction;

my $subtraction = PNI::Node::Perlop::Subtraction->new;

isa_ok $subtraction, 'PNI::Node::Perlop::Subtraction';
is $subtraction->label, '-', 'label';

my $in1 = $subtraction->in(1);
my $in2 = $subtraction->in(2);
my $out = $subtraction->out;

$subtraction->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = -rand(100);
$b = rand(100);
$c = $a - $b;

$in1->data($a);
$in2->data($b);
$subtraction->task;
is $out->data, $c, 'a-b=c';

