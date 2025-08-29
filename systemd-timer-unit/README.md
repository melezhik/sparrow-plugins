# SYNOPSIS

Create systemd units for timers

# INSTALL

    $ s6 --install systemd-timer-unit

# USAGE

## Cli

```
s6 --plg-run systemd-timer-unit@name=container-deploy,on_boot_sec=5min,on_unit_active_sec=3min,randomized_delay_sec=1min,accuracy_sec=2min
```

## Raku

```raku
#!raku

# install timer systemd unit

my $s = task-run "my timer", "systemd-timer-unit",  %(
  :description<Container Deploy Timer>,
  :name<container-deploy>,
  :requires<container-deploy.service>,
  :on_boot_sec<5min>,
  :on_unit_active_sec<3min>,
  :randomized_delay_sec<1min>,
  :accuracy_sec<2min>,
);

if $s<changed> {
  bash "systemctl daemon-reload";
  service-enable "container-deploy.timer";
}

```

# Parameters

## name

Unit/timer name

### description

Unit/timer description

## on_boot_sec

Optional. Default value is `10min`

## on_unit_active_sec

Optional. Default value is `10min`

## randomized_delay_sec

Optional. Default value is  `2min`

## accuracy_sec

Optional. Default value is `1min`

## requires

Requires systemd entry. 

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
