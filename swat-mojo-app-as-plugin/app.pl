# Plugin
package Mojolicious::Plugin::MyEmbeddedApp;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
  my ($self, $app) = @_;

  # Automatically add route

  $app->routes->any('/hello')->detour(app => EmbeddedApp::app());

}

package EmbeddedApp;
use Mojolicious::Lite;

get '/world' => sub {
  my $c = shift;
  $c->render(text => 'Hello World!'."\n".'base path is '.($c->stash('path'))."\n");
};

package MyApp;

use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;

  # Plugin
  $self->plugin('MyEmbeddedApp');
}

package main;

require Mojolicious::Commands;

Mojolicious::Commands->start_app('MyApp');

1;

