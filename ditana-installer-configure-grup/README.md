# ditana-installer-configure-grub

Check and configure /etc/default/grub for Ditana Linux installer

# Install

    s6 --install ditana-installer-configure-grup

# Usage

```raku
task-run "configure grub.conf", "ditana-installer-configure-grup", %(
  :path</etc/default/grub>,
  :encrypt_root_partition,
  :enable_os_prober,
  :20grub_timeout,
);
```

# Parameters

## path

Path to grub configuration file. Optional. Default value is /etc/default/grub

## enable_os_prober

Enable OS prober. Optional. Default value is `False`

# encrypt_root_partition

Use encrypted root partition. Optional. Default value is `False`

# Author

Alexey Melezhik

# Credits

This is a port of [configure-grub.yaml](https://github.com/acrion/ditana-installer/blob/main/airootfs/root/bind-mount/root/configure-grub.yaml) playbook written by Stefan Zipproth


