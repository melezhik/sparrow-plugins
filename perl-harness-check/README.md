# SYNOPSIS

Run tests against Perl test harness report

# Perl versions supported

* 5.20.1

Let me know if you want to support another Perl version.

# OS supported

* minoca

Let me know if you want support another OS.


# INSTALL


    $ sparrow plg install perl-harness-check


# USAGE

    $ cd /your/perl/source/distribution && make test 1>perl-test-report.txt 2>&1 # run perl test harness
    $ cat perl-test-report.txt | sparrow plg run perl-harness-check # verify test report 

![perl harness check screenshot](https://raw.githubusercontent.com/melezhik/perl-harness-check/master/perl-harness-check.png)

# Configuration

## os

Sets OS name for target server. Obligatory. Default value is `minoca`. 

## perl_version

Sets perl version. Obligatory. Default value is `5.20.1`


# Workflow

At the beginning you've got some tests are passed and some are failed. It's ok. 
Succeeded perl tests are listed in  `default pass list` at [plugin default configuration 
file](https://github.com/melezhik/perl-harness-check/blob/master/suite.ini).



Afterwards you fix some OS level bugs and believe that a related perl test issues should be gone, you can run:

  
    $ cd /your/perl/source/distribution && make test 1>perl-test-report.txt 2>&1

    $ cat perl-test-report.txt | sparrow plg run perl-harness-check --param should_pass=ext/POSIX/t/time.t 

    $ cat perl-test-report.txt | sparrow plg run perl-harness-check --param should_pass=io/fs.t 

    # two previous in one step:
    $ cat perl-test-report.txt | sparrow plg run perl-harness-check --param should_pass=io/fs.t,ext/POSIX/t/time.t 


Ok if you really see that bugs are gone you may do one of two things:

* create pull request to add succeeded tests to `default pass list`.

* create `custom pass list`

## Custom pass lists

Alternatively you may set custom list of successful tests:

    $ sparrow project create minoca

    $ sparrow task add minoca perl perl-harness-check 

    $ sparrow task ini minoca/perl

    <custom_pass_list>
      io/fs.t
      ext/POSIX/t/time.t
    </custom_pass_list>

Once list is ready run sparrow task:

    $ cat perl-test-report.txt | sparrow task run minoca/perl


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


