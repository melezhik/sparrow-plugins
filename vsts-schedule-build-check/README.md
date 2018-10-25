# SYNOPSIS

Checks scheduleled vsts builds

# INSTALL

    $ sparrow plg install vsts-schedule-build-check

# USAGE

Check if the last `WebApp` *scheduled* build succeeds for today:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp

Check if the last `WebApp` *scheduled* build succeeds for date:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param date=2018-10-23

Check if the `last` WebApp build succeeds for today:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param scheduled_only=off

# Parameters

## dir

Directory containing VSTS local git repository, optional

## date

Check builds for given date, if not set date=today

## scheduled_only

Check only scheduled builds. By default is set.


# Author

Alexey Melezhik

