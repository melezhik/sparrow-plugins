my $bin = config()<bin>;
my $plg-name = "raku-utils-{$bin}";
my $module-name = config()<module-name>;
my $url = config()<url>;
my $version = config()<version>;

my $desc = config()<description>;

directory $plg-name;

template-create "{$plg-name}/sparrow.json", %(
  source => ".tom/templates/sparrow.json".IO.slurp,
  variables => %(
    name => $plg-name,
    module => $module-name,
    url => $url,
    desc => $desc,
    version => $version,
  ),
);

template-create "{$plg-name}/README.md", %(
  source => ".tom/templates/README.md".IO.slurp,
  variables => %(
    name => $plg-name,
    module => $module-name,
    url => $url,
    desc => $desc,
    bin => $bin
  ),
);

directory "{$plg-name}/.tomty";

template-create "{$plg-name}/.tomty/test.pl6", %(
  source => ".tom/templates/test.pl6".IO.slurp,
  variables => %(
    name => $plg-name,
    bin => $bin
  ),
);

file "{$plg-name}/rakufile", %(
  content => "{$module-name} --/test"
);

file "{$plg-name}/task.bash", %(
  content => "set -e\nargs=\$(config args)\nset -x\n{$bin} \$args"
);

file "{$plg-name}/config.yaml", %(
  content => "args: \"--help\""
);
