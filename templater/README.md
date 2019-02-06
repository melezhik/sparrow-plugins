# SYNOPSIS

Simple templater based on [Template-Toolkit](http://template-toolkit.org) engine.

# INSTALL

    $ sparrow plg install templater

# USAGE

## Via sparrowdo

    $ cat sparrowfile
    
    task-run 'greetings file', 'templater', %(
      variables => %(
        name => 'sparrowdo',
        language => 'perl6'
      ),
      target  => '/etc/greetings.out',
      owner   => 'user',
      group   => 'user'
      mode    => '644',
      source  => slurp 'templates/greetings.tmpl'
    );
    
  
    $ cat templates/greetings.tmp
  
    Hello, my name is [% name %]!
    I speak [% language %]
    

# Parameters

## variables

A list of variables get passed into template. No default value. Optional.

## target

A file path to write a rendered template to. No default value. Should be set.

## owner

Sets a target ownership to owner. No default value. Optional.

## group

Sets a target group to group. No default value. Optional.

## on_change

Sets the command to be executed when file changes:

    task-run 'populate config', 'templater', %(
      variables => %(
        name => 'sparrowdo ...',
        language => 'perl6'
      ),
      on_change => "echo trigger run",
      target  => '/tmp/out.txt',
      source  => slurp 'examples/foo.tmpl'
    );
  

# Author

Alexey Melezhik

# See also

[Template-Toolkit](http://template-toolkit.org)
