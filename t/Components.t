use strict;
use warnings;

use Test::LWP::UserAgent;
use Test::More tests => 20;
use WWW::Cachet::Const qw/ :component_status /;
BEGIN { 
  use_ok('WWW::Cachet');
  use_ok('WWW::Cachet::Component');  
  use_ok('WWW::Cachet::Const');  
};

#########################
# Set up a mock LWP::UserAgent whynots
my $ua = Test::LWP::UserAgent->new;
$ua->map_response(
  qr{example.com/components},
  HTTP::Response->new(
    '200',
    'OK',
    ['Content-Type' => 'application/json'],
      '{"meta":{"pagination":{"total":1, "count":1,"per_page":20,"current_page":1,"total_pages":1,"links":{"next_page":null,"previous_page":null}}},"data":[{"id":1,"name":"Test Component","description":"","link":"","status":"1","order":5,"group_id":1,"enabled":true,"created_at":"2016-12-15 21:37:50","updated_at":"2016-12-18 03:21:38","deleted_at":null,"status_name":"Operational","tags":{"":""}}]}'
  )
);

# Test our WWW::Cachet::Component class
# It should fail to create the object unless name and status are passed into the constructor
my $component;
eval {
  $component = WWW::Cachet::Component->new(
    name => "Foo"
  );
};
ok(!$component, "Test required parameters");

# Ensure we can create a new Component with the possible attributes
$component = WWW::Cachet::Component->new(
  id          => 1,
  name        => "Foo",
  description => "Lorem ipsum",
  status      => STATUS_OPERATIONAL,
  link        => "http://example.com",
  order       => 1,
  group_id    => 1,
  enabled     => 1
);
ok(defined($component), "Can create Component");

# Ensure we can retrieve the set attributes
ok($component->id          == 1);
ok($component->name        eq "Foo");
ok($component->description eq "Lorem ipsum");
ok($component->status      == STATUS_OPERATIONAL);
ok($component->link        eq "http://example.com");
ok($component->order       == 1);
ok($component->group_id    == 1);
ok($component->enabled     == 1);

# Test WWW::Cachet API calls/response handling
my $cachet = new WWW::Cachet( api_url => "http://example.com", api_token => "foobar", _ua => $ua );
ok(defined $cachet, 'Create a new WWW::Cachet object');

# Get components
my $components = $cachet->getComponents();
ok(defined $components, "getComponents returns ok");
ok(ref $components eq "ARRAY", "getComponents returns array");
# Expect 1 incident to be returned
ok(scalar(@$components) == 1, "getComponents array contains expected elements");
# Ensure the incident was parsed into a WWW::Cachet::Component
ok(ref $components->[0] eq "WWW::Cachet::Component", "getComponents parses API response into Component object");
ok($components->[0]->name eq "Test Component", "getComponents Component object has parameters set: name");
ok($components->[0]->status eq STATUS_OPERATIONAL, "getComponents Component object has parameters set: status");
