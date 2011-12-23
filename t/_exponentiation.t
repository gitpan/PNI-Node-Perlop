use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Exponentiation;

my $exponentiation = PNI::Node::Perlop::Exponentiation->new;

isa_ok $exponentiation, 'PNI::Node::Perlop::Exponentiation';
is $exponentiation->label, '', 'label';

my $in1 = $exponentiation->in(1);
my $in2 = $exponentiation->in(2);
my $out = $exponentiation->out;

$exponentiation->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );
$a = -rand(100);
$b = rand(100);
$c = $a**$b;

$in1->data($a);
$in2->data($b);
$exponentiation->task;
is $out->data, $c, 'a**b=c';

