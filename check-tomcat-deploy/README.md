# SYNOPSIS

Reads tomcat logs and checks if war files get deployed successfully

# INSTALL


    $ s6 --install check-tomcat-deploy

# Prerequisites

A tail utility should be installed as it gets used to retrieve data from log file.
 

# USAGE


## Manually

    $ sparrow plg run check-tomcat-deploy --param war='foo#bar.war,services.war' --param tomcat-version=7

## Sparrowdo


    $ cat sparrowfile

    use v6;

    use Sparrowdo;


    task_run %(
      task => 'verify tomcat deploy',
      plugin => 'check-tomcat-deploy',
      parameters => %(
        tomcat-version => '7',
        war => 'foo#bar.war,services.war'
       )
    );


# Parameters

## tomcat-version

Int, version of tomcat server, for example: 7.

## war

A comma separated list of the war files to get deployed, should not include a directory paths, only war file names.

For example for war files named foo#bar.war and baz.war:

    'foo#bar.war,baz.war'

## file

An optional parameter, you may alternatively sets path to tomcat log file as `file` parameter.

For example:

    file /var/log/apps/catalina.out

If not set a path to tomcat log file gets resolved as:

    /var/log/tomcat<$tomcat-version>/catalina.out    

## lines

Sets the number of lines to read from log file. Default value is `200`.

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
