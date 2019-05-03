# SYNOPSIS

Checks scheduleled vsts builds

# INSTALL

    $ s6 --install vsts-schedule-build-check

# USAGE

Check if the last `WebApp` *scheduled* build succeeds for today:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp

Check if the last `WebApp` *scheduled* build succeeds for date:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param date=2018-10-23

Check if the `last` WebApp build succeeds for today:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param scheduled_only=off

Check if the `last` WebApp build succeeds:

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param scheduled_only=off --param date=any

# Parameters

## dir

Directory containing VSTS local git repository, optional

## date

Check builds for given date. If date not set then date is `today`, if `date=any` then ignore date.

## scheduled_only

Check only scheduled builds. By default is set.


# Author

Alexey Melezhik

