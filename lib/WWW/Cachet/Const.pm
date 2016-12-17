package WWW::Cachet::Const;

use strict;
use warnings;
use base 'Exporter';

# Component statuses
use constant STATUS_OPERATIONAL        => 1;
use constant STATUS_PERFORMANCE_ISSUES => 2;
use constant STATUS_PARTIAL_OUTAGE     => 3;
use constant STATUS_MAJOR_OUTAGE       => 4;

# Incident Statuses
use constant STATUS_SCHEDULED     => 0;
use constant STATUS_INVESTIGATING => 1;
use constant STATUS_IDENTIFIED    => 2;
use constant STATUS_WATCHING      => 3;
use constant STATUS_FIXED         => 4;

# Metric calc types
use constant CALC_TYPE_SUM     => 0;
use constant CALC_TYPE_AVERAGE => 1;

our @EXPORT_OK = (
  'STATUS_OPERATIONAL',
  'STATUS_PERFORMANCE_ISSUES',
  'STATUS_PARTIAL_OUTAGE',
  'STATUS_MAJOR_OUTAGE',

  'STATUS_INVESTIGATING',
  'STATUS_IDENTIFIED',
  'STATUS_WATCHING',
  'STATUS_FIXED',

  'CALC_TYPE_SUM',
  'CALC_TYPE_AVERAGE'
);

our %EXPORT_TAGS = (
  component_status => [
    'STATUS_OPERATIONAL',
    'STATUS_PERFORMANCE_ISSUES',
    'STATUS_PARTIAL_OUTAGE',
    'STATUS_MAJOR_OUTAGE'
  ],

  incident_status => [
    'STATUS_SCHEDULED',
    'STATUS_INVESTIGATING',
    'STATUS_IDENTIFIED',
    'STATUS_WATCHING',
    'STATUS_FIXED'
  ],

  calc_type => [
    'CALC_TYPE_SUM',
    'CALC_TYPE_AVERAGE'
  ],

  all => \@EXPORT_OK
);

1;
__END__
=head1 NAME

WWW::Cachet::Const - Import constants that map to Cachet API status codes

=head1 SYNOPSIS

  use WWW::Cachet::Const qw/ :component_status /;
  # Now we have access to the constants
    STATUS_OPERATIONAL
    STATUS_PERFORMANCE_ISSUES
    STATUS_PARTIAL_OUTAGE
    STATUS_MAJOR_OUTAGE

  use WWW::Cachet::Const qw/ :incident_status /;
  # Now we have access to the constants:
    STATUS_SCHEDULED
    STATUS_INVESTIGATING
    STATUS_IDENTIFIED
    STATUS_WATCHING
    STATUS_FIXED

  use WWW::Cachet::Const qw/ :calc_type /;
  # Now we have access to the constants:
    CALC_TYPE_SUM
    CALC_TYPE_AVERAGE

  # Or import them all with
  use WWW::Cachet::Const qw/ :all /;

=head1 SEE ALSO

L<WWW::Cachet>

=head1 AUTHOR

Jarrod Linahan, E<lt>jarrod@linahan.id.au<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
