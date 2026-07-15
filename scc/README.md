# scc

Compliance checks for Linux services and packages

# Install

```bash
s6 --install scc
```
# How to run

```bash
s6 --plg-run scc@check=sshd
s6 --plg-run scc@check=redis
s6 --plg-run scc@check=sudoers
s6 --plg-run scc@check=sysctl
s6 --plg-run scc@check=ifconfig
```

# Parameters

## check

Check ID.

Available IDs

- sshd
- redis
- sudoers
- bind
- sysctl
- fstab
- ifconfig

# Examples

You can see example configs to play with at
examples/ directory

# Report example

Sshd

![report.png](report.png)

# Author

Alexey Melezhik

