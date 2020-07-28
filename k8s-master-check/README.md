# SYNOPSIS

Simple check for kubernetes master

# Platforms supported

* Any Linux

# INSTALL

    $ s6 --install k8s-master-check

# RUN

This will check if k8s master runs successfully, one need to pass a `user`
to run `kubectl` command with:

    $ s6 --plg-run k8s-master-check@user=ubuntu

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[Creating a single control-plane cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
