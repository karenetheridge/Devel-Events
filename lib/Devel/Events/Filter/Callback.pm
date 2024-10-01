package Devel::Events::Filter::Callback;
# vim: set ts=2 sw=2 noet nolist :
# ABSTRACT: Callback based L<Devel::Events::Filter>
our $VERSION = '0.11';
use Moose;

with qw/Devel::Events::Filter/;

has callback => (
	isa => "CodeRef",
	is  => "rw",
	required => 1,
);

sub filter_event {
	my ( $self, @event ) = @_;
	$self->callback->(@event);
}

__PACKAGE__;

__END__

=pod

=head1 SYNOPSIS

	use Devel::Events::Filter::Callback;

	Devel::Events::Filter::Callback->new(
		callback => sub {
			my ( @event ) = @_;

			return if bad_event(@event); # drop it

			return map { filter($_) } @event; # change it
		},
		handler => $handler,
	);

=head1 DESCRIPTION

Duh.

=head1 ATTRIBUTES

=over 4

=item handler

L<Devel::Events::Handler>

=item callback

a code ref

=back

=head1 METHODS

=over 4

=item filter_event

Delegates to C<callback>

=back

=cut


