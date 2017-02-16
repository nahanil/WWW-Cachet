package WWW::Cachet::Component;

use constant TRUE  => 1;
use constant FALSE => 0;

use Moo;
use JSON;
extends 'WWW::Cachet::Object';
use Carp qw/ confess /;

has id => (
  is  => 'rw',
  isa => sub {
    confess "'$_[0]' is not an integer!" if $_[0] !~ /^\d+$/;
    $_[0] += 0;
  }
);

has name => (
  is       => 'rw',
  required => TRUE
);

has description => (
  is       => 'rw',
);

has status => (
  is       => 'rw',
  isa      => sub {
    confess "Invalid component status" unless ($_[0] =~ /^[1-4]$/); 
    $_[0] += 0;
  },
  required => TRUE
);

has status_name => (
  is => 'rw'
);

has tags => (
  is => 'rw',
  isa => sub {
    if ($_) {
      confess "Expected 'tags' to be a hash" unless (ref $_[0] eq "HASH");
    }
  },
  default => sub { undef }
);

has link => (
  is       => 'rw',
);

has order => (
  is       => 'rw',
);

has group_id => (
  is       => 'rw',
  isa => sub {
    confess "'$_[0]' is not an integer!" if $_[0] !~ /^\d+$/;
    $_[0] += 0;
  }
);

has enabled => (
  is       => 'rw',
  coerce   => sub {
    return (!$_[0] || $_[0] eq 'false' ? JSON::false : JSON::true);
  },
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

1;
__END__
=head1 NAME

WWW::Cachet::Component - Perl wrapper for Cachet API's component

=head1 SYNOPSIS

  use WWW::Cachet::Component;

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
