use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Numerically_equal;

my $equal = PNI::Node::Perlop::Numerically_equal->new;

isa_ok $equal, 'PNI::Node::Perlop::Numerically_equal';
is $equal->label, '==', 'label';

my $in1 = $equal->in(1);
my $in2 = $equal->in(2);
my $out = $equal->out;

$equal->task;
is $out->data, undef, 'default task';

my $a = rand(100);

$in1->data($a);
$in2->data($a);
$equal->task;
ok $out->data, 'a=a';

