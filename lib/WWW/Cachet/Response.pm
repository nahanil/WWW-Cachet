package WWW::Cachet::Response;

use constant TRUE  => 1;
use constant FALSE => 0;

use Moo;
use LWP::UserAgent;

has ok => (
  is => 'rw',
  required => TRUE,
);

has message => (
  is => 'rw'
);

has data => (
  is => 'rw',
);

1;
__END__
=head1 NAME

WWW::Cachet::Response

=head1 SYNOPSIS

  use WWW::Cachet::Response;

=head1 SEE ALSO

L<WWW:Cachet>

=head1 AUTHOR

Jarrod Linahan, E<lt>jarrod@linahan.id.au<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
