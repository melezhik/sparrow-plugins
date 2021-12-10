#!raku

use JSON::Tiny;

my $c;

if config<container> {
  say ">>> verify [resource={config()<resource_type>}] [name={config<name>},namespace={config()<namespace>},container={config()<container>}]";
  $c = get_state()<spec><template><spec><containers>.grep({ .<name> eq config()<container> })[0];
} else {
  $c = get_state()<spec><template><spec><containers>[0];
  my $cnt-name =  $c<name>;
  say ">>> verify [resource={config()<resource_type>}] [name={config<name>},namespace={config()<namespace>},container={$cnt-name}]";
}

update_state($c);

if $c<image> {
  say "[image={$c<image>}]"
}

if $c<env> {

  say "[env_start]";

  my @e = $c<env><>;

  for @e -> $i {
    if $i<value>:exists {
      say "[{$i<name>}={$i<value>}]"
    } elsif $i<valueFrom>:exists and $i<valueFrom><secretKeyRef>:exists and $i<valueFrom><secretKeyRef><key>:exists {
      say "[{$i<name>}=secret:{$i<valueFrom><secretKeyRef><name>}:{$i<valueFrom><secretKeyRef><key>}]"
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

  for $c<command><> -> $i {
    say $i;
  }

  say "[command_end]";

}

if $c<command> {

  say "[command_args_start]";

  for $c<args><> -> $i {
    say $i;
  }

  say "[command_args_end]";

}

say "==================================================================";

