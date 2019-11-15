#!perl6

bash "find  -maxdepth 2 -mindepth 2 -name sparrow.json -execdir s6 --upload \\;";
