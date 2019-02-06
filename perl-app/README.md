# SYNOPSIS

Installs Perl psgi application and dependencies, runs application as ubic service with Starman.

# INSTALL

    $ sudo sparrow plg install perl-app

# Prerequisites

A following packages should be installed so this plugin works properly:

* git client 
* cpanm
* carton

# USAGE

    $ sudo sparrow plg run perl-app --param app_source_url={git-remote-repository-url}

# Plugin parameters:

## app_source_url

Application source code remote git url, no default value, obligatory parameter

## git_branch 

Git branch name, default value is `master`

## app_user 

Application user name, perl application will be run with this user privileges, default value is  `perl-app`

## app_dir 

Home directory for application source code and dependencies get installed by carton, default value is `/opt/perl-app/`

## app_script

Name of application script to be run, default value is `app.psgi`


## http_port

A http port application web service will be listen to, default value is `5000`


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
