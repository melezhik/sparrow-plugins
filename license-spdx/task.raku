use License::SPDX;
use JSON::Tiny;

my $l = License::SPDX.new;
my %s;

my $json = from-json("{config()<dir>}/META6.json".IO.slurp());

if $json<license> {
  say "parse license: {$json<license>}";
  %s<license> = $json<license>;
  if $l.get-license($json<license>) -> $license {
	  if $license.is-deprecated-license {
      %s<status> = "DEPRECATED";
  	  %s<message> = "deprecated licence";
    } else {
      %s<status> = "OK";
  	  %s<message> = "licence is good";
    }
  } else {
    %s<status> = "FAIL";
	  %s<message> = "not a good licence";
  }
} else {
    %s<status> = "FAIL";
	  %s<message> = "META6.json - license field does not exit";
}

update_state(%s);
