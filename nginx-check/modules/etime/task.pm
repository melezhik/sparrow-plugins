use DateTime;

sub validate_nginx_etime {

      my $pid = shift;
      my $cmd = shift;
      my $tm  = shift;
      my $hitask = config()->{hitask};

      my ($ptime, $days, $h, $m, $s);

      if ($tm=~/(\d+)-(\d\d:\d\d:\d\d)/) {

        $days = $1;

        ($h,$m,$s)= split ':', $2;

        $ptime = DateTime->now->add( days => - $days, hours => - $h, minutes => - $m, seconds => - $s );

      } elsif( $tm =~/(\d\d:\d\d:\d\d)/ ){

        ($h,$m,$s)= split ':', $1;

        $ptime = DateTime->now->add(  hours => - $h, minutes => - $m, seconds => - $s );

      } elsif( $tm =~/(\d\d:\d\d)/ ){

        ($m,$s)= split ':', $1;

        $ptime = DateTime->now->add( minutes => - $m, seconds => - $s );

     }


      my $check_time = DateTime->now()->subtract( reverse ( split /\s+/, $hitask ) );


      [ ! ( DateTime->compare( $ptime, $check_time  ) == -1 ) , "nginx master process runs no longer then $hitask" ]

}
