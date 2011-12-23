use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Stringwise_equal;

my $equal = PNI::Node::Perlop::Stringwise_equal->new;

isa_ok $equal, 'PNI::Node::Perlop::Stringwise_equal';
is $equal->label, 'eq', 'label';

my $in1 = $equal->in(1);
my $in2 = $equal->in(2);
my $out = $equal->out;

$equal->task;
is $out->data, undef, 'default task';

my $a = 'foo';

$in1->data($a);
$in2->data($a);
$equal->task;
ok $out->data, 'a eq a';

