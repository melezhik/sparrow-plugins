# SYNOPSIS

Get and print variable group in convenient way.

# INSTALL

    $ s6 --install ado-read-variable-groups

# USAGE

  my %state = task-run "read my vars", "ado-read-variable-groups", %(
    project => "CoolKids"
    group_id => 1234,
    user  => "buddy",
    token => "paSworRdd"
  );

  say %state<list>.perl;

# Parameters

## project

Ado project

## group_id

  Group Variable ID

## user

Ado user, used for authentication

## token

Ado token, used for authentication

## debug

Enable debug mode to print http request data

# Requirements

curl

# Author

Alexey Melezhik

