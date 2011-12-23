use strict;
use warnings;
use Test::More tests => 15;

BEGIN {
    use_ok($_)
      or BAIL_OUT(" $_ module does not compile :-(")
      for qw(
      PNI::Node::Perlop
      PNI::Node::Perlop::Addition
      PNI::Node::Perlop::And
      PNI::Node::Perlop::Arrow
      PNI::Node::Perlop::Division
      PNI::Node::Perlop::Exponentiation
      PNI::Node::Perlop::Multiplication
      PNI::Node::Perlop::Not
      PNI::Node::Perlop::Numerically_equal
      PNI::Node::Perlop::Numerically_not_equal
      PNI::Node::Perlop::Or
      PNI::Node::Perlop::Range
      PNI::Node::Perlop::Stringwise_equal
      PNI::Node::Perlop::Stringwise_not_equal
      PNI::Node::Perlop::Subtraction
    );
}

