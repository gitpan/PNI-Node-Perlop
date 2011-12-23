use strict;
use warnings;
use Test::More tests => 4;

use PNI::Node::Perlop::Arrow;

my $arrow = PNI::Node::Perlop::Arrow->new;

isa_ok $arrow, 'PNI::Node::Perlop::Arrow';
is $arrow->label, '->', 'label';

my $left  = $arrow->in('left');
my $right = $arrow->in('right');
my $out   = $arrow->out;

$arrow->task;
is $out->data, undef, 'default task';

# See package Foo below.
my $foo = Foo->new;

$left->data($foo);
$right->data('bar');

$arrow->task;

is $out->data, 'quz', '$foo->bar';

package Foo;
sub new { bless {}, 'Foo' }
sub bar { return 'quz' }

