# SYNOPSIS

Read text from STDIN and send it by email as attached file.

# Description

A real [sendmail](https://en.wikipedia.org/wiki/Sendmail) should installed and configured properly so this plugin work.

# INSTALL

    $ s6 --install sendmail

# USAGE

## Manually

    $ echo OK | sparrow plg run sendmail  \
    --param from=melezhik@sparrowhub.org \
    --param to=melezhik@gmail.com \
    --param subject=hello-world


# Parameters

## from

Should be valid email address. Obligatory, no default value.

## to

Should be valid email address. Obligatory, no default value.

## subject

Should be email subject. Obligatory, no default value.

# See also

[sendmail](https://en.wikipedia.org/wiki/Sendmail)

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)



