# SYNOPSIS

Regenerate mi6 `dist.ini` and `.gitignore` files for Perl6 project.

* Dist.ini - used for [mi6](https://github.com/skaji/mi6) CPAN uploader
* Gitignore - hide from git some files that are not meant for git consumption (*.tar.gz, so on )


# INSTALL

    $ sparrow plg install mi6-dist-ini


# USAGE 

    $ sparrow plg run mi6-dist-ini --cwd $PWD \
    --param module=My::Module

# Author

Alexey Melezhik

