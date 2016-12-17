package WWW::Cachet::ComponentGroup;

use constant TRUE  => 1;
use constant FALSE => 0;

use Moo;
extends 'WWW::Cachet::Object';
use Carp qw/ confess /;

has id => (
  is  => 'rw',
  isa => sub {
    confess "'$_[0]' is not an integer!" if $_[0] !~ /^\d+$/;
  }
);

has name => (
  is       => 'rw',
  required => TRUE
);


has order  => (
  is  =>'rw', 
  isa => sub {
    confess "'$_[0]' is not an integer!" if $_[0] !~ /^\d+$/;
  }
);

has collapsed => (
  is       => 'rw',
  isa      => sub {
    confess "'collapsed' should be 1 or 0" unless ($_[0] =~ /^[012]$/);
  },
  default  => 0
);

has created_at => (
  is => 'rw'
);

has updated_at => (
  is => 'rw'
);

1;
__END__
=head1 NAME

WWW::Cachet::ComponentGroup - Perl wrapper for Cachet API's metric points

=head1 SYNOPSIS

  use WWW::Cachet::ComponentGroup;

=head1 SEE ALSO

L<WWW:Cachet>

=head1 AUTHOR

Jarrod Linahan <jarrod@linahan.id.au>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
