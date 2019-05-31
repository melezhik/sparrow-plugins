# SYNOPSIS

Compress PNG images by using [GD](https://metacpan.org/pod/GD) library.

# INSTALL

    $ s6 --install png-compress

# USAGE

CLI:

    $ s6 --plg-run png-compress@\
    ,in=/path/to/in-file.png\
    ,out=/path/to/out-file.png\
    ,compression=5

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
