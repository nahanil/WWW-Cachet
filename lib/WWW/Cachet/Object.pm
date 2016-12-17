package WWW::Cachet::Object;

use constant true  => 1;
use constant false => 0;

use Moo;
use JSON;

sub toHash {
  my ($self) = @_;
  my %hash = %{ $self };
  return { %hash };
}

sub fromJSON {
  my ($class, $json) = @_;
  $class ||= __PACKAGE__;
  return $class->new(decode_json($json));
}

1;
__END__
=head1 NAME

WWW::Cachet::Component - Base class for API objects

=head1 AUTHOR

Jarrod Linahan, E<lt>jarrod@linahan.id.au<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
