# SYNOPSIS

Simple [meta6-bin](https://github.com/gfldex/perl6-meta6-bin) runner.


# INSTALL

    s6 --install meta6-bin

# USAGE

This plugin acts as customizer of meta6-bin runner settings. You create a sparrow task with
related parameters and then run it. 

Such approach let you ( if you don't want to ) to NOT remember ( every time you create a new
module skeleton  with the help of meta6-bin ) all the meta6-bin parameters but keep them as named sparrow task.


## Runs with default options

/meta6-bin/README
/meta6-bin/README
    $ s6 --task-run perl6-projects/new-module,name=Foo::Bar,path=~/projects

## Override default options:

    $ s6 --task-set perl6-projects/new-module
    options --force --skip-git --skip-github 
    path /opt/projects/

    $ s6 --task-run perl6-projects/new-module,name=Foo::Bar 
    
    

# Author

Alexey Melezhik
