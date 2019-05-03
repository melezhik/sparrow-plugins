# SYNOPSIS

Installs mongo db


# INSTALL

    $ s6 --install mongodb


# USAGE

## Manually

    $ sparrow plg run mongodb

## Sparrowdo

    $ cat sparrowfile


    use v6;

    use Sparrowdo;

    task_run %(
      task => 'install mongo db',
      plugin => 'mongodb',
      parameters => %()
    );

# Platforms supported

* CentOS

* Ubuntu/Debian (ToDo)

# Author

[Alexey Melezhik](melezhik@gmail.com)
