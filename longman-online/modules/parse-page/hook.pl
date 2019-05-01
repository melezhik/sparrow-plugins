  
use strict;
use HTML::Parser ();
require HTML::TokeParser;

my $p = HTML::TokeParser->new(task_var('file')) || die "Can't open: $!";
$p->empty_element_tags(1);  # configure its behaviour

print task_var('file'), "\n";

use Data::Dumper;

my $in_example=0;
my $line;
my $span=0;
my $url;

while (my $token = $p->get_token) {

   #print Dumper($token);

   #next;
 
   if ($token->[0] eq 'S' && $token->[1] eq 'span' && ref $token->[2] && ref $token->[2] eq 'HASH' && $token->[2]->{title}  && $token->[2]->{title} eq 'Play Example'){
        $url = $token->[2]->{'data-src-mp3'};
        $span=2;
        next;
    };

   if($span > 0 ){ 

      #print Dumper($token);
      
      if ($token->[0] && $token->[0] eq 'T' && $token->[1] =~ /\w/){
        $line.= $token->[1];
        #print $line, "\n";
      }
      
      $span++ if $token->[0] eq 'S' && $token->[1] eq 'span';
      $span-- if $token->[0] eq 'E' && $token->[1] eq 'span';

      if ( $span == 0 ) {
        my $st = run_task("download", { url => $url , example => "'$line'" } );
        run_task("process-file", { url => $url , example => $line } ) if $st->{status};
        $line="";
        $url="";
      } 

   } 
    
} 

__END__

$VAR1 = [
          'S',
          'span',
          {
            'title' => 'Play Example',
            'data-src-mp3' => '/media/english/exaProns/p008-000175125.mp3',
            'class' => 'speaker exafile fa fa-volume-up'
          },
          [
            'data-src-mp3',
            'class',
            'title'
          ],
          '<span data-src-mp3="/media/english/exaProns/p008-000175125.mp3" class="speaker exafile fa fa-volume-up" title="Play Example">'
        ];
$VAR1 = [
          'T',
          ' ',
          ''
        ];
$VAR1 = [
          'E',
          'span',
          '</span>'
        ];
$VAR1 = [
          'T',
          'I’m going to show you how to make a box for your tools.',
          ''
        ];


<span class="EXAMPLE">
  <span data-src-mp3="/media/english/exaProns/p008-001634822.mp3" class="speaker exafile fa fa-volume-up" title="Play Example">
  &nbsp;
  </span>
  Andy poked the fish with his finger to see if it was still alive.
</span>

