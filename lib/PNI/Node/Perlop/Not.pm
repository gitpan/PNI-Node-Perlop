package PNI::Node::Perlop::Not;
use strict;
use base 'PNI::Node';

sub init {
    my $node = shift;

    my $in = $node->add_input('in');

    my $out = $node->add_output('out');

    return 1;
}

sub task {
    my $node = shift;

    my $in = $node->get_input('in');

    my $out = $node->get_output('out');

    my $in_data = $node->get_input('in')->get_data;

    if ( defined $in_data ) {
        $out->set_data( not $in_data );
    }
    else {
        $out->set_data(undef);
    }

    return 1;
}

1;

=head1 NAME

PNI::Node::Perlop::Not - PNI node wrapping the Perl C<not> operator




=head1 INPUTS

=over 4

=item in

=back

=head1 OUTPUTS

=over 4

=item out

=back

=cut
