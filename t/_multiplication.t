use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Multiplication;

my $multiplication = PNI::Node::Perlop::Multiplication->new;

isa_ok $multiplication, 'PNI::Node::Perlop::Multiplication';
is $multiplication->label, '*', 'label';

my $in1 = $multiplication->in(1);
my $in2 = $multiplication->in(2);
my $out = $multiplication->out;

$multiplication->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = -rand(100);
$b = rand(100);
$c = $a * $b;

$in1->data($a);
$in2->data($b);
$multiplication->task;
is $out->data, $c, 'a*b=c';

