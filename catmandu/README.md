# SYNOPSIS

Simple wrapper for [Catmandu cli](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)


# INSTALL

    $ s6 --install catmandu

# USAGE

    $ s6 --task-set utils/json-to-yaml

    task-run "convert json to yaml", "catmandu", %(
      in => '/path/to/file.json',
      out => '/path/to/file.yaml',
      args => [ 'convert', 'JSON', 'to', 'YAML' ]
    );

    $ s6 --task-run utils/json-to-yaml

For catmandu parameters follow [Catmandu documentation](https://metacpan.org/pod/distribution/Catmandu/bin/catmandu)

# Author

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



