# SYNOPSIS

Minify a JavaScript file by using [JavaScript::Minifier](https://metacpan.org/pod/JavaScript::Minifier).

# INSTALL

    $ s6 --install js-minify

# USAGE

Cli:

    $ s6 --plg-run js-minify@in=/path/to/in-file.js,out=/path/to/out-file.js

Raku:

    task-run 'js minifier', 'js-minify', %(
        in  => 'in.js',
        out => '/tmp/out.js',
    );

# Author

Alexey Melezhik

# See also

[JavaScript::Minifier](https://metacpan.org/pod/JavaScript::Minifier)
