package WWW::Cachet::Response;

use constant true  => 1;
use constant false => 0;

use Moo;
use LWP::UserAgent;

has ok => (
  is => 'rw',
  required => true,
);

has message => (
  is => 'rw'
);

has data => (
  is => 'rw',
);

1;
__END__
