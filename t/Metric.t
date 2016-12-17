use strict;
use warnings;

use Test::More tests => 9;
use WWW::Cachet::Const qw/ :calc_type /;
BEGIN { 
  use_ok('WWW::Cachet::Metric');
};

#########################
# Test our WWW::Cachet::Metric class
# It should fail to create the object unless name and status are passed into the constructor
my $m;
eval {
  $m = WWW::Cachet::Metric->new(
    name => "Foo"
  );
};
ok(!$m, "Test required parameters");

# Ensure constants were exported
ok(CALC_TYPE_SUM == 0);
ok(CALC_TYPE_AVERAGE == 1);

# Ensure we can create a new Metric with the possible attributes
$m = WWW::Cachet::Metric->new(
  name          => "Test Metric",
  suffix        => "flanges",
  description   => "A metric for a unit test.",
  default_value => 0,
);
ok(defined($m), "Can create Metric");
ok($m->name          eq "Test Metric", "Can retrieve name");
ok($m->suffix        eq "flanges",     "Can retrieve suffix");
ok($m->description   eq "A metric for a unit test.", "Can retrieve description");
ok($m->default_value == 0,             "Can retrieve default_value");
