my $bin = "pod-weave";
my $plg-name = "raku-utils-{$bin}";
my $module-name = "Pod::Weave";
my $gh-url = "https://github.com/codesections/pod-weave";
my $version = "0.0.1";

my $desc = "Sparrow plugin for {$module-name} {$bin} utility";

directory $plg-name;

template-create "{$plg-name}/sparrow.json", %(
  source => ".tom/templates/sparrow.json".IO.slurp,
  variables => %(
    name => $plg-name,
    module => $module-name,
    url => $gh-url,
    desc => $desc,
    version => $version,
  ),
);

template-create "{$plg-name}/README.md", %(
  source => ".tom/templates/README.md".IO.slurp,
  variables => %(
    name => $plg-name,
    module => $module-name,
    url => $gh-url,
    desc => $desc,
    bin => $bin
  ),
);

file "{$plg-name}/rakufile", %(
  content => "{$module-name} --/test"
);

file "{$plg-name}/task.bash", %(
  content => "set -e\nargs=\$(config args)\nset -x\n{$bin} \$args"
);
