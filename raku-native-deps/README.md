# raku-native-deps

Parses meta file of Raku module and return native dependencies as package names.

# install

    s6 --install raku-native-deps

# usage


Cli
    s6 --plg-run raku-native-deps@path=/path/to/meta.json

Api

    my %state = task-run "get packages", "raku-native-deps", %(
      path => "META6.json"
    );

    for %state<packages><> {
      say "package: $i<package>"
    }

Example output

    $ s6 --plg-run raku-native-deps@path=META6.json
    21:37:11 06/24/2020 [get packages] parse META from META6.json ...
    21:37:11 06/24/2020 [get packages] parse curl .. 
    21:37:11 06/24/2020 [get packages] parse curl .. :ver<4>
    21:37:11 06/24/2020 [get packages] parse cmark .. :ver<0.23.0>
    21:37:11 06/24/2020 [get packages] libraries found
    21:37:11 06/24/2020 [get packages] ===========================
    21:37:11 06/24/2020 [get packages] ${:library("curl"), :version("")}
    21:37:11 06/24/2020 [get packages] ${:library("curl"), :version("4")}
    21:37:11 06/24/2020 [get packages] ${:library("cmark"), :version("0.23.0")}
    21:37:11 06/24/2020 [get packages] ===========================
    21:37:13 06/24/2020 [get packages] map library: [curl] version: [] to native package, os: [centos] ...
    21:37:13 06/24/2020 [get packages] ===>
    21:37:13 06/24/2020 [get packages] libcurl-0:7.29.0-57.el7.i686
    21:37:13 06/24/2020 [get packages] libcurl-0:7.29.0-57.el7.x86_64
    21:37:13 06/24/2020 [get packages] <===
    [task check] stdout match (r) <(\S+)> True
    [task check] push libcurl-0:7.29.0-57.el7.i686 ...
    [task check] push libcurl-0:7.29.0-57.el7.x86_64 ...
    21:37:15 06/24/2020 [get packages] map library: [curl] version: [4] to native package, os: [centos] ...
    21:37:15 06/24/2020 [get packages] ===>
    21:37:15 06/24/2020 [get packages] libcurl-0:7.29.0-57.el7.x86_64
    21:37:15 06/24/2020 [get packages] mdatp-0:100.87.66-1.x86_64
    21:37:15 06/24/2020 [get packages] mdatp-0:100.90.70-1.x86_64
    21:37:15 06/24/2020 [get packages] <===
    [task check] stdout match (r) <(\S+)> True
    [task check] push libcurl-0:7.29.0-57.el7.x86_64 ...
    [task check] push mdatp-0:100.87.66-1.x86_64 ...
    [task check] push mdatp-0:100.90.70-1.x86_64 ...
    21:37:16 06/24/2020 [get packages] map library: [cmark] version: [0.23.0] to native package, os: [centos] ...
    21:37:16 06/24/2020 [get packages] ===>
    21:37:16 06/24/2020 [get packages] cmark-lib-0:0.23.0-4.el7.x86_64
    21:37:16 06/24/2020 [get packages] <===
    [task check] stdout match (r) <(\S+)> True
    [task check] push cmark-lib-0:0.23.0-4.el7.x86_64 ...
    

# author

Alexey Melezhik
