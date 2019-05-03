# SYNOPSIS

Minify a JavaScript file by using [JavaScript::Minifier](https://metacpan.org/pod/JavaScript::Minifier).

# INSTALL

    $ s6 --install js-minify

# USAGE

CLI:

    $ sparrow plg run js-minify \
    --param in=/path/to/in-file.js \
    --param out=/path/to/out-file.js

Via sparrowdo:

    task-run 'js minifier', 'js-minify', %(
        in  => 'in.js',      
        out => '/tmp/out.js',      
    );
    

# Author

Alexey Melezhik

# See also

[JavaScript::Minifier](https://metacpan.org/pod/JavaScript::Minifier)
