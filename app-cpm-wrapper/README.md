# SYNOPSIS

Simple wrapper for [App::cpm](https://metacpan.org/pod/App::cpm)


# INSTALL

    $ sparrow plg install app-cpm-wrapper

# USAGE

Basic usage:

    $ sparrow plg run app-cpm-wrapper --param module=$module -- <app-cpm-wrapper-params>

For example:

    $ sparrow plg run app-cpm-wrapper \
    --param module="HTTP::Tiny Config::Tiny" -- \
    -w 2 \
    -L /home/melezhik/cpan # so on

See parameters description at [cpm doc](https://metacpan.org/pod/distribution/App-cpm/script/cpm)

# Automation

By sparrow tasks:

    $ sparrow project create cpan

    $ sparrow task add cpan installer app-cpm-wrapper

    $ sparrow task ini cpan/installer

      ---
      args: 
        - '~w': 2 
        - '~L': /home/melezhik/cpan

    $ sparrow task run cpan/installer --param module="HTTP::Tiny Config::Tiny"


Or if you prefer remote run, use Sparrowdo:

    $ cat sparrowfile

    task-run "install a couple of modules", "app-cpm-wrapper", %(
      args => (
        'g', # global install
        %( '~w' => 2 ) # numbe of workers
      )
    );


    $ sparrowdo --host=$host # run on remote host

# Author

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)




