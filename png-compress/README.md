# SYNOPSIS

Compress PNG images by using [GD](https://metacpan.org/pod/GD) library.

# INSTALL

    $ s6 --install png-compress

# USAGE

CLI:

    $ sparrow plg run png-compress \
    --param in=/path/to/in-file.png \
    --param out=/path/to/out-file.png \
    --param compression=5

Via sparrowdo:

    task-run 'compress PNG image', 'png-compress', %(
        in  => 'in.png',      
        out => '/tmp/out.png',
        compression => 5      
    );
    

# Author

Alexey Melezhik

# See also

[GD](https://metacpan.org/pod/GD) library.
