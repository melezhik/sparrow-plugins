#!/usr/bin/perl

use Dancer2;
use Dancer2::Plugin::Res;

get '/200_OK' => sub { 
    return res 200 => '200 is for good'
};

get '/404_NOT_OK' => sub { 
    return res 404 => '404 is for bad'
};

dance;

