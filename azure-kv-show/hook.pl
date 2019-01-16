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
  run_story(
    "fetch-kv", 
    { 
      secret  => $i, 
      kv      => $kv, 
      output  => story_cache_dir()."/$i.json"  
    } 
  );
}

set_stdout("");
set_stdout("key vault: $kv");

my @rows;

push @rows, ['Name', 'Value'];


for my $i (@items){

  if ( open(my $fh, story_cache_dir()."/$i.json") ) {

    my $s = join "", <$fh>;

    close $fh;

    my $data = decode_json($s);

    push @rows, [ $i, $data->{value} ];

  } else {

    push @rows, [ $i, '?' ];

  }

}


set_stdout(generate_table(rows => \@rows, header_row => 1, separate_rows => 1));
