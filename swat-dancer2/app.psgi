#!/usr/bin/perl

use Dancer2;

get '/hello/:name' => sub {
    return "Hi there ".route_parameters->get('name');
};

get '/hello2/:name' => sub {
    return "Hi2 there ".query_parameters->get('name');
};

any ['get', 'post'] => '/myaction' => sub {
    return "any"
};

get '/cookie' => sub {
    my $cookie = cookies->{name};
    return $cookie->value;
};

get '/config' => sub {
    return (
        "This is appname: " . config->{appname}."\n".
        "This is foo: " . config->{foo}
    );
};

get 'static/:file' => sub {
    content_type 'text/plain';
    send_file(params->{file});
};

dance;

