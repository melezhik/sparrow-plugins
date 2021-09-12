# SYNOPSIS

Simple cro yaml file generator

# INSTALL

    $ s6 --install cro-yaml

# USAGE

    task-run "cro-yaml", "cro-yaml", %(
      app => "app.raku",
      id => "web_app",
      name => "my web app",
    );

Tomtit

    tom --profile cro

# Parameters

## app

Entrypoint path. Optional. Default value is `app.raku`

## id

Application id. Required

## name

Application description

# Author

Alexey Melezhik

