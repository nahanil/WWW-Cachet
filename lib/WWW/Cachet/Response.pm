package WWW::Cachet::Response;

use constant TRUE  => 1;
use constant FALSE => 0;

use Moo;
use LWP::UserAgent;

has ok => (
  is => 'rw',
  required => TRUE,
);

has message => (
  is => 'rw'
);

has data => (
  is => 'rw',
);

1;
__END__
