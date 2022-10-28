# pack-unpack

Simple wrapper against tar/gzip linux utility

# Install

    s6 --install pack-unpack

# Usage

Create tar.gz of a target directory:

```bash
s6 --task-run .@file=/tmp/tt.tar.gz,target=/Users/alex/projects/ttt4/
```

Unpack tar.gz file and list it content (Users dir)

```bash
s6 --task-run .@action=unpack,file=/tmp/tt.tar.gz,dir=Users
```

# Author

Alexey Melezhik
