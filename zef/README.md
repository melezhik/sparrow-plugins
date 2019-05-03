# SYNOPSIS

Wrapper for [zef](https://github.com/ugexe/zef) installer.


# INSTALL

    $ s6 --install zef


# USAGE

It's better to run it via ducky:


    $ cat ducky.json

    {
      "task" : "install from CWD",
      "plugin" : "zef",
      "data" : {
        "list" : [
          "."
        ]
      }
    },
    {
      "task" : "install 2 modules",
      "plugin" : "zef",
      "data" : {
        "list" : [
          "Sparrowdo::Sparrow::Update",
          "Sparrowdo::Cpanm::GitHub"
        ]
      }
    },
    {
      "task" : "JSON::Unmarshal force install",
      "plugin" : "zef",
      "data" : {
        "options" : "--force",
        "list" : [
          "JSON::Unmarshal"
        ]
      }
    }
  
# Author

Alexey Melezhik

