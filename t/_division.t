use strict;
use warnings;
use Test::More tests => 5;

use PNI::Node::Perlop::Division;

my $division = PNI::Node::Perlop::Division->new;

isa_ok $division, 'PNI::Node::Perlop::Division';
is $division->label, '/', 'label';

my $in1 = $division->in(1);
my $in2 = $division->in(2);
my $out = $division->out;

$division->task;
is $out->data, undef, 'default task';

my ( $a, $b, $c );    # a / b = c
$a = rand(100);
$b = rand(100) + 1;
$c = $a / $b;

$in1->data($a);
$in2->data($b);
$division->task;
is $out->data, $c, 'a/b=c';

$in2->data(0);
$division->task;
is $out->data, undef, 'a/0 is undef';

