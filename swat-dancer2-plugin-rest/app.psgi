#!/usr/bin/perl
 
use Dancer2;
use Dancer2::Plugin::REST;

set show_errors => 1;
set serializer => 'JSON';
set logger => 'console';

resource user => 
    'get' => \&on_get_user,
    'create' => \&on_create_user,
    'delete' => \&on_delete_user,
    'update' => \&on_update_user;

my $users = {};
my $last_id = 0;

sub on_get_user {
    my $id = params->{'id'};
    { user => $users->{$id} };
}

sub on_create_user {
    my $ctx = shift;

    my $id = ++$last_id;
    my $user = JSON::decode_json($ctx->request->body());
    $user->{id} = $id;
    $users->{$id} = $user;

    { user => $users->{$id} };
}

sub on_delete_user {
    my $ctx = shift;

    my $id = $ctx->request->params->{'id'};
    my $deleted = $users->{$id};
    delete $users->{$id};
    { user => $deleted };
}

sub on_update_user {
    my $ctx = shift;

    my $id = $ctx->request->params->{'id'};
    my $user = $users->{$id};
    return { user => undef } unless defined $user;

    my $user_changed = JSON::decode_json($ctx->request->body());
    $users->{$id} = { %$user, %$user_changed };
    { user => $users->{$id} };
}

dance;

