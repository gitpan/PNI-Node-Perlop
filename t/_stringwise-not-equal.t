use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Stringwise_not_equal;

my $not_equal = PNI::Node::Perlop::Stringwise_not_equal->new;

isa_ok $not_equal, 'PNI::Node::Perlop::Stringwise_not_equal';
is $not_equal->label, 'ne', 'label';

my $in1 = $not_equal->in(1);
my $in2 = $not_equal->in(2);
my $out = $not_equal->out;

$not_equal->task;
is $out->data, undef, 'default task';

my $a = 'foo';
my $b = 'bar';

$in1->data($a);
$in2->data($b);
$not_equal->task;
ok $out->data, 'a ne b';

