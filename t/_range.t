use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Range;

my $range = PNI::Node::Perlop::Range->new;

isa_ok $range, 'PNI::Node::Perlop::Range';
is $range->label, '..', 'label';

my $in1 = $range->in(1);
my $in2 = $range->in(2);
my $out = $range->out;

$range->task;
is $out->data, undef, 'default task';

my ( $a, $b, @c );
$a = 'a';
$b = 'b';
@c = ($a .. $b);

$in1->data($a);
$in2->data($b);
$range->task;
is_deeply $out->data, \@c, 'a .. b = c';

