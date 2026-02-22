# SYNOPSIS

Get directories updated between git commits

# INSTALL

    $ s6 --install git-updated-dirs

# USAGE

Raku:

    my %state = task-run "files/tasks/git-updated-dirs", %(
      dir => "scm",
      commit_old => $old-commit-sha,
      commit_new => $new-commit-sha,
      level => 0,
    );

    say %state<list><>;
    
Bash:

```bash
#!/bin/bash

eval $(s6 --plg-run --inline git-updated-dirs@dir=.,commit_new=$new_commit,commit_old=$old_commit,level=0)

for d in "${dirs[@]}"; do
  echo "Processing: $d"
done
```


# Parameters

## dir

Directory with a local git repo

## level

Level of directories. Optional. Default value is `0` -  the first level directories. 
(`1` for the second level directories, so on ).

## commit_old 

Git commit sha

## commit_new

Git commit sha

# Requirements

Git client

# Author

Alexey Melezhik
