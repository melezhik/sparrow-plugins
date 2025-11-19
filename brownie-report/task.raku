use JSON::Fast;
use Text::Table::Simple;

my $new = config()<new>;
my $old = config()<old>;

say "compare old: $old and new: $new";
say "================================";

    my @old; my %old;
    my $base-dir = "{%*ENV<HOME>}/.brownie/versions/$old/";	
    for dir($base-dir) -> $i {
      next unless $i ~~ :d;
      #say ">> {$i.basename}/meta.json";
      next unless "{$base-dir}/{$i.basename}/meta.json".IO ~~ :f;
      #say "{$i.basename}";
      my $m = from-json("{$base-dir}/{$i.basename}/meta.json".IO.slurp);
      $m<name> = $i.basename;
      push @old, $m;
      %old{$i.basename} = $m;  
    }

    my @new; my %new;
    $base-dir = "{%*ENV<HOME>}/.brownie/versions/$new/";	
    for dir($base-dir) -> $i {
      next unless $i ~~ :d;
      #say "{$i.basename}/meta.json";
      #next unless "{$base-dir}/{$i.basename}/meta.json".IO ~~ :f;
      #say "{$i.basename}";		
      my $m = from-json("{$base-dir}/{$i.basename}/meta.json".IO.slurp);
      $m<name> = $i.basename;
      push @new, $m;
      %new{$i.basename} = $m;  
    }

   my @rows;

   for @new -> $i {
      if %old{$i<name>}:exists && $i<status> ne %old{$i<name>}<status> {
        push @rows, [
         $i<name>, 
         ($i<status> ?? 'OK' !! 'FAIL'),
         ( %old{$i<name>}<status> ?? 'OK' !! 'FAIL'),
        ];
      }	
   }

   my @columns = ["module name","v $old", "v $new"];
   my @table = lol2table(@columns,@rows);
   .say for @table;
