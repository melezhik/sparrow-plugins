# SYNOPSIS

Fix pushed commits with wrong email

# INSTALL

    $ s6 --install git-fix-email

# USAGE

    $ s6 --install git-fix-email@email_from='wrong_email',email_to='correct_email',author='git author'

    $ git push -f origin master

# Dependencies

* git cli

# Platforms supported

Linux

# Author

Alexey Melezhik

