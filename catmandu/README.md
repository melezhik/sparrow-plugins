# SYNOPSIS

Simple wrapper for [Catmandu cli](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)


# INSTALL

    $ s6 --install catmandu

# USAGE

Basic usage:

    $ s6 --plg-run catmandu  <params> -- <catmandu-params>

For example:

    # read data from stdin and write to stdout
    $ s6 --plg-run catmandu -- convert JSON to YAML

    # read data from /path/to/file.json  and write to /path/to/file.yaml
    $ s6 --plg-run catmandu@\
    ,in=/path/to/file.json\
    ,out=/path/to/file.yaml\
    -- convert JSON to YAML

For catmandu parameters follow [Catmandu documentation](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)

# Automation

By sparrow tasks:

/catmandu/README

/catmandu/README

    $ s6 --task-set utils/json-to-yaml

      ---
      out: /path/to/file.yaml
      args: 
        - convert 
        - JSON
        - to
        - YAML

    $ s6 --task-run utils/json-to-yaml,in=/path/to/file.json


Or if you prefer remote run, use Sparrowdo:

    $ cat sparrowfile

    task-run "convert json to yaml", "catmandu", %(
      in => '/path/to/file.json',
      out => '/path/to/file.yaml',
      args => (
        ( 'convert', 'JSON', 'to', 'YAML')
      )
    );


    $ sparrowdo --host=$host # run on remote host

# Author

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



