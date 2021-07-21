#!raku

use JSON::Tiny;
use MIME::Base64;

my $c;

if config<container> {
  say ">>> verify deployment. name={config<name>},namespace={config()<namespace>},container={config()<container>}";
  $c = get_state()<spec><template><spec><containers>.grep({ .<name> eq config()<container> })[0];
} else {
  $c = get_state()<spec><template><spec><containers>[0];
  my $cnt-name =  $c<name>;
  say ">>> verify deployment. name={config<name>},namespace={config()<namespace>},container={$cnt-name}";
}

if $c<env> {

  say "[env_start]";

  my @e = $c<env><>;

  #say @e.perl;

  for @e -> $i {
    if $i<value>:exists {
      say "[{$i<name>}={$i<value>}]"
    } else {
      say "[{$i<name>}]"
    }
  }

  say "[env_end]";

}


if $c<volumeMounts> {

  say "[volume_mounts_start]";

  #say $c<volumeMounts>.perl;

  for $c<volumeMounts><> -> $i {
    #say $i<subPath>.exists ??  "[{$i<name>} {$i<mountPath>}\@$i<subPath>]" !! "[{$i<name>} {$i<mountPath>}]";
    if $i<subPath> {
      say "[{$i<name>} {$i<mountPath>}\@$i<subPath>]"
    } else {
      say "[{$i<name>} {$i<mountPath>}]"
    }
  }

  say "[volume_mounts_end]";

}

if $c<command> {

  say "[command_start]";

  #say $c<command>.perl;

  for $c<command><> -> $i {
    say $i;
  }

  say "[command_end]";

}

if $c<command> {

  say "[command_args_start]";

  #say $c<args>.perl;

  for $c<args><> -> $i {
    say $i;
  }

  say "[command_args_end]";

}


say "==================================================================";

