# SYNOPSIS

Simple cro app generator

# INSTALL

    $ s6 --install cro-app

# USAGE

    task-run "cro app", "cro-app", %(
      app => "app.raku",
    );

Tomtit

    tom --profile cro

# Parameters

## app

Entrypoint path. Optional. Default value is `app.raku`

# Author

Alexey Melezhik

