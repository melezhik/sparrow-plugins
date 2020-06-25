# raku-native-deps

Parses meta file of Raku module and return native dependencies as package names.

Warning!

The plugin only supports CentOS system for the moment ( more OS will be added eventually ) and is quite primitive.
It only handles `:from<native>` statements and does not use `System::Query` to handle platform specific sections.
I am going to gradually improve and change things.


# install

    s6 --install raku-native-deps

# usage


Cli:

    s6 --plg-run raku-native-deps@path=/path/to/meta.json

Api:

    my %state = task-run "get packages", "raku-native-deps", %(
      path => "META6.json"
    );

    for %state<packages><> -> $i {
      say "package: $i<package>"
    }

Example output:

    $  s6 --plg-run raku-native-deps@path=META6.json
    22:55:22 06/24/2020 [task] run plg raku-native-deps@path=META6.json
    22:55:22 06/24/2020 [task] run thing raku-native-deps
    22:55:24 06/24/2020 [raku-native-deps] parse META from META6.json ...
    22:55:24 06/24/2020 [raku-native-deps] parse curl .. 
    22:55:24 06/24/2020 [raku-native-deps] parse curl .. :ver<4>
    22:55:24 06/24/2020 [raku-native-deps] parse cmark .. :ver<0.23.0>
    22:55:24 06/24/2020 [raku-native-deps] libraries found
    22:55:24 06/24/2020 [raku-native-deps] ===========================
    22:55:24 06/24/2020 [raku-native-deps] ${:library("curl"), :version("")}
    22:55:24 06/24/2020 [raku-native-deps] ${:library("curl"), :version("4")}
    22:55:24 06/24/2020 [raku-native-deps] ${:library("cmark"), :version("0.23.0")}
    22:55:24 06/24/2020 [raku-native-deps] ===========================
    22:55:26 06/24/2020 [raku-native-deps] map library: [curl] version: [] to native package, os: [centos] ...
    22:55:26 06/24/2020 [raku-native-deps] ===>
    22:55:27 06/24/2020 [raku-native-deps] libcurl-0:7.29.0-57.el7.i686
    22:55:27 06/24/2020 [raku-native-deps] libcurl-0:7.29.0-57.el7.x86_64
    22:55:27 06/24/2020 [raku-native-deps] <===
    [task check] stdout match (r) <(\S+)> True
    22:55:28 06/24/2020 [raku-native-deps] map library: [curl] version: [4] to native package, os: [centos] ...
    22:55:28 06/24/2020 [raku-native-deps] ===>
    22:55:29 06/24/2020 [raku-native-deps] libcurl-0:7.29.0-57.el7.x86_64
    22:55:29 06/24/2020 [raku-native-deps] mdatp-0:100.87.66-1.x86_64
    22:55:29 06/24/2020 [raku-native-deps] mdatp-0:100.90.70-1.x86_64
    22:55:29 06/24/2020 [raku-native-deps] <===
    [task check] stdout match (r) <(\S+)> True
    22:55:29 06/24/2020 [raku-native-deps] map library: [cmark] version: [0.23.0] to native package, os: [centos] ...
    22:55:29 06/24/2020 [raku-native-deps] ===>
    22:55:30 06/24/2020 [raku-native-deps] cmark-lib-0:0.23.0-4.el7.x86_64
    22:55:30 06/24/2020 [raku-native-deps] <===
    [task check] stdout match (r) <(\S+)> True

# parameters

* `path`

Path to META spec file, optional.

* `arch`

Architecture. Optional, default value is `x86_64`


# author

Alexey Melezhik
