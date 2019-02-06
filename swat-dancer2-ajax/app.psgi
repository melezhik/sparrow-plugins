#!/usr/bin/perl

use Dancer2;

    get '/api/v1/greeting' => sub {
        header 'Content-Type' => 'application/json';
        return to_json { text => 'Hello World' };
    };

dance;

