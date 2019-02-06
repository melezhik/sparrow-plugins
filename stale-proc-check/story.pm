use DateTime;
use strict;

my $filter = config()->{filter};
my $filter_re = qr/$filter/;
my $history = config()->{history}; # || '1 minutes';

set_stdout("filter: $filter");
set_stdout("history: $history");

my $cnt = 0;

open(my $fh, '-|', "ps -eo pid,cmd,etime") or die $!;

while (my $line = <$fh>) {

      next unless $line=~/$filter_re/;

      chomp $line;

      $line=~/(\d+)\s+(.*)\s+(\S+)/ or next;

      set_stdout($line);

      my $pid = $1;
      my $cmd = $2;
      my $tm = $3;

      my ($ptime, $days, $h, $m, $s);

      if ($tm=~/(\d+)-(\d\d:\d\d:\d\d)/) {

        $days = $1;

        ($h,$m,$s) = split ':', $2;

        $ptime = DateTime->now->add( days => - $days, hours => - $h, minutes => - $m, seconds => - $s );

      } elsif( $tm =~/(\d\d:\d\d:\d\d)/ ){

        ($h,$m,$s)= split ':', $1;

        $ptime = DateTime->now->add( hours => -$h, minutes => - $m, seconds => - $s );

      } elsif( $tm =~/(\d\d:\d\d)/ ){

        ($m,$s) = split ':', $1;

        $ptime = DateTime->now->add( minutes => - $m, seconds => - $s );

      }else{

        next;

      }

      my $check_time = DateTime->now()->subtract( reverse ( split /\s+/, $history ) );

      if ( DateTime->compare( $ptime, $check_time  ) == -1 ){

          my %delta = DateTime->now()->subtract_datetime( $ptime )->deltas;

          my $dt_fmt;

          $dt_fmt.="months: $delta{months} "   if $delta{months};
          $dt_fmt.="days: $delta{days} "       if $delta{days};
          $dt_fmt.="minutes: $delta{minutes} " if $delta{minutes};
          $dt_fmt.="seconds: $delta{seconds} " if $delta{seconds};

          set_stdout("delta: $dt_fmt");

          $cnt++;
      }

}

close $fh;


set_stdout("count: $cnt");
