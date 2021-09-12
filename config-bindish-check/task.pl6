#!raku

use Config::BINDish;

my $cfg = Config::BINDish.new;

say "validate [{config()<path>}] ...";

$cfg.read: string => config()<path>.IO.slurp;
