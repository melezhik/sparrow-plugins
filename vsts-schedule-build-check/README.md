# SYNOPSIS

Checks scheduleled vsts builds

# INSTALL

    $ sparrow plg install vsts-schedule-build-check

# USAGE

    # 1) Find the build named WebApp and check that it succeeds for today
    # 2) Find the build named WebApp and check that there is no failures for today

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param dir=$PWD


    # The same as above but for the date `2018-10-23`

    $ sparrow plg run vsts-schedule-build-check --param pattern=WebApp --param date=2018-10-23 --param dir=$PWD

# Author

Alexey Melezhik

