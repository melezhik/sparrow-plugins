debug=$(config debug)
[[ $debug ]] && set -x

root_pass=$(config rootpw)

arch-chroot /mnt /bin/bash -c "echo root:"$root_pass" | chpasswd"
