package WWW::Cachet::Incident;

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

has message => (
  is       => 'rw',
  required => TRUE
);

has status => (
  is       => 'rw',
  isa      => sub {
    confess "Invalid incident status" unless ($_[0] =~ /^[0-4]$/); 
  },
  required => TRUE
);

has visible => (
  is       => 'rw',
  isa      => sub {
    confess "'visible' should be 1 or 0" unless ($_[0] =~ /^[01]$/);
  },
  required => TRUE
);

has component_id => (
  is  => 'rw',
  isa => sub {
    confess "'$_[0]' is not an integer!" if $_[0] !~ /^\d+$/;
  }
);

has component_status => (
  is       => 'rw',
  isa      => sub {
    confess "Invalid incident status" unless ($_[0] =~ /^[1-4]$/);
  },
);

has notify => (
  is       => 'rw',
  isa      => sub {
    confess "'notify' should be 1 or 0" unless ($_[0] =~ /^[01]$/);
  },
  default  => 0
);

has template => (
  is       => 'rw',
);

has vars => (
  is       => 'rw',
);

has scheduled_at => (
  is => 'rw'
);

has created_at => (
  is => 'rw'
);

has updated_at => (
  is => 'rw'
);

has deleted_at => (
  is => 'rw'
);

has human_status => (
  is => 'rw'
);

1;
__END__
=head1 NAME

WWW::Cachet::Incident - Perl wrapper for Cachet API's incident

=head1 SYNOPSIS

  use WWW::Cachet::Incident;

=head1 SEE ALSO

L<WWW:Cachet>

=head1 AUTHOR

Jarrod Linahan, E<lt>jarrod@linahan.id.au<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.0 or,
at your option, any later version of Perl 5 you may have available.

=cut
