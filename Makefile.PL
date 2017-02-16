use 5.014000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'WWW::Cachet',
    VERSION_FROM      => 'lib/WWW/Cachet.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {
      'Moo' => '1.000007',
      'URI' => 0,
      'LWP::UserAgent' => '0',
      'LWP::Protocol::https' => '0',
      'JSON' => '0',
    },
    BUILD_REQUIRES => {
      'Test::LWP::UserAgent' => 0  
    },
    ABSTRACT_FROM     => 'lib/WWW/Cachet.pm', # retrieve abstract from module
    AUTHOR            => 'Jarrod Linahan <jarrod@linahan.id.au>',
    LICENSE           => 'perl',
);
