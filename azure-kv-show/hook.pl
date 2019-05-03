#!perl

use strict;
use JSON;
use Text::Table::Tiny qw/ generate_table /;

my $url = config()->{url};
my @items;
my $kv; 


if ($url=~/https:\/\/(\S+)\.vault\.azure\.net/ ){ 
  
  my $secret;

  $url =~ /https:\/\/(\S+)\.vault\.azure\.net/ and $kv = $1;
  
  $url =~ /.*\/(\S+)/ and ( push @items, $1);  

} elsif ( ref config()->{secret} ) {

  push @items, @{config()->{secret}};

  $kv = config()->{kv};

} else {

  push @items, config()->{secret};

  $kv = config()->{kv};

}

for my $i (@items){
  run_task(
    "fetch-kv", 
    { 
      secret  => $i, 
      kv      => $kv, 
      output  => cache_dir()."/$i.json"  
    } 
  );
}

run_task(
  "print", 
  { 
    kv => $kv,
    items => \@items,
    dir => cache_dir(),
    view => config()->{view} || "lines"
  } 
);



