# SYNOPSIS

Wrapper for [zef](https://github.com/ugexe/zef) installer.


# INSTALL

    $ s6 --install zef


# USAGE


Cli:

    $ s6 --plg-run zef@list="." # install for CWD

    $ s6 --plg-run zef@list="JSON::Tiny cro" # install JSON::Tiny and Cro

    $ s6 --plg-run zef@list=cro,options="--/test --force" # passing options to zef


Sparrow DSL:


    task-run "install Cro", "zef", %(
      list => "cro",
      options => "--/test"
    );


# Author

Alexey Melezhik

