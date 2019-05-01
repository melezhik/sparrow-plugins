our $TASK_ID;
use Time::Piece;
use DateTime;

run_task( 'check-worker');

run_task( 'last-task');

if ($TASK_ID){

  my $cmd = ("bash -c '".config()->{command})." job $TASK_ID '";

  my $out = `$cmd`;

  set_stdout($out);

}else{

  set_stdout('no failed tasks found');

}


sub validator {

  if (!$TASK_ID){

    $v = [1,'0 failed jobs found']

  }else{
  
    my $time_str = join ' ', @{capture()};
  
    my $t = Time::Piece->strptime( $time_str, '%Y-%m-%d %T' );
    my $hitask = config()->{hitask} || '1 minutes';
    my $check_date = DateTime->now(
     time_zone => 'UTC'
    )->subtract( reverse ( split /\s+/, $hitask ) );
  
    my $date = DateTime->new(
      year       => $t->year,
      month      => $t->mon,
      day        => $t->mday,
      hour       => $t->hour,
      minute     => $t->minute,
      second     => $t->second,
      time_zone  => 'UTC',
    );
  
    if ( DateTime->compare( $check_date , $date ) == -1  ){
  
      $v = [0,'0 failed jobs found for period '.$hitask ];
  
    }else{
      $v = [1,'0 failed jobs found for period '.$hitask];
    }
  
  }
  
  $v;
  

}
