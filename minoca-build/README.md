# SYNOPSIS

Minoca OS builder.

# Description

This is a high level wrapper of [Minoca build scripts](https://github.com/minoca/os#building-minoca-os) and by no means
should be treated as substitution of a such. Now it *just works* for me. Minoca-build tool abstracts some
low level details of cooking things with `make` which could be safe way to go for unprepared user,
but if you need to hack into process - please follow [Minoca build scripts](https://github.com/minoca/os#building-minoca-os) documentation.

If you need ready examples, there are some at [examples/](https://github.com/melezhik/minoca-build/blob/master/examples) directory.

# INSTALL

## Install sparrow

* Follow [sparrow](https://github.com/melezhik/sparrow) documentation if you
want to install sparrow on none Minoca OS.

* To install sparrow on minoca OS instance `$ wget http://sparrowhub.org/minoca.sh -O - | sh`

## Install minoca-build sparrow plugin:

    $ sparrow index update
    $ sparrow plg install minoca-build

# USAGE

Caveat.

Before running any build, you should install [Minoca Toolchain](http://www.minocacorp.com/download/minoca-tools-linux.tar.gz) binaries:

    $ wget http://www.minocacorp.com/download/minoca-tools-linux.tar.gz
    $ mkdir ~/minoca
    $ tar -xzf minoca-tools-linux.tar.gz -C ~/minoca

Now you are free to run builds:

    $ sparrow plg run minoca-build --param target=list              # show available target list
    $ sparrow plg run minoca-build --param target=os                # build minoca OS
    $ sparrow plg run minoca-build --param target=all-tools         # required to build packages
    $ sparrow plg run minoca-build --param target=nano-2.2.6        # build nano package
    $ sparrow plg run minoca-build --param target=nano-2.2.6-clean  # clean nano package 
    $ sparrow plg run minoca-build --param target=nano-2.2.6-clean,nano-2.2.6 # clean and the build nano
    $ sparrow plg run minoca-build --param target=image             # build OS image with packages built in

![minoca build report](https://raw.githubusercontent.com/melezhik/minoca-build/master/sparrow-minoca-build.png)

# Custom configuration

These are default settings for minoca build environment:

    +----------------------+---------------------------------------------------+
    | Variable             | Default Value                                     |
    +----------------------+---------------------------------------------------+
    | SRCROOT              | ~/minoca                                          |
    | DEBUG                | dbg                                               |
    | ARCH                 | x86                                               |
    | TOOLS*               | ~/minoca/src/x86dbg/tools/bin                     |
    +--------------------------------------------------------------------------+

(*) TOOLS variable sets path to minoca toolchain binaries. 

To override default settings you do:

    $ sparrow plg run minoca-build --param srcroot=/path/to/srcroot --param tools=/path/to/tools/bin --param target=os

Or ( probably better as could be set once ) create a sparrow task:

    $ sparrow project create minoca
    $ sparrow task add minoca builder minoca-build
    $ sparrow task ini minoca/builder
    
      srcroot = /my/src/root
      debug   = dbg
      arch    = x86
      tools   = /my/src/x86dbg/tools/bin/      

    $ sparrow task run minoca/builder --param target=os

# Custom builds 

You may define custom builds with either command line parameters.


    # Build nano editor, curl and bash
    $ sparrow plg run minoca-build --param target=nano-2.2.6,curl-7.41.0,bash-4.3.30

Or using sparrow tasks:

    $ sparrow task add minoca gear minoca-build # build some useful tools
    $ sparrow task ini minoca/gear

      target nano-2.2.6
      target curl-7.41.0
      target bash-4.3.30
  
    $ sparrow task run minoca/gear

# Running none build targets

Usually all you need is to build a package, but if you run other some specific targets:

## Building tools

Tools are required to build all other packages, so this is probably the first thing you need to do.

Warning: building tools takes awhile when doing first time. Take your coffee ;-)

    $ sparrow plg run minoca-build --param target=all-tools   # required to build packages

## Building os

There is dedicate target for it called 'os' to build Minoca OS.

    $ sparrow plg run minoca-build --param target=os

## Rebuilding os image

Sometimes you need to rebuild os image, usually right after you get some package built:

    # Build my gear soft:
    $ sparrow plg run minoca-build --param target=nano-2.2.6,curl-7.41.0,bash-4.3.30

    # Now I need to rebuild the image 
    $ sparrow plg run minoca-build --param target=image

## Tests

    # running tests against third party Perl:
    $ sparrow plg run minoca-build --param target=perl-5.20.1-test

    # or with task:

    $ sparrow task add minoca perl-test minoca-build
    $ sparrow task ini minoca/perl-test

      target perl-5.20.1-test

    $ sparrow task run minoca/perl-test

## Clean

This target cleans some already build package, this technical equivalent of `make clean`
for given package:

    # remove nano, curl and bash objects 
    $ sparrow plg run minoca-build --param target=nano-2.2.6-clean,curl-7.41.0-clean,bash-4.3.30-clean

    # or with sparrow task

    $ sparrow task add minoca hacker-gear-clean minoca-build
    $ sparrow task ini minoca/hacker-gear-clean
      target nano-2.2.6-clean
      target curl-7.41.0-clean
      target bash-4.3.30-clean


## Wipe

If you want start all over the scratch call `wipe` target:

    $ sparrow plg run minoca-build --param target=wipe

This technically call `make wipe` for os repository and `make clean` for third-party repository

## Update sources

This target fetch (via `git pull`) latest update for both os and third-party repository

    $ sparrow plg run minoca-build --param target=update-sources


## List available targets

To list all targets you can run:

    $ sparrow plg run minoca-build --param target=list

Or narrow list by using filter:

    $ sparrow plg run minoca-build --param target=list --param filter=gcc

## Show build log

By default all build logs gets redirected to file and only dumped out on errors.
If you want to see it use `verbose` option:

    $ sparrow plg run minoca-build --param target=postgresql-9.5.4 --param verbose=on

## Running sequence of builds:


    $ nano tasks.json

    [
 
      {
        "task" : "os",
        "plugin" : "minoca-build",
        "data" : {
          "srcroot"   => "/src",
          "arch"      => "x86", 
          "debug"     => "dbg",
          "target"    => "os"
        }
      },
      {
        "task" : "build-nano-editor",
        "plugin" : "minoca-build",
        "data" : {
          "srcroot"   => "/src",
          "arch"      => "x86", 
          "debug"     => "dbg",
          "target"    => "nano-2.2.6"
        }
      },
      {
        "task" : "build-new-image",
        "plugin" : "minoca-build",
        "data" : {
          "srcroot"   => "/src",
          "arch"      => "x86", 
          "debug"     => "dbg",
          "target"    => "image"
        }
      }
    ]

    $ sparrow box run tasks.json


## Running by cron

With `--cron` flag sparrow suppress a normal output and only emit report on unsuccessful exit code

    $ sparrow task run minoca/perl-test --cron

## Running builds by ssh

Take a look at [Sparrowdo](http://github.com/melezhik/sparrowdo/) - tool to run sparrow plugins over ssh ( and even more! ).


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
  

# See also

[Minoca OS Project](http://minocacorp.com/)

    
 
