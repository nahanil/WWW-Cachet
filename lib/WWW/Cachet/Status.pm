package WWW::Cachet::Status;

use strict;
use warnings;
use base 'Exporter';

# Component statuses
use constant STATUS_OPERATIONAL        => 1;
use constant STATUS_PERFORMANCE_ISSUES => 2;
use constant STATUS_PARTIAL_OUTAGE     => 3;
use constant STATUS_MAJOR_OUTAGE       => 4;

# Incident Statuses
use constant STATUS_INVESTIGATING => 1;
use constant STATUS_IDENTIFIED    => 2;
use constant STATUS_WATCHING      => 3;
use constant STATUS_FIXED         => 4;

our @EXPORT_OK = (
  'STATUS_OPERATIONAL',
  'STATUS_PERFORMANCE_ISSUES',
  'STATUS_PARTIAL_OUTAGE',
  'STATUS_MAJOR_OUTAGE',

  'STATUS_INVESTIGATING',
  'STATUS_IDENTIFIED',
  'STATUS_WATCHING',
  'STATUS_FIXED'
);

our %EXPORT_TAGS = (
  component_status => [
    'STATUS_OPERATIONAL',
    'STATUS_PERFORMANCE_ISSUES',
    'STATUS_PARTIAL_OUTAGE',
    'STATUS_MAJOR_OUTAGE'
  ],

  incident_status => [
    'STATUS_INVESTIGATING',
    'STATUS_IDENTIFIED',
    'STATUS_WATCHING',
    'STATUS_FIXED'
  ]
);

1;

