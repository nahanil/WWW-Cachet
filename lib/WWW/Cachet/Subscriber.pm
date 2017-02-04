package WWW::Cachet::Subscriber;

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

has email => (
  is       =>'rw', 
  required => TRUE
);

has verify => (
  is => 'rw',
  coerce => sub {
    return (!$_[0] || $_[0] eq 'false' ? JSON::false : JSON::true);
  },
);

has components => (
  is => 'rw',
);

has global => (
  is => 'rw',
  coerce => sub {
    return (!$_[0] || $_[0] eq 'false' ? JSON::false : JSON::true);
  },
);

has verify_code => (
  is  =>'rw', 
);

has verified_at => (
  is  =>'rw', 
);

has created_at => (
  is => 'rw'
);

has updated_at => (
  is => 'rw'
);

has subscriptions => (
  is => 'rw',
  isa => sub {
    if ($_) {
      confess "Expected 'subscriptions' to be an array" unless (ref $_[0] eq "ARRAY");
    }
  },
  default => sub { undef }
);

1;
__END__
=head1 NAME

WWW::Cachet::Subscriber - Perl wrapper for Cachet API's metric points

=head1 SYNOPSIS

  use WWW::Cachet::Subscriber;

=head1 SEE ALSO

L<WWW:Cachet>

=head1 AUTHOR

Jarrod Linahan <jarrod@linahan.id.au>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.0 or,
at your option, any later version of Perl 5 you may have available.

=cut
