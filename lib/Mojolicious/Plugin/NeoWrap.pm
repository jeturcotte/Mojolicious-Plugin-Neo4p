use strict;
use warnings;
package Mojolicious::Plugin::NeoWrap;
{
  $Mojolicious::Plugin::NeoWrap::VERSION = '0.11';
}
use parent 'REST::Neo4p';

=head1 NAME

Mojolicious::Plugin::NeoWrap - In support of plugin integration, this module wraps the various functionalities into a single entity

=head1 VERSION

version 0.11

=head1 SYNOPSIS

In support of plugin integration, this module wraps the various functionalities into a single entity.

	sub bind {
    	my $self = shift;
    	my $app  = shift;
    	my $conf = shift;

    	die ref($self), ': missing api parameter', "\n" unless($conf->{api});
		Mojolicious::Plugin::NeoWrap->connect($conf->{api});
    	$app->helper( neo4p => Mojolicious::Plugin::NeoWrap );
	}

The end purpose is to have all the native functionality of REST::Neo4p available under a single object.  Following the above, one should be able to register the Neo4p plugin with their mojo install, and from there on out we should have a constrained syntax:

	sub addguy {
		my $self = shift;

		$self->app->neo4p->connect('http://127.0.0.1:7474');
		my $index = $self->app->neo4p->index->new('node','coolindex');
		$index->add_entry(
			$self->app->neo4p->node->new({
				name => 'testman testburger',
				age => '44',
				gender => 'cheese'
			}), guy => 'testman testburger'
		);
	}

=cut


sub index { return 'REST::Neo4p::Index' }
sub node { return 'REST::Neo4p::Node' }
sub query { return 'REST::Neo4p::Query' }


=head1 AUTHOR

J.E. Turcotte, C<< <joshua.eric.turcotte at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mojolicious-plugin-neo4p at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Mojolicious-Plugin-Neo4p>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Mojolicious::Plugin::NeoWrap


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Mojolicious-Plugin-NeoWrap>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Mojolicious-Plugin-NeoWrap>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Mojolicious-Plugin-NeoWrap>

=item * Search CPAN

L<http://search.cpan.org/dist/Mojolicious-Plugin-NeoWrap/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 J.E. Turcotte.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; 

__END__
