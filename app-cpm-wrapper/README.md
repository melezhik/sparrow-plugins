# SYNOPSIS

Simple wrapper for [App::cpm](https://metacpan.org/pod/App::cpm)


# INSTALL

    $ s6 --install app-cpm-wrapper

# USAGE

Cli:

    $ s6 --plg-run app-cpm-wrapper@module=$module,args=$args

For example:

    $ s6 --plg-run app-cpm-wrapper@module="HTTP::Tiny Config::Tiny",args="-w 2 -L /home/melezhik/cpan"

See parameters description at [cpm doc](https://metacpan.org/pod/distribution/App-cpm/script/cpm)

# API

    task-run "install a couple of modules", "app-cpm-wrapper", %(
      module => "HTTP::Tiny Config::Tiny"
      args => [
        [ 'verbose' ],
        %( 
          workers => 2,
          L => "/home/melezhik/base"
        )
      ]
    );


# Author

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)




