use License::SPDX;

my $l = License::SPDX.new;
my %s;

if "{config()<dir>}/LICENSE".IO ~~ :f {
  if $l.get-license("{config()<dir>}/LICENSE".IO.slurp()) -> $license {
	  if $license.is-deprecated-license {
  	  %s<message> = "deprecated licence";
    } else {
  	  %s<message> = "licence is good";
    }
  } else {
	  %s<message> = "not a good licence";
  }
} else {
	  %s<message> = "LICENSE file does not exit";
}
