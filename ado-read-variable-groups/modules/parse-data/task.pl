#!perl

use JSON;
use Text::Table::Tiny qw/ generate_table /;

my $output = task_var("output");

open (my $fh, "<", $output) or die $!;

my $data = join "", <$fh>;

close $fh; 

my %vars = %{from_json($data)->{variables}};

my @rows = ([qw/name value/]);
my @list;

#use Data::Dumper;

#print Dumper(\%vars);

for my $i (sort keys %vars){
  push @list, { name => $i, value => $vars{$i}->{value} };
  push @rows, [ $i, $vars{$i}->{value} ];
}

print generate_table(rows => \@rows, header_row => 1, separate_rows => 1);

update_state( { list => \@list } );
