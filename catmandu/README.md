# SYNOPSIS

Simple wrapper for [Catmandu cli](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)


# INSTALL

    $ sparrow plg install catmandu

# USAGE

Basic usage:

    $ sparrow plg run catmandu  <params> -- <catmandu-params>

For example:

    # read data from stdin and write to stdout
    $ sparrow plg run catmandu -- convert JSON to YAML

    # read data from /path/to/file.json  and write to /path/to/file.yaml
    $ sparrow plg run catmandu \
    --param in=/path/to/file.json \
    --param out=/path/to/file.yaml \
    -- convert JSON to YAML

For catmandu parameters follow [Catmandu documentation](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)

# Automation

By sparrow tasks:

    $ sparrow project create utils

    $ sparrow task add utils json-to-yaml catmandu

    $ sparrow task ini utils/json-to-yaml

      ---
      out: /path/to/file.yaml
      args: 
        - convert 
        - JSON
        - to
        - YAML

    $ sparrow task run utils/json-to-yaml --param in=/path/to/file.json


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



