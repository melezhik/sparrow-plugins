# ditana-installer-configure-mkinitcpio

Check and configure /etc/mkinitcpio.conf for Ditana Linux installer

# Install

    s6 --install ditana-installer-configure-mkinitcpio

# Usage

    task-run "configure mkinitcpio.conf", "ditana-installer-configure-mkinitcpio", %(
      :path</etc/mkinitcpio.conf>,
      :use_init_systemd,
      :encrypt_root_partition,
    );


# Parameters

## path

Path to mkinitcpio configuration file. Optional. Default value is /etc/mkinitcpio.conf

## use_init_systemd

Bool. Optional. Default value is False

## encrypt_root_partition

Bool. Optional. Default value is False

# Dependencies

`grep`

# Author

Alexey Melezhik

# Credits

This is port of [https://github.com/acrion/ditana-installer/blob/main/airootfs/root/bind-mount/root/configure-mkinitcpio.yaml](configure-mkinitcpio.yaml) playbook by Stefan Zipproth


