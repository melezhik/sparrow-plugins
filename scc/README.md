# scc

Compliance checks for Linux services and packages

# Install

```bash
s6 --install scc
```
# How to run

```bash
cat /etc/ssh/sshd_config | s6 --plg-run scc@check=sshd
```

# Parameters

## check

Check ID.

# Author

Alexey Melezhik

