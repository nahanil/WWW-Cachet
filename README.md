# WWW-Cachet version 0.01

A simple (enough) Perl module to interface with Cachet (https://docs.cachethq.io)

## INSTALLATION

To install this module type the following:

    perl Makefile.PL
    make
    make test
    make install

## DOCUMENTATATION

I've tried for the most part to document public methods in the WWW::Cachet module using POD.
Check ```perldoc WWW::Cachet``` once installed, or ```perldoc lib/WWW/Cachet.pm``` from this directory.

## EXAMPLE

Okay so you don't wanna read the perldoc for whatever reason then that's fine too, here's a starter for
ya. Godspeed.

```perl
use WWW::Cachet;
# Import some constants to use later
use WWW::Cachet::Const qw/ :all :component_status :incident_status :calc_type /;

my $cachet = WWW::Cachet->new(
  api_url   => "http://cachet.example.com/api/v1",
  api_token => "rRpHYVhsNnG12X3N4ufr",
  # Optional basic HTTP authentication
  basic_auth => {
    user     => "cachet",
    password => "test"
  }
);

# Retrieve all components
my $components = $cachet->getComponents();
print $_->name, "\n" for (@{$components});

# Retrieve all components with status STATUS_MAJOR_OUTAGE
my $components = $cachet->getComponents({ status => STATUS_MAJOR_OUTAGE });
print $_->name, "\n" for (@{$components});

# Retrieve a single component
my $component = $cachet->getComponent(1);
die $cachet->error unless($component);

# Create a component
my $new_component = $cachet->addComponent({
  name => "New Component",
  status => STATUS_OPERATIONAL
});

# Update an existing component
$new_component->status(STATUS_PARTIAL_OUTAGE);
my $updated_component = $cachet->updateComponent($new_component);
# OR
my $id = 3;
my %update = ( status => STATUS_PARTIAL_OUTAGE );
my $updated_component = $cachet->updateComponent($id, \%update);
```

## DEPENDENCIES

This module requires other modules and libraries:
  - The sole source of truth lies within Makefile.PL

## COPYRIGHT AND LICENCE

Copyright 2016 Jarrod Linahan <jarrod@linahan.id.au>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.

##### Viva la open sauce
