# SYNOPSIS

Checks scheduleled vsts builds

# INSTALL

    $ s6 --install vsts-schedule-build-check

# USAGE

Check if the last `WebApp` *scheduled* build succeeds for today:

    $ s6 --plg-run vsts-schedule-build-check@pattern=WebApp

Check if the last `WebApp` *scheduled* build succeeds for date:

    $ s6 --plg-run vsts-schedule-build-check@pattern=WebApp,date=2018-10-23

Check if the `last` WebApp build succeeds for today:

    $ s6 --plg-run vsts-schedule-build-check@pattern=WebApp,scheduled_only=off

Check if the `last` WebApp build succeeds:

    $ s6 --plg-run vsts-schedule-build-check@pattern=WebApp,scheduled_only=off,date=any

# Parameters

## dir

Directory containing VSTS local git repository, optional

## date

Check builds for given date. If date not set then date is `today`, if `date=any` then ignore date.

## scheduled_only

Check only scheduled builds. By default is set.


# Author

Alexey Melezhik

