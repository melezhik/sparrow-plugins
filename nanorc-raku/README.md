# nanorc-raku

Installs Raku nanorc syntax highlighter

# install

    $ s6 --install nanorc-raku

Raku

    task-run "install", "nanorc-raku", %(
        homebrew_base => "{%*ENV<HOME>}/homebrew"
    );

# Parameters

* `homebrew_base`

Homebrew installation base. Optional. Default value is `{%*ENV<HOME>}/homebrew`

# Requirements

curl

# os supported

* `Darwin`

I am going to add more OS support soon. 

# author

Alexey Melezhik


