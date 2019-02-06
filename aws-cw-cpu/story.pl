
use Data::Dumper;
use Time::Piece;
use Time::Seconds;
use JSON;
use Term::Chart;

use strict;

my $range = config()->{'range'};
my $instance_id = config()->{instance_id} or die "instance id is required parameter!";

print "CPU Load Stat\n";
print "InstanceID: $instance_id\n";

my $stop_time = localtime();
my $start_time = localtime();
my $period=0;

if ($range=~/^\s*(\d+)\s+week/){
  $period = 60*60*24;
  for (1 .. $1){
    $start_time = $start_time - ONE_WEEK;
  }
  print "range: ", $range, " (", $start_time->ymd , " / ", $stop_time->ymd, ")\n";
} elsif ( $range=~/^\s*(\d+)\s+days/ ) {
  $period = 60*60*24;
  for (1 .. $1){
    $start_time = $start_time - ONE_DAY;
  }
  print "range: ", $range, " (", $start_time->ymd , " / ", $stop_time->ymd, ")\n";
} elsif ( $range=~/^\s*(\d+)\s+hour/ ) {
  $period = 60*60;
  for (1 .. $1){
    $start_time = $start_time - ONE_HOUR;
  }
  print "range: ", $range, " (", $start_time->datetime , " / ", $stop_time->datetime, ")\n";

} else {
  die "unknown range: $range; should be one of: \$N weeks|\$N days|\$N hours"
}


my $start_time_aws =  $start_time->datetime;
my $stop_time_aws =   $stop_time->datetime;

my $cache_dir = cache_dir();

my $cmd = "aws cloudwatch get-metric-statistics \\
--metric-name CPUUtilization \\
--namespace 'AWS/EC2'  \\
--dimensions Name=InstanceId,Value=$instance_id  \\
--start-time $start_time_aws  \\
--end-time $stop_time_aws  \\
--statistics Maximum  \\
--period $period > $cache_dir/stat.json";

system($cmd) == 0 or die "failed to execute command:\n$cmd\n$?";

print "stat downloaded to $cache_dir/stat.json\n";

open F, "$cache_dir/stat.json" or die "can't open file $cache_dir/stat.json to read: $?";
my $stat_json = join "", <F>;
close F;

sub sort_by_time {

  my $a = shift;
  my $b = shift;

  my $d1 = Time::Piece->strptime($a->{Timestamp},"%Y-%m-%dT%TZ");
  my $d2 = Time::Piece->strptime($b->{Timestamp},"%Y-%m-%dT%TZ");


  my $st;

  if ($d1 < $d2){
    $st = -1; 
  } elsif ( $d1 > $d2 ) {
    $st = 1; 
  } else {
    $st = 0; 
  }

  #print "d1: $d1 <=> d2: $d2 ; status: $st \n";

  return $st;
}

my @stat = sort { sort_by_time($a,$b) } @{decode_json($stat_json)->{Datapoints}};

my $tc = Term::Chart->new(
    {   orientation => 'horizontal',
        border      => 1,
        #bar         => "\x{2015}",
        #tip         => "x",
        #color_range => [ 160 .. 165 ],
    }
);
 
for my $n (@stat) {
    
    my $d = Time::Piece->strptime($n->{Timestamp},"%Y-%m-%dT%TZ");
    my %datum = (
        value => $n->{Maximum} + 0,
        label => ($range=~/hour/ ? $d->hour : $d->ymd)." ". ( sprintf "%.2f% ", $n->{Maximum}  ),
    );
    $tc->add_value( \%datum );
}
 
print "$tc\n";

#print Dumper(\@stat);

__DATA__

{
    "Datapoints": [
        {
            "Timestamp": "2017-09-26T12:15:00Z",
            "Maximum": 88.62,
            "Unit": "Percent"
        },
        {
            "Timestamp": "2017-09-23T12:15:00Z",
            "Maximum": 0.66,
            "Unit": "Percent"
        },
        {
            "Timestamp": "2017-09-20T12:15:00Z",
            "Maximum": 0.67,
            "Unit": "Percent"
        },

}

