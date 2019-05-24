# SYNOPSIS

Shows sub folders statistic for given directory.

# Install

    $ s6 --install dir-folder-start

# USAGE

    $ s6 --install dir-folder-start,path=/path/to/dir
  
For directory given by `path` shows:

- How many folders (no subfolders) in the selected folder
- How many folders (amount, percentage) under 100 MB
- How many folders (amount, percentage) between 100-250
- How many folders (amount, percentage) between 250-500
- How many folders (amount, percentage) between 500-1TB
- How many folders (amount, percentage) bigger 1TB

# Author

Alexey Melezhik

