package WWW::Cachet;
our $VERSION = '0.01';

=head1 NAME

WWW::Cachet - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Data::Dumper;
  use WWW::Cachet;

  my $cachet = WWW::Cachet->new(
    api_url   => "http://cachet.example.com/api/v1",
    api_token => "rRpHYVhsNnG12X3N4ufr"
  );

  my $component = $cachet->getComponent(1);
  die $cachet->error unless($component);

  print Dumper $component;

=head1 DESCRIPTION

Stub documentation for WWW::Cachet, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head1 METHODS
=cut


use constant TRUE  => 1;
use constant FALSE => 0;

use Moo;
use JSON;
use LWP::UserAgent;
use HTTP::Request::Common qw/ GET POST PUT DELETE /;

use WWW::Cachet::Response;

use WWW::Cachet::Component;
use WWW::Cachet::Incident;

has api_url => (
  is => 'rw',
  required => TRUE,
);

has api_token => (
  is => 'rw',
  required => TRUE,
);

=head2 General

=head3 error()
  
  Returns the last encountered error message as a string

=cut
has error => (
  is => 'rw'
);

sub BUILD {
  my ($self, $args) = @_;

  $self->{ua} = new LWP::UserAgent;
  $self->{ua}->default_header("X-Cachet-Token" => $self->api_token);
}

=head3 TODO ping()

  Test that the API is responding to your requests

=cut
sub ping {}

=head3 TODO getVersion()

  Get Cachet version from API

=cut
sub getVersion {}

=head2 Components

=head3 getComponents()

  Returns a list of WWW::Cachet::Component from the Cachet API

=cut
sub getComponents {
  my ($self, $id) = @_;
  
  my $response = $self->_get("/components");
  if ($response->ok) {
    my @components = ();
    for my $c (@{$response->data}) {
      push @components, WWW::Cachet::Component->new( $c );
    }
    return \@components
  }
  return undef;
}

=head3 getComponent($id)

  Return a single WWW::Cachet::Component from the Cachet API

=cut
sub getComponent {
  my ($self, $id) = @_;
  
  my $response = $self->_get("/components/$id");
  if ($response->ok) {
    return WWW::Cachet::Component->new( $response->data );
  }
  return undef;
}

=head3 addComponent($data)

  Requires valid authentication
  Create a new component

=cut
sub addComponent {
  my ($self, $component) = @_;

  if (ref $component eq "WWW::Cachet::Component") {
    $component = $component->toHash();
  }

  my $response = $self->_post("/components", $component);
  if ($response->ok) {
    return $response->data;
  }

  return undef;
}

=head3 updateComponent($id, $data)

  Requires valid authentication
  Update a component

=cut
sub updateComponent {
   my ($self, $id, $component) = @_;

  if (ref $component eq "WWW::Cachet::Component") {
    $component = $component->toHash();
  }

  my $response = $self->_put("/components/$id", $component);
  if ($response->ok) {
    return $response->data;
  }

  return undef;
}


=head3 deleteComponent($id)

  Requires valid authentication
  Delete a component

=cut
sub deleteComponent {
  my ($self, $id) = @_;
  
  my $response = $self->_delete("/components/$id");
  return $response->ok;
}

sub _get {
  my ($self, $path) = @_;
  my $url = $self->api_url . $path;
  my $res =$self->{ua}->request(GET $url);
  return $self->_handle_response($res);
}

sub _post {
  my ($self, $path, $params) = @_;
  my $url = $self->api_url . $path;
  my $res = $self->{ua}->request(POST $url, $params);
  return $self->_handle_response($res);
}

sub _put {
  my ($self, $path, $params) = @_;
  my $url = $self->api_url . $path;
  my $res = $self->{ua}->request(PUT $url, $params);
  return $self->_handle_response($res);
}

sub _delete {
  my ($self, $path) = @_;
  my $url = $self->api_url . $path;
  my $res =$self->{ua}->request(DELETE $url);
  return $self->_handle_response($res);
}

sub _handle_response {
  my ($self, $res) = @_;

  my $response;
  if ($res->is_success) {
    my $json;
    if ($res->content) {
       $json = decode_json $res->content;
    }

    $response = WWW::Cachet::Response->new(
      ok => TRUE,
      data => $json ? $json->{data} : undef
    );

  } elsif ($res->code == 400) {
    # Gather error message(s)
    my @errors = ();
    if ($res->content) {
      my $json = decode_json $res->content;
      for my $e (@{ $json->{errors} }) {
        for my $detail (@{ $e->{meta}->{details} }) {
          push @errors, $detail;
        }
      }
    } else { push @errors, "Bad Request"; }
    
    $self->error( join("; ", @errors) );
    $response = WWW::Cachet::Response->new( ok => FALSE, message => $self->error );

  } elsif ($res->code == 401) {
    $self->error("API Authentication is required and has failed");
    $response = WWW::Cachet::Response->new( ok => FALSE, message => $self->error );

  } elsif ($res->code == 404) {
    $self->error("Requested resource not found");
    $response = WWW::Cachet::Response->new( ok => FALSE, message => $self->error );

  } else {
    $self->error("Request failed: ". $res->content);
    $response = WWW::Cachet::Response->new( ok => FALSE, message => $self->error );
  }

  return $response;
}


1;
__END__
=head1 AUTHOR

Jarrod Linahan <jarrod@linahan.id.au>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jarrod Linahan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
